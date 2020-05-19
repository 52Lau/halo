package run.halo.app.repository;

import org.springframework.data.jpa.repository.Query;
import org.springframework.lang.NonNull;
import run.halo.app.model.entity.PostSpecial;
import run.halo.app.model.enums.PostStatus;
import run.halo.app.model.projection.SpecialPostCountProjection;
import run.halo.app.repository.base.BaseRepository;

import java.util.Collection;
import java.util.List;
import java.util.Set;


/**
 * Post special repository.
 *
 * @author johnniang
 * @author ryanwang
 * @date 2019-03-19
 */
public interface PostSpecialRepository extends BaseRepository<PostSpecial, Integer> {

    /**
     * Finds all special ids by post id
     *
     * @param postId post id must not be null
     * @return a list of special id
     */
    @NonNull
    @Query("select postSpecial.specialId from PostSpecial postSpecial where postSpecial.postId = ?1")
    Set<Integer> findAllSpecialIdsByPostId(@NonNull Integer postId);

    /**
     * Finds all post ids by special id.
     *
     * @param specialId special id must not be null
     * @return a set of post id
     */
    @NonNull
    @Query("select postSpecial.postId from PostSpecial postSpecial where postSpecial.specialId = ?1")
    Set<Integer> findAllPostIdsBySpecialId(@NonNull Integer specialId);

    /**
     * Finds all post ids by special id and post status.
     *
     * @param specialId special id must not be null
     * @param status     post status must not be null
     * @return a set of post id
     */
    @NonNull
    @Query("select postSpecial.postId from PostSpecial postSpecial, Post post where postSpecial.specialId = ?1 and post.id = postSpecial.postId and post.status = ?2")
    Set<Integer> findAllPostIdsBySpecialId(@NonNull Integer specialId, @NonNull PostStatus status);

    /**
     * Finds all post categories by post id in.
     *
     * @param postIds post id collection must not be null
     * @return a list of post special
     */
    @NonNull
    List<PostSpecial> findAllByPostIdIn(@NonNull Collection<Integer> postIds);

    /**
     * Finds all post categories by post id.
     *
     * @param postId post id must not be null
     * @return a list of post special
     */
    @NonNull
    List<PostSpecial> findAllByPostId(@NonNull Integer postId);

    /**
     * Finds all post categories by special id.
     *
     * @param specialId special id must not be null
     * @return a list of post special
     */
    @NonNull
    List<PostSpecial> findAllBySpecialId(@NonNull Integer specialId);

    /**
     * Deletes post categories by post id.
     *
     * @param postId post id must not be null
     * @return a list of post special deleted
     */
    @NonNull
    List<PostSpecial> deleteByPostId(@NonNull Integer postId);

    /**
     * Deletes post categories by special id.
     *
     * @param specialId special id must not be null
     * @return a list of post special deleted
     */
    @NonNull
    List<PostSpecial> deleteBySpecialId(@NonNull Integer specialId);

    @Query("select new run.halo.app.model.projection.SpecialPostCountProjection(count(pc.postId), pc.specialId) from PostSpecial pc group by pc.specialId")
    @NonNull
    List<SpecialPostCountProjection> findPostCount();
}
