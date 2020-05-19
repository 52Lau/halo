package run.halo.app.controller.content.model;

import org.apache.commons.lang3.StringUtils;
import org.springframework.data.domain.Page;
import org.springframework.data.domain.PageRequest;
import org.springframework.data.domain.Pageable;
import org.springframework.data.domain.Sort;
import org.springframework.stereotype.Component;
import org.springframework.ui.Model;
import run.halo.app.model.dto.SpecialDTO;
import run.halo.app.model.entity.Special;
import run.halo.app.model.entity.Post;
import run.halo.app.model.enums.PostStatus;
import run.halo.app.model.vo.PostListVO;
import run.halo.app.service.*;

import static org.springframework.data.domain.Sort.Direction.DESC;

/**
 * Special Model.
 *
 * @author ryanwang
 * @date 2020-01-11
 */
@Component
public class SpecialModel {

    private final SpecialService specialService;

    private final ThemeService themeService;

    private final PostSpecialService postSpecialService;

    private final PostService postService;

    private final OptionService optionService;

    public SpecialModel(SpecialService specialService, ThemeService themeService, PostSpecialService postSpecialService, PostService postService, OptionService optionService) {
        this.specialService = specialService;
        this.themeService = themeService;
        this.postSpecialService = postSpecialService;
        this.postService = postService;
        this.optionService = optionService;
    }

    /**
     * List specials.
     *
     * @param model model
     * @return template name
     */
    public String list(Model model) {
        model.addAttribute("is_specials", true);
        model.addAttribute("meta_keywords", optionService.getSeoKeywords());
        model.addAttribute("meta_description", optionService.getSeoDescription());
        return themeService.render("specials");
    }

    /**
     * List special posts.
     *
     * @param model model
     * @param slug  slug
     * @param page  current page
     * @return template name
     */
    public String listPost(Model model, String slug, Integer page) {
        // Get special by slug
        final Special special = specialService.getBySlugOfNonNull(slug);
        SpecialDTO specialDTO = specialService.convertTo(special);

        final Pageable pageable = PageRequest.of(page - 1, optionService.getArchivesPageSize(), Sort.by(DESC, "createTime"));
        Page<Post> postPage = postSpecialService.pagePostBy(special.getId(), PostStatus.PUBLISHED, pageable);
        Page<PostListVO> posts = postService.convertToListVo(postPage);

        // Generate meta description.
        if (StringUtils.isNotEmpty(special.getDescription())) {
            model.addAttribute("meta_description", special.getDescription());
        } else {
            model.addAttribute("meta_description", optionService.getSeoDescription());
        }

        model.addAttribute("is_special", true);
        model.addAttribute("posts", posts);
        model.addAttribute("special", specialDTO);
        model.addAttribute("meta_keywords", optionService.getSeoKeywords());
        return themeService.render("special");
    }
}
