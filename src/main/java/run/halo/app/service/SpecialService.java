package run.halo.app.service;

import org.springframework.data.domain.Sort;
import org.springframework.lang.NonNull;
import org.springframework.lang.Nullable;
import org.springframework.transaction.annotation.Transactional;
import run.halo.app.model.dto.SpecialDTO;
import run.halo.app.model.entity.Special;
import run.halo.app.model.vo.SpecialVO;
import run.halo.app.service.base.CrudService;

import java.util.List;

/**
 * Special service.
 *
 * @author johnniang
 * @author ryanwang
 * @date 2019-03-14
 */
@Transactional(readOnly = true)
public interface SpecialService extends CrudService<Special, Integer> {

    /**
     * Lists as special tree.
     *
     * @param sort sort info must not be null
     * @return a special tree
     */
    @NonNull
    List<SpecialVO> listAsTree(@NonNull Sort sort);

    /**
     * Get special by slug
     *
     * @param slug slug
     * @return Special
     */
    @NonNull
    Special getBySlug(@NonNull String slug);

    /**
     * Get special by slug
     *
     * @param slug slug
     * @return Special
     */
    @NonNull
    Special getBySlugOfNonNull(String slug);

    /**
     * Get Special by name.
     *
     * @param name name
     * @return Special
     */
    @Nullable
    Special getByName(@NonNull String name);

    /**
     * Removes special and post specials.
     *
     * @param specialId special id must not be null
     */
    @Transactional
    void removeSpecialAndPostSpecialBy(Integer specialId);

    /**
     * List specials by parent id.
     *
     * @param id parent id.
     * @return list of special.
     */
    List<Special> listByParentId(@NonNull Integer id);

    /**
     * Converts to special dto.
     *
     * @param special special must not be null
     * @return special dto
     */
    @NonNull
    SpecialDTO convertTo(@NonNull Special special);

    /**
     * Converts to special dto list.
     *
     * @param specials special list
     * @return a list of special dto
     */
    @NonNull
    List<SpecialDTO> convertTo(@Nullable List<Special> specials);
}
