package run.halo.app.service.impl;

import org.springframework.data.domain.Page;
import org.springframework.data.domain.Pageable;
import org.springframework.data.domain.Sort;
import org.springframework.stereotype.Service;
import org.springframework.util.Assert;
import org.springframework.util.CollectionUtils;
import run.halo.app.exception.NotFoundException;
import run.halo.app.model.dto.SpecialWithPostCountDTO;
import run.halo.app.model.entity.Special;
import run.halo.app.model.entity.Post;
import run.halo.app.model.entity.PostSpecial;
import run.halo.app.model.enums.PostStatus;
import run.halo.app.model.projection.SpecialPostCountProjection;
import run.halo.app.repository.PostSpecialRepository;
import run.halo.app.repository.SpecialRepository;
import run.halo.app.repository.PostRepository;
import run.halo.app.service.OptionService;
import run.halo.app.service.PostSpecialService;
import run.halo.app.service.base.AbstractCrudService;
import run.halo.app.utils.ServiceUtils;

import java.util.*;
import java.util.stream.Collectors;

import static run.halo.app.model.support.HaloConst.URL_SEPARATOR;

/**
 * Post special service implementation.
 *
 * @author johnniang
 * @author ryanwang
 * @author guqing
 * @date 2019-03-19
 */
@Service
public class PostSpecialServiceImpl extends AbstractCrudService<PostSpecial, Integer> implements PostSpecialService {

    private final PostSpecialRepository postSpecialRepository;

    private final PostRepository postRepository;

    private final SpecialRepository specialRepository;

    private final OptionService optionService;

    public PostSpecialServiceImpl(PostSpecialRepository postSpecialRepository,
                                  PostRepository postRepository,
                                  SpecialRepository specialRepository,
                                  OptionService optionService) {
        super(postSpecialRepository);
        this.postSpecialRepository = postSpecialRepository;
        this.postRepository = postRepository;
        this.specialRepository = specialRepository;
        this.optionService = optionService;
    }

    @Override
    public List<Special> listSpecialsBy(Integer postId) {
        Assert.notNull(postId, "Post id must not be null");

        // Find all special ids
        Set<Integer> specialIds = postSpecialRepository.findAllSpecialIdsByPostId(postId);

        return specialRepository.findAllById(specialIds);
    }

    @Override
    public Map<Integer, List<Special>> listSpecialListMap(Collection<Integer> postIds) {
        if (CollectionUtils.isEmpty(postIds)) {
            return Collections.emptyMap();
        }

        // Find all post specials
        List<PostSpecial> postSpecials = postSpecialRepository.findAllByPostIdIn(postIds);

        // Fetch special ids
        Set<Integer> specialIds = ServiceUtils.fetchProperty(postSpecials, PostSpecial::getSpecialId);

        // Find all specials
        List<Special> specials = specialRepository.findAllById(specialIds);

        // Convert to special map
        Map<Integer, Special> specialMap = ServiceUtils.convertToMap(specials, Special::getId);

        // Create special list map
        Map<Integer, List<Special>> specialListMap = new HashMap<>();

        // Foreach and collect
        postSpecials.forEach(postSpecial -> specialListMap.computeIfAbsent(postSpecial.getPostId(), postId -> new LinkedList<>())
            .add(specialMap.get(postSpecial.getSpecialId())));

        return specialListMap;
    }

    @Override
    public List<Post> listPostBy(Integer specialId) {
        Assert.notNull(specialId, "Special id must not be null");

        // Find all post ids
        Set<Integer> postIds = postSpecialRepository.findAllPostIdsBySpecialId(specialId);

        return postRepository.findAllById(postIds);
    }

    @Override
    public List<Post> listPostBy(Integer specialId, PostStatus status) {
        Assert.notNull(specialId, "Special id must not be null");
        Assert.notNull(status, "Post status must not be null");

        // Find all post ids
        Set<Integer> postIds = postSpecialRepository.findAllPostIdsBySpecialId(specialId, status);

        return postRepository.findAllById(postIds);
    }

    @Override
    public List<Post> listPostBy(String slug, PostStatus status) {
        Assert.notNull(slug, "Special slug must not be null");
        Assert.notNull(status, "Post status must not be null");

        Special special = specialRepository.getBySlug(slug).orElseThrow(() -> new NotFoundException("查询不到该分类的信息").setErrorData(slug));

        Set<Integer> postsIds = postSpecialRepository.findAllPostIdsBySpecialId(special.getId(), status);

        return postRepository.findAllById(postsIds);
    }

