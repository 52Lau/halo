package run.halo.app.model.projection;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

/**
 * Special post count projection.
 *
 * @author johnniang
 * @date 19-4-23
 */
@Data
@AllArgsConstructor
@NoArgsConstructor
public class SpecialPostCountProjection {

    private Long postCount;

    private Integer specialId;
}
