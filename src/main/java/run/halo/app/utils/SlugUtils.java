package run.halo.app.utils;

import com.alibaba.fastjson.JSON;
import com.alibaba.fastjson.JSONArray;
import org.apache.commons.lang3.StringUtils;
import org.springframework.lang.NonNull;
import org.springframework.util.Assert;
import run.halo.app.exception.AlreadyExistsException;

import java.text.Normalizer;
import java.util.Locale;
import java.util.Map;
import java.util.regex.Pattern;

/**
 * Slugify utilities.
 *
 * @author johnniang
 * @author ryanwang
 * @date 2019-03-20
 */
public class SlugUtils {

    private static final Pattern NON_LATIN = Pattern.compile("[^\\w-]");
    private static final Pattern WHITESPACE = Pattern.compile("[\\s]");

    private static final String APP_ID = "20190505000294049";
    private static final String SECURITY_KEY = "OirzHFsAd3YwNsnlrg16";

    /**
     * Slugify string.
     *
     * @param input input string must not be blank
     * @return slug string
     */
    @NonNull
    @Deprecated
    public static String slugify(@NonNull String input) {
        Assert.hasText(input, "Input string must not be blank");

        String withoutWhitespace = WHITESPACE.matcher(input).replaceAll("-");
        String normalized = Normalizer.normalize(withoutWhitespace, Normalizer.Form.NFKD);
        String slug = NON_LATIN.matcher(normalized).replaceAll("");
        return slug.toLowerCase(Locale.ENGLISH);
    }


    /**
     * Slugify string.
     *
     * @param input input string must not be blank
     * @return slug string
     */
    public static String slug(@NonNull String input) {
        Assert.hasText(input, "Input string must not be blank");
        //Call Baidu TransApi
        TransApi api = new TransApi(APP_ID, SECURITY_KEY);
        Map mapType = JSON.parseObject(api.getTransResult(input, "auto", "en"), Map.class);
        if (null != mapType.get("error_msg")) {
            throw new AlreadyExistsException("TransApi error");
        }
        for (Object object : (JSONArray) mapType.get("trans_result")) {
            Map map = JSON.parseObject(String.valueOf(object), Map.class);
            input = (String) map.get("dst");
        }
        String slug = input.
            replaceAll("[^(a-zA-Z0-9\\u4e00-\\u9fa5\\.\\-)]", "").
            replaceAll("[\\?\\\\/:|<>\\*\\[\\]\\(\\)\\$%\\{\\}@~\\.]", "").
            replaceAll("\\s", "")
            .toLowerCase(Locale.ENGLISH);
        return StringUtils.isNotEmpty(slug) ? slug : String.valueOf(System.currentTimeMillis());
    }
}
