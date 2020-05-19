package run.halo.app.service.impl;

import com.google.common.base.Objects;
import lombok.extern.slf4j.Slf4j;
import org.springframework.data.domain.Sort;
import org.springframework.lang.NonNull;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;
import org.springframework.util.Assert;
import org.springframework.util.CollectionUtils;
import run.halo.app.exception.AlreadyExistsException;
import run.halo.app.exception.NotFoundException;
import run.halo.app.model.dto.SpecialDTO;
import run.halo.app.model.entity.Special;
import run.halo.app.model.vo.SpecialVO;
import run.halo.app.repository.SpecialRepository;
import run.halo.app.service.SpecialService;
import run.halo.app.service.OptionService;
import run.halo.app.service.PostSpecialService;
import run.halo.app.service.base.AbstractCrudService;
import run.halo.app.utils.ServiceUtils;

import java.util.Collections;
import java.util.LinkedList;
import java.util.List;
import java.util.stream.Collectors;

import static run.halo.app.model.support.HaloConst.URL_SEPARATOR;

/**
 * SpecialService implementation class.
 *
 * @author ryanwang
 * @author johnniang
 * @date 2019-03-14
 */
@Slf4j
@Service
public class SpecialServiceImpl extends AbstractCrudService<Special, Integer> implements SpecialService {

    private final SpecialRepository categoryRepository;

    private final PostSpecialService postSpecialService;

    private final OptionService optionService;

    public SpecialServiceImpl(SpecialRepository categoryRepository,
                              PostSpecialService postSpecialService,
                              OptionService optionService) {
        super(categoryRepository);
        this.categoryRepository = categoryRepository;
        this.postSpecialService = postSpecialService;
        this.optionService = optionService;
    }

    @Override
    @Transactional
    public Special create(Special category) {
        Assert.notNull(category, "Special to create must not be null");

        // Check the category name
        long count = categoryRepository.countByName(category.getName());

        if (count > 0) {
            log.error("Special has exist already: [{}]", category);
            throw new AlreadyExistsException("该分类已存在");
        }

        // Check parent id
        if (!ServiceUtils.isEmptyId(category.getParentId())) {
            count = categoryRepository.countById(category.getParentId());

            if (count == 0) {
                log.error("Parent category with id: [{}] was not found, category: [{}]", category.getParentId(), category);
                throw new NotFoundException("Parent category with id = " + category.getParentId() + " was not found");
            }
        }

        // Create it
        return super.create(category);
    }

    @Override
    public List<SpecialVO> listAsTree(Sort sort) {
        Assert.notNull(sort, "Sort info must not be null");

        // List all category
        List<Special> specials = listAll(sort);

        if (CollectionUtils.isEmpty(specials)) {
            return Collections.emptyList();
        }

        // Create top category
        SpecialVO topLevelSpecial = createTopLevelSpecial();

        // Concrete the tree
        concreteTree(topLevelSpecial, specials);

        return topLevelSpecial.getChildren();
    }

    /**
     * Concrete category tree.
     *
     * @param parentSpecial parent category vo must not be null
     * @param specials     a list of category
     */
    private void concreteTree(SpecialVO parentSpecial, List<Special> specials) {
        Assert.notNull(parentSpecial, "Parent category must not be null");

        if (CollectionUtils.isEmpty(specials)) {
            return;
        }

        // Get children for removing after
        List<Special> children = specials.stream()
            .filter(category -> Objects.equal(parentSpecial.getId(), category.getParentId()))
            .collect(Collectors.toList());

        children.forEach(category -> {
            // Convert to child category vo
            SpecialVO child = new SpecialVO().convertFrom(category);
            // Init children if absent
            if (parentSpecial.getChildren() == null) {
                parentSpecial.setChildren(new LinkedList<>());
            }

            StringBuilder fullPath = new StringBuilder();

            if (optionService.isEnabledAbsolutePath()) {
                fullPath.append(optionService.getBlogBaseUrl());
            }

            fullPath.append(URL_SEPARATOR)
                .append(optionService.getSpecialsPrefix())
                .append(URL_SEPARATOR)
                .append(child.getSlug())
                .append(optionService.getPathSuffix());

            child.setFullPath(fullPath.toString());

            // Add child
            parentSpecial.getChildren().add(child);
        });

        // Remove all child specials
        specials.removeAll(children);

        // Foreach children vos
        if (!CollectionUtils.isEmpty(parentSpecial.getChildren())) {
            parentSpecial.getChildren().forEach(childSpecial -> concreteTree(childSpecial, specials));
        }
    }

    /**
     * Creates a top level category.
     *
     * @return top level category with id 0
     */
    @NonNull
    private SpecialVO createTopLevelSpecial() {
        SpecialVO topSpecial = new SpecialVO();
        // Set default value
        topSpecial.setId(0);
        topSpecial.setChildren(new LinkedList<>());
        topSpecial.setParentId(-1);

        return topSpecial;
    }

    @Override
    public Special getBySlug(String slug) {
        return categoryRepository.getBySlug(slug).orElse(null);
    }

    @Override
    public Special getBySlugOfNonNull(String slug) {
        return categoryRepository.getBySlug(slug).orElseThrow(() -> new NotFoundException("查询不到该分类的信息").setErrorData(slug));
    }

    @Override
    public Special getByName(String name) {
        return categoryRepository.getByName(name).orElse(null);
    }

    @Override
    @Transactional
    public void removeSpecialAndPostSpecialBy(Integer categoryId) {
        List<Special> specials = listByParentId(categoryId);
        if (null != specials && specials.size() > 0) {
            specials.forEach(category -> {
                category.setParentId(0);
                update(category);
            });
        }
        // Remove category
        removeById(categoryId);
        // Remove post specials
        postSpecialService.removeBySpecialId(categoryId);
    }

    @Override
    public List<Special> listByParentId(Integer id) {
        Assert.notNull(id, "Parent id must not be null");
        return categoryRepository.findByParentId(id);
    }

    @Override
    public SpecialDTO convertTo(Special category) {
        Assert.notNull(category, "Special must not be null");

        SpecialDTO categoryDTO = new SpecialDTO().convertFrom(category);

        StringBuilder fullPath = new StringBuilder();

        if (optionService.isEnabledAbsolutePath()) {
            fullPath.append(optionService.getBlogBaseUrl());
        }

        fullPath.append(URL_SEPARATOR)
            .append(optionService.getSpecialsPrefix())
            .append(URL_SEPARATOR)
            .append(category.getSlug())
            .append(optionService.getPathSuffix());

        categoryDTO.setFullPath(fullPath.toString());

        return categoryDTO;
    }

    @Override
    public List<SpecialDTO> convertTo(List<Special> specials) {
        if (CollectionUtils.isEmpty(specials)) {
            return Collections.emptyList();
        }

        return specials.stream()
            .map(this::convertTo)
            .collect(Collectors.toList());
    }
}
