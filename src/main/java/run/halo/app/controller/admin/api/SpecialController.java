package run.halo.app.controller.admin.api;

import io.swagger.annotations.ApiOperation;
import org.springframework.data.domain.Sort;
import org.springframework.data.web.SortDefault;
import org.springframework.web.bind.annotation.*;
import run.halo.app.model.dto.SpecialDTO;
import run.halo.app.model.entity.Special;
import run.halo.app.model.params.SpecialParam;
import run.halo.app.model.vo.SpecialVO;
import run.halo.app.service.SpecialService;
import run.halo.app.service.PostSpecialService;

import javax.validation.Valid;
import java.util.List;

import static org.springframework.data.domain.Sort.Direction.ASC;
import static org.springframework.data.domain.Sort.Direction.DESC;

/**
 * Special controller.
 *
 * @author lau52y
 * @date 2020-05-04
 */
@RestController
@RequestMapping("/api/admin/specials")
public class SpecialController {

    private final SpecialService specialService;

    private final PostSpecialService postSpecialService;

    public SpecialController(SpecialService specialService,
                             PostSpecialService postSpecialService) {
        this.specialService = specialService;
        this.postSpecialService = postSpecialService;
    }

    @GetMapping("{specialId:\\d+}")
    @ApiOperation("Gets special detail")
    public SpecialDTO getBy(@PathVariable("specialId") Integer specialId) {
        return specialService.convertTo(specialService.getById(specialId));
    }

    @GetMapping
    @ApiOperation("Lists all specials")
    public List<? extends SpecialDTO> listAll(
        @SortDefault(sort = "createTime", direction = DESC) Sort sort,
        @RequestParam(name = "more", required = false, defaultValue = "false") boolean more) {
        if (more) {
            return postSpecialService.listSpecialWithPostCountDto(sort);
        }

        return specialService.convertTo(specialService.listAll(sort));
    }

    @GetMapping("tree_view")
    @ApiOperation("List all specials as tree")
    public List<SpecialVO> listAsTree(@SortDefault(sort = "name", direction = ASC) Sort sort) {
        return specialService.listAsTree(sort);
    }

    @PostMapping
    @ApiOperation("Creates special")
    public SpecialDTO createBy(@RequestBody @Valid SpecialParam specialParam) {
        // Convert to special
        Special special = specialParam.convertTo();

        // Save it
        return specialService.convertTo(specialService.create(special));
    }

    @PutMapping("{specialId:\\d+}")
    @ApiOperation("Updates special")
    public SpecialDTO updateBy(@PathVariable("specialId") Integer specialId,
                                @RequestBody @Valid SpecialParam specialParam) {
        Special specialToUpdate = specialService.getById(specialId);
        specialParam.update(specialToUpdate);
        return specialService.convertTo(specialService.update(specialToUpdate));
    }

    @DeleteMapping("{specialId:\\d+}")
    @ApiOperation("Deletes special")
    public void deletePermanently(@PathVariable("specialId") Integer specialId) {
        specialService.removeSpecialAndPostSpecialBy(specialId);
    }
}
