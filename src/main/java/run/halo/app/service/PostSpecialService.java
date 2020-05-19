package run.halo.app.service;

import org.springframework.data.domain.Page;
import org.springframework.data.domain.Pageable;
import org.springframework.data.domain.Sort;
import org.springframework.lang.NonNull;
import org.springframework.lang.Nullable;
import org.springframework.transaction.annotation.Transactional;
import run.halo.app.model.dto.SpecialWithPostCountDTO;
import run.halo.app.model.entity.Special;
import run.halo.app.model.entity.Post;
import run.halo.app.model.entity.PostSpecial;
import run.halo.app.model.enums.PostStatus;
import run.halo.app.service.base.CrudService;

import java.util.Collection;
import java.util.List;
import java.util.Map;
import java.util.Set;

/**
 * Post special service interface.
 *
 * @author johnniang
 * @author ryanwang
 * @date 2019-03-19
 */
public interface PostSpecialService extends CrudService<PostSpecial, Integer> {

    /**
     * Lists special by post id.
     *
     * @param postId post id must not be null
     * @return a list of special
     */
    @NonNull
    List<Special> listSpecialsBy(@NonNull Integer postId);

    /**
     * List special list map by post id collection.
     *
     * @param postIds post id collection
     * @return a special list map (key: postId, value: a list of special)
     */
    @NonNull
    Map<Integer, List<Special>> listSpecialListMap(@Nullable Collection<Integer> postIds);

    /**
     * Lists post by special id.
     *
     * @param specialId special id must not be null
     * @return a list of post
     */
    @NonNull
    List<Post> listPostBy(@NonNull Integer specialId);

    /**
     * Lists post by special id and post status.
     *
     * @param specialId special id must not be null
     * @param status     post status
     * @return a list of post
     */
    @NonNull
    List<Post> listPostBy(@NonNull Integer specialId, @NonNull PostStatus status);

    /**
     * Lists post by special slug and post status.
     *
     * @param slug   special slug must not be null
     * @param status post status
     * @return a list of post
     */
    @NonNull
    List<Post> listPostBy(@NonNull String slug, @NonNull PostStatus status);

    /**
     * Pages post by special id.
     *
     * @param specialId special id must not be null
     * @param pageable   pageable
     * @return page of post
     */
    @NonNull
    Page<Post> pagePostBy(@NonNull Integer specialId, Pageable pageable);

    /**
     * Pages post by special id and post status.
     *
     * @param specialId special id must not be null
     * @param status     post status
     * @param pageable   pageable
     * @return page of post
     */
    @NonNull
    Page<Post> pagePostBy(@NonNull Integer specialId, @NonNull PostStatus status, Pageable pageable);

    /**
     * Merges or creates post specials by post id and special id set if absent.
     *
     * @param postId      post id must not be null
     * @param specialIds special id set
     * @return a list of post special
     */
    @NonNull
    List<PostSpecial> mergeOrCreateByIfAbsent(@NonNull Integer postId, @Nullable Set<Integer> specialIds);

    /**
     * Lists by post id.
     *
     * @param postId post id must not be null
     * @return a list of post special
     */
    @NonNull
    List<PostSpecial> listByPostId(@NonNull Integer postId);

    /**
     * Lists by special id.
     *
     * @param specialId special id must not be null
     * @return a list of post special
     */
    @NonNull
    List<PostSpecial> listBySpecialId(@NonNull Integer specialId);

    /**
     * List special id set by post id.
     *
     * @param postId post id must not be null
     * @return a set of special id
     */
    @NonNull
    Set<Integer> listSpecialIdsByPostId(@NonNull Integer postId);

    /**
     * Removes post specials by post id.
     *
     * @param postId post id must not be null
     * @return a list of post special deleted
     */
    @NonNull
    @Transactional
    List<PostSpecial> removeByPostId(@NonNull Integer postId);

    /**
     * Removes post specials by special id.
     *
     * @param specialId special id must not be null
     * @return a list of post special deleted
     */
    @NonNull
    @Transactional
    List<PostSpecial> removeBySpecialId(@NonNull Integer specialId);

    /**
     * Lists special with post count.
     *
     * @param sort sort info
     * @return a list of special dto
     */
    @NonNull
    List<SpecialWithPostCountDTO> listSpecialWithPostCountDto(@NonNull Sort sort);
}