    @Override
    public Page<Post> pagePostBy(Integer specialId, Pageable pageable) {
        Assert.notNull(specialId, "Special id must not be null");
        Assert.notNull(pageable, "Page info must not be null");

        // Find all post ids
        Set<Integer> postIds = postSpecialRepository.findAllPostIdsBySpecialId(specialId);

        return postRepository.findAllByIdIn(postIds, pageable);
    }

    @Override
    public Page<Post> pagePostBy(Integer specialId, PostStatus status, Pageable pageable) {
        Assert.notNull(specialId, "Special id must not be null");
        Assert.notNull(status, "Post status must not be null");
        Assert.notNull(pageable, "Page info must not be null");

        // Find all post ids
        Set<Integer> postIds = postSpecialRepository.findAllPostIdsBySpecialId(specialId, status);

        return postRepository.findAllByIdIn(postIds, pageable);
    }

    @Override
    public List<PostSpecial> mergeOrCreateByIfAbsent(Integer postId, Set<Integer> specialIds) {
        Assert.notNull(postId, "Post id must not be null");

        if (CollectionUtils.isEmpty(specialIds)) {
            return Collections.emptyList();
        }

        // Build post specials
        List<PostSpecial> postSpecialsStaging = specialIds.stream().map(specialId -> {
            PostSpecial postSpecial = new PostSpecial();
            postSpecial.setPostId(postId);
            postSpecial.setSpecialId(specialId);
            return postSpecial;
        }).collect(Collectors.toList());

        List<PostSpecial> postSpecialsToCreate = new LinkedList<>();
        List<PostSpecial> postSpecialsToRemove = new LinkedList<>();

        // Find all exist post specials
        List<PostSpecial> postSpecials = postSpecialRepository.findAllByPostId(postId);

        postSpecials.forEach(postSpecial -> {
            if (!postSpecialsStaging.contains(postSpecial)) {
                postSpecialsToRemove.add(postSpecial);
            }
        });

        postSpecialsStaging.forEach(postSpecialStaging -> {
            if (!postSpecials.contains(postSpecialStaging)) {
                postSpecialsToCreate.add(postSpecialStaging);
            }
        });

        // Remove post specials
        removeAll(postSpecialsToRemove);

        // Remove all post specials need to remove
        postSpecials.removeAll(postSpecialsToRemove);

        // Add all created post specials
        postSpecials.addAll(createInBatch(postSpecialsToCreate));

        // Create them
        return postSpecials;
    }

    @Override
    public List<PostSpecial> listByPostId(Integer postId) {
        Assert.notNull(postId, "Post id must not be null");

        return postSpecialRepository.findAllByPostId(postId);
    }

    @Override
    public List<PostSpecial> listBySpecialId(Integer specialId) {
        Assert.notNull(specialId, "Special id must not be null");

        return postSpecialRepository.findAllBySpecialId(specialId);
    }

    @Override
    public Set<Integer> listSpecialIdsByPostId(Integer postId) {
        Assert.notNull(postId, "Post id must not be null");

        return postSpecialRepository.findAllSpecialIdsByPostId(postId);
    }

    @Override
    public List<PostSpecial> removeByPostId(Integer postId) {
        Assert.notNull(postId, "Post id must not be null");

        return postSpecialRepository.deleteByPostId(postId);
    }

    @Override
    public List<PostSpecial> removeBySpecialId(Integer specialId) {
        Assert.notNull(specialId, "Special id must not be null");

        return postSpecialRepository.deleteBySpecialId(specialId);
    }

    @Override
    public List<SpecialWithPostCountDTO> listSpecialWithPostCountDto(Sort sort) {
        Assert.notNull(sort, "Sort info must not be null");

        List<Special> specials = specialRepository.findAll(sort);

        // Query special post count
        Map<Integer, Long> specialPostCountMap = ServiceUtils.convertToMap(postSpecialRepository.findPostCount(), SpecialPostCountProjection::getSpecialId, SpecialPostCountProjection::getPostCount);

        // Convert and return
        return specials.stream()
            .map(special -> {
                // Create special post count dto
                SpecialWithPostCountDTO specialWithPostCountDTO = new SpecialWithPostCountDTO().convertFrom(special);
                // Set post count
                specialWithPostCountDTO.setPostCount(specialPostCountMap.getOrDefault(special.getId(), 0L));

                StringBuilder fullPath = new StringBuilder();

                if (optionService.isEnabledAbsolutePath()) {
                    fullPath.append(optionService.getBlogBaseUrl());
                }

                fullPath.append(URL_SEPARATOR)
                    .append(optionService.getSpecialsPrefix())
                    .append(URL_SEPARATOR)
                    .append(special.getSlug())
                    .append(optionService.getPathSuffix());

                specialWithPostCountDTO.setFullPath(fullPath.toString());

                return specialWithPostCountDTO;
            })
            .collect(Collectors.toList());
    }
}
