package tech.qiantong.qmodel.server.controller.model;

import org.springframework.beans.factory.annotation.*;
import org.springframework.security.access.prepost.*;
import org.springframework.web.bind.annotation.*;
import tech.qiantong.qmodel.common.annotation.*;
import tech.qiantong.qmodel.common.core.controller.*;
import tech.qiantong.qmodel.common.core.domain.*;
import tech.qiantong.qmodel.common.core.page.*;
import tech.qiantong.qmodel.common.enums.*;
import tech.qiantong.qmodel.common.utils.poi.*;
import tech.qiantong.qmodel.module.model.domain.*;
import tech.qiantong.qmodel.module.model.service.*;

import javax.servlet.http.*;
import java.util.*;

/**
 * 模型输出管理Controller
 *
 * @author surge
 * @date 2023-09-14
 */
@RestController
@RequestMapping("/model/output")
public class ModelOutputController extends BaseController {
    @Autowired
    private IModelOutputService modelOutputService;


    @Autowired
    private IModelService modelService;

    @Autowired
    private IModelVersionService modelVersionService;


//    @Value("${model.filePathRoot}")
    private String filePathRoot = "D:\\model\\chengxuhuizong11.5";



    /**
     * 查询 模型输出管理列表
     */
    @PreAuthorize("@ss.hasPermi('model:output:list')")
    @GetMapping("/list")
    public TableDataInfo list(ModelOutput modelOutput) {
        startPage();
        List<ModelOutput> list = modelOutputService.selectModelOutputList(modelOutput);
        return getDataTable(list);
    }

    /**
     * 导出 模型输出管理列表
     */
    @PreAuthorize("@ss.hasPermi('model:output:export')")
    @Log(title = " 模型输出管理", businessType = BusinessType.EXPORT)
    @PostMapping("/export")
    public void export(HttpServletResponse response, ModelOutput modelOutput) {
        List<ModelOutput> list = modelOutputService.selectModelOutputList(modelOutput);
        ExcelUtil<ModelOutput> util = new ExcelUtil<ModelOutput>(ModelOutput.class);
        util.exportExcel(response, list, " 模型输出管理数据");
    }

    /**
     * 获取 模型输出管理详细信息
     */
    @PreAuthorize("@ss.hasPermi('model:output:query')")
    @GetMapping(value = "/{id}")
    public AjaxResult getInfo(@PathVariable("id") Long id) {
        return AjaxResult.success(modelOutputService.selectModelOutputById(id));
    }

    /**
     * 新增 模型输出管理
     */
    @PreAuthorize("@ss.hasPermi('model:output:add')")
    @Log(title = " 模型输出管理", businessType = BusinessType.INSERT)
    @PostMapping
    public AjaxResult add(@RequestBody ModelOutput modelOutput) {
        modelOutput.setCreatorId(getUserId());
        modelOutput.setCreateBy(getNickName());
        return toAjax(modelOutputService.insertModelOutput(modelOutput));
    }

    /**
     * 修改 模型输出管理
     */
    @PreAuthorize("@ss.hasPermi('model:output:edit')")
    @Log(title = " 模型输出管理", businessType = BusinessType.UPDATE)
    @PutMapping
    public AjaxResult edit(@RequestBody ModelOutput modelOutput) {
        return toAjax(modelOutputService.updateModelOutput(modelOutput));
    }

    /**
     * 删除 模型输出管理
     */
    @PreAuthorize("@ss.hasPermi('model:output:remove')")
    @Log(title = " 模型输出管理", businessType = BusinessType.DELETE)
    @DeleteMapping("/{ids}")
    public AjaxResult remove(@PathVariable Long[] ids) {
        return toAjax(modelOutputService.deleteModelOutputByIds(ids));
    }

