package run.halo.app.model.entity;

import lombok.Data;
import lombok.EqualsAndHashCode;
import lombok.ToString;
import org.hibernate.annotations.ColumnDefault;
import org.hibernate.annotations.GenericGenerator;
import run.halo.app.model.enums.PostStatus;

import javax.persistence.*;

/**
 * Special entity.
 *
 * @author lau52y
 * @date 2020-05-04
 */
@Data
@Entity
@Table(name = "specials",
    indexes = {@Index(name = "specials_name", columnList = "name"),
        @Index(name = "specials_parent_id", columnList = "parent_id")})
@ToString
@EqualsAndHashCode(callSuper = true)
public class Special extends BaseEntity {

    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY, generator = "custom-id")
    @GenericGenerator(name = "custom-id", strategy = "run.halo.app.model.entity.support.CustomIdGenerator")
    private Integer id;

    /**
     * Special name.
     */
    @Column(name = "name", nullable = false)
    private String name;

    /**
     * Special slug name.
     */
    @Deprecated
    @Column(name = "slug_name")
    private String slugName;

    /**
     * Special slug.
     */
    @Column(name = "slug", unique = true)
    private String slug;

    /**
     * Description,can be display on special page.
     */
    @Column(name = "description", length = 100)
    private String description;

    /**
     * Cover thumbnail of the special.
     */
    @Column(name = "thumbnail", length = 1023)
    private String thumbnail;

    /**
     * Parent special.
     */
    @Column(name = "parent_id")
    @ColumnDefault("0")
    private Integer parentId;

    /**
     * Specila status.
     */
    @Column(name = "status")
    @ColumnDefault("1")
    private PostStatus status;

    @Override
    public void prePersist() {
        super.prePersist();

        if (description == null) {
            description = "";
        }

        if (parentId == null || parentId < 0) {
            parentId = 0;
        }
    }

}
