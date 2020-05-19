package run.halo.app.model.entity;

import lombok.Getter;
import lombok.RequiredArgsConstructor;
import lombok.Setter;
import lombok.ToString;
import org.hibernate.annotations.GenericGenerator;

import javax.persistence.*;
import java.util.Objects;

/**
 * Post special entity.
 *
 * @author johnniang
 */
@Getter
@Setter
@ToString(callSuper = true)
@RequiredArgsConstructor
@Entity
@Table(name = "post_specials",
    indexes = {@Index(name = "post_specials_post_id", columnList = "post_id"),
        @Index(name = "post_specials_special_id", columnList = "special_id")})
public class PostSpecial extends BaseEntity {

    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY, generator = "custom-id")
    @GenericGenerator(name = "custom-id", strategy = "run.halo.app.model.entity.support.CustomIdGenerator")
    private Integer id;

    /**
     * Category id.
     */
    @Column(name = "special_id")
    private Integer specialId;

    /**
     * Post id.
     */
    @Column(name = "post_id")
    private Integer postId;

    @Override
    public boolean equals(Object o) {
        if (this == o) {
            return true;
        }
        if (o == null || getClass() != o.getClass()) {
            return false;
        }
        PostSpecial that = (PostSpecial) o;
        return specialId.equals(that.specialId) &&
            postId.equals(that.postId);
    }

    @Override
    public int hashCode() {
        return Objects.hash(specialId, postId);
    }
}