    /**
     * 查询所有模型
     */
    @PostMapping("/findAllModel")
    public AjaxResult findAllModel(@RequestBody Model model) {
        model.setDelFlag(false);
        return AjaxResult.success(modelService.selectModelList(model));
    }
    /**
     * 查询所有模型版本
     */
    @PostMapping("/findAllModelVersion")
    public AjaxResult findAllModelVersion(@RequestBody ModelVersion modelVersion) {
        modelVersion.setDelFlag(false);
        return AjaxResult.success(modelVersionService.selectModelVersionList(modelVersion));
    }
    /**
     * 查询所有模型版本
     */
    @PostMapping("/waterSurfaceProfileAndQzhb")
    public AjaxResult waterSurfaceProfileAndQzhb() {
        List<String> shuiMianXianPathList = new ArrayList<>();
        List<String> QzhbPathList = new ArrayList<>();

        shuiMianXianPathList.add(filePathRoot + "\\out\\shuimianxian_blsm_bsth_dongzhi.dat");
        shuiMianXianPathList.add(filePathRoot + "\\out\\shuimianxian_blsm_bsth_xizhi.dat");
        shuiMianXianPathList.add(filePathRoot + "\\out\\shuimianxian_desn_blsm.dat");
        shuiMianXianPathList.add(filePathRoot + "\\out\\shuimianxian_dysn_desn.dat");
        shuiMianXianPathList.add(filePathRoot + "\\out\\shuimianxian_xsk_dysn_hd.dat");
        shuiMianXianPathList.add(filePathRoot + "\\out\\shuimianxian_xsk_dysn_qd.dat");

        QzhbPathList.add(filePathRoot + "\\out\\Qzhb_blsm_bsth_dongzhi.dat");
        QzhbPathList.add(filePathRoot + "\\out\\Qzhb_blsm_bsth_xizhi.dat");
        QzhbPathList.add(filePathRoot + "\\out\\Qzhb_desn_blsm.dat");
        QzhbPathList.add(filePathRoot + "\\out\\Qzhb_dysn_desn.dat");
        QzhbPathList.add(filePathRoot + "\\out\\Qzhb_xsk_dysn_hd.dat");
        QzhbPathList.add(filePathRoot + "\\out\\Qzhb_xsk_dysn_qd.dat");



        return AjaxResult.success(modelOutputService.readNewQzhbFile());
    }

    /**
     * 查询所有模型版本并且合并在一起
     *
     * |--时间
     *      |--断面名称
     *         |--断面累计距离（m）
     *         |--断面水位（m）
     *         |--流量(m3/s)
     *         |--水深(m)
     *         |--水面宽(m)
     *         |--堤顶的距离(m)
     */
    @PostMapping("/waterSurfaceProfileAndQzhbMerge")
    public AjaxResult waterSurfaceProfileAndQzhbMerge() {
        List<String> shuiMianXianPathList = new ArrayList<>();
        List<String> QzhbPathList = new ArrayList<>();

        shuiMianXianPathList.add(filePathRoot + "\\out\\shuimianxian_blsm_bsth_dongzhi.dat");
        shuiMianXianPathList.add(filePathRoot + "\\out\\shuimianxian_blsm_bsth_xizhi.dat");
        shuiMianXianPathList.add(filePathRoot + "\\out\\shuimianxian_desn_blsm.dat");
        shuiMianXianPathList.add(filePathRoot + "\\out\\shuimianxian_dysn_desn.dat");
        shuiMianXianPathList.add(filePathRoot + "\\out\\shuimianxian_xsk_dysn_hd.dat");
        shuiMianXianPathList.add(filePathRoot + "\\out\\shuimianxian_xsk_dysn_qd.dat");

        QzhbPathList.add(filePathRoot + "\\out\\Qzhb_blsm_bsth_dongzhi.dat");
        QzhbPathList.add(filePathRoot + "\\out\\Qzhb_blsm_bsth_xizhi.dat");
        QzhbPathList.add(filePathRoot + "\\out\\Qzhb_desn_blsm.dat");
        QzhbPathList.add(filePathRoot + "\\out\\Qzhb_dysn_desn.dat");
        QzhbPathList.add(filePathRoot + "\\out\\Qzhb_xsk_dysn_hd.dat");
        QzhbPathList.add(filePathRoot + "\\out\\Qzhb_xsk_dysn_qd.dat");

        Map<String, Object> stringObjectMap = modelOutputService.waterSurfaceProfileAndQzhb(shuiMianXianPathList, QzhbPathList);
        Map<String, Map<String, List<String>>> waterSurfaceProfile = modelOutputService.waterSurfaceProfileAndQzhbMerge(stringObjectMap);
        return AjaxResult.success(waterSurfaceProfile);
    }

}
