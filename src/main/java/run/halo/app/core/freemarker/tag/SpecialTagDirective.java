package run.halo.app.core.freemarker.tag;

import freemarker.core.Environment;
import freemarker.template.*;
import org.springframework.data.domain.PageRequest;
import org.springframework.data.domain.Sort;
import org.springframework.stereotype.Component;
import run.halo.app.model.entity.Special;
import run.halo.app.model.support.HaloConst;
import run.halo.app.service.SpecialService;
import run.halo.app.service.PostSpecialService;

import java.io.IOException;
import java.util.List;
import java.util.Map;

import static org.springframework.data.domain.Sort.Direction.DESC;

/**
 * Freemarker custom tag of special.
 *
 * @author ryanwang
 * @date 2019-03-22
 */
@Component
public class SpecialTagDirective implements TemplateDirectiveModel {

    private final SpecialService specialService;

    private final PostSpecialService postSpecialService;

    public SpecialTagDirective(Configuration configuration,
                               SpecialService specialService,
                               PostSpecialService postSpecialService) {
        this.specialService = specialService;
        this.postSpecialService = postSpecialService;
        configuration.setSharedVariable("specialTag", this);
    }

    @Override
    public void execute(Environment env, Map params, TemplateModel[] loopVars, TemplateDirectiveBody body) throws TemplateException, IOException {
        final DefaultObjectWrapperBuilder builder = new DefaultObjectWrapperBuilder(Configuration.VERSION_2_3_25);

        if (params.containsKey(HaloConst.METHOD_KEY)) {
            String method = params.get(HaloConst.METHOD_KEY).toString();
            switch (method) {
                case "indexTop":
                    int indexTop = Integer.parseInt(params.get("top").toString());
                    env.setVariable("specials", builder.build().wrap(postSpecialService.convertToListVo(postSpecialService.listIndexPriority(indexTop))));
                    break;
                case "list":
                    env.setVariable("specials", builder.build().wrap(postSpecialService.listSpecialWithPostCountDto(Sort.by(DESC, "createTime"))));
                    break;
                case "tree":
                    env.setVariable("specials", builder.build().wrap(specialService.listAsTree(Sort.by(DESC, "createTime"))));
                    break;
                case "listByPostId":
                    Integer postId = Integer.parseInt(params.get("postId").toString());
                    List<Special> specials = postSpecialService.listSpecialsBy(postId);
                    env.setVariable("specials", builder.build().wrap(specialService.convertTo(specials)));
                    break;
                case "count":
                    env.setVariable("count", builder.build().wrap(specialService.count()));
                    break;
                default:
                    break;
            }
        }
        body.render(env.getOut());
    }
}
