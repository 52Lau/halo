package run.halo.app.model.params;

import lombok.Data;
import org.apache.commons.lang3.StringUtils;
import run.halo.app.model.dto.base.InputConverter;
import run.halo.app.model.entity.Special;
import run.halo.app.utils.SlugUtils;

import javax.validation.constraints.NotBlank;
import javax.validation.constraints.Size;

/**
 * Special param.
 *
 * @author lau52y
 * @date 2020-05-04
 */
@Data
public class SpecialParam implements InputConverter<Special> {

    @NotBlank(message = "专题名称不能为空")
    @Size(max = 255, message = "专题名称的字符长度不能超过 {max}")
    private String name;

    @Size(max = 255, message = "专题别名的字符长度不能超过 {max}")
    private String slug;

    @Size(max = 100, message = "专题描述的字符长度不能超过 {max}")
    private String description;

    @Size(max = 1023, message = "封面图链接的字符长度不能超过 {max}")
    private String thumbnail;

    private Integer parentId = 0;

    @Override
    public Special convertTo() {

        slug = StringUtils.isBlank(slug) ? SlugUtils.slug(name) : SlugUtils.slug(slug);

        if (null == thumbnail) {
            thumbnail = "";
        }

        return InputConverter.super.convertTo();
    }

    @Override
    public void update(Special special) {

        slug = StringUtils.isBlank(slug) ? SlugUtils.slug(name) : SlugUtils.slug(slug);

        if (null == thumbnail) {
            thumbnail = "";
        }

        InputConverter.super.update(special);
    }
}
