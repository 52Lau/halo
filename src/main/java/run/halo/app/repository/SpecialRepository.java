package run.halo.app.repository;

import org.springframework.lang.NonNull;
import run.halo.app.model.entity.Special;
import run.halo.app.repository.base.BaseRepository;

import java.util.List;
import java.util.Optional;

/**
 * Special repository.
 *
 * @author johnniang
 */
public interface SpecialRepository extends BaseRepository<Special, Integer> {

    /**
     * Counts by category name.
     *
     * @param name category name must not be blank
     * @return the count
     */
    long countByName(@NonNull String name);

    /**
     * Counts by category id.
     *
     * @param id category id must not be null
     * @return the count
     */
    long countById(@NonNull Integer id);

    /**
     * Get category by slug
     *
     * @param slug slug
     * @return Optional of Special
     */
    Optional<Special> getBySlug(@NonNull String slug);

    /**
     * Get category by name.
     *
     * @param name name
     * @return Optional of Special
     */
    Optional<Special> getByName(@NonNull String name);

    /**
     * List categories by parent id.
     *
     * @param id parent id.
     * @return list of category
     */
    List<Special> findByParentId(@NonNull Integer id);
}
