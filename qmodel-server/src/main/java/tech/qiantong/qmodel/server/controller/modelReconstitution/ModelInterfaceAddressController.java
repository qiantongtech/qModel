package tech.qiantong.qmodel.server.controller.modelReconstitution;

import org.springframework.beans.factory.annotation.*;
import org.springframework.security.access.prepost.*;
import org.springframework.web.bind.annotation.*;
import tech.qiantong.qmodel.common.annotation.*;
import tech.qiantong.qmodel.common.core.controller.*;
import tech.qiantong.qmodel.common.core.domain.*;
import tech.qiantong.qmodel.common.core.page.*;
import tech.qiantong.qmodel.common.enums.*;
import tech.qiantong.qmodel.common.utils.poi.*;
import tech.qiantong.qmodel.module.modelReconstitution.domain.*;
import tech.qiantong.qmodel.module.modelReconstitution.service.*;

import javax.servlet.http.*;
import java.util.*;

/**
 * 接口地址Controller
 *
 * @author shu
 * @date 2024-01-10
 */
@RestController
@RequestMapping("/modelReconstitution/interfaceAddress" )
public class ModelInterfaceAddressController extends BaseController {

    @Autowired
    private IModelInterfaceAddressService modelInterfaceAddressService;

    @Autowired
    private IModelVersionReconstitutionService modelVersionReconstitutionService;

    @Autowired
    private IModelHistoryReconstitutionService modelHistoryReconstitutionService;

    /**
     * 查询接口地址列表
     */
    @PreAuthorize("@ss.hasPermi('modelReconstitution:interfaceAddress:list')")
    @GetMapping("/list")
    public TableDataInfo list(ModelInterfaceAddress modelInterfaceAddress) {
        startPage();
        List<ModelInterfaceAddress> list = modelInterfaceAddressService.selectModelInterfaceAddressList(modelInterfaceAddress);
        ModelVersionReconstitution modelVersionReconstitution = new ModelVersionReconstitution();
        List<Long> ids = new ArrayList<>();
        for (ModelInterfaceAddress interfaceAddress : list) {
            ids.add(interfaceAddress.getVersionId());
        }
        Map<String, Object> params = new HashMap<>();
        params.put("ids", ids);
        modelVersionReconstitution.setParams(params);
        List<ModelVersionReconstitution> modelVersionReconstitutions = modelVersionReconstitutionService.selectModelVersionList(modelVersionReconstitution);
        for (ModelInterfaceAddress interfaceAddress : list) {
            for (ModelVersionReconstitution versionReconstitution : modelVersionReconstitutions) {
                if (interfaceAddress.getVersionId().equals(versionReconstitution.getId())) {
                    interfaceAddress.setVersion(versionReconstitution.getVersion());
                    interfaceAddress.setDescription(versionReconstitution.getDescription());
                }
            }
        }
        return getDataTable(list);
    }

    /**
     * 导出接口地址列表
     */
    @PreAuthorize("@ss.hasPermi('modelReconstitution:interfaceAddress:export')" )
    @Log(title = "接口地址" , businessType = BusinessType.EXPORT)
    @PostMapping("/export" )
    public void export(HttpServletResponse response, ModelInterfaceAddress modelInterfaceAddress) {
        List<ModelInterfaceAddress> list = modelInterfaceAddressService.selectModelInterfaceAddressList(modelInterfaceAddress);
        ExcelUtil<ModelInterfaceAddress> util = new ExcelUtil<ModelInterfaceAddress>(ModelInterfaceAddress. class);
        util.exportExcel(response, list, "接口地址数据" );
    }

    /**
     * 获取接口地址详细信息
     */
    @PreAuthorize("@ss.hasPermi('modelReconstitution:interfaceAddress:query')" )
    @GetMapping(value = "/{id}" )
    public AjaxResult getInfo(@PathVariable("id" ) Long id) {
        ModelInterfaceAddress interfaceAddress = modelInterfaceAddressService.selectModelInterfaceAddressById(id);
        ModelVersionReconstitution modelVersionReconstitution = modelVersionReconstitutionService.selectModelVersionById(interfaceAddress.getVersionId());
        interfaceAddress.setVersion(modelVersionReconstitution.getVersion());
        interfaceAddress.setDescription(modelVersionReconstitution.getDescription());
        return AjaxResult.success(interfaceAddress);
    }

    /**
     * 新增接口地址
     */
    @PreAuthorize("@ss.hasPermi('modelReconstitution:interfaceAddress:add')" )
    @Log(title = "接口地址" , businessType = BusinessType.INSERT)
    @PostMapping
    public AjaxResult add(@RequestBody ModelInterfaceAddress modelInterfaceAddress) {
        modelInterfaceAddress.setCreatorId(getUserId());
        modelInterfaceAddress.setCreateBy(getNickName());
        // 添加操作历史
        if (modelInterfaceAddress !=null) {
            ModelHistoryReconstitution modelHistory = new ModelHistoryReconstitution();
            modelHistory.setModelId(modelInterfaceAddress.getModelId());
            modelHistory.setModelName(modelInterfaceAddress.getModelName());
            modelHistory.setContext("新增了【"+modelInterfaceAddress.getInterfaceAddress()+"】接口地址");
            modelHistory.setModelVersion(modelInterfaceAddress.getVersion());
            modelHistory.setUpdatorId(getUserId());
            modelHistory.setUpdateBy(getNickName());
            modelHistory.setUpdateTime(modelInterfaceAddress.getCreateTime());
            modelHistoryReconstitutionService.insertModelHistory(modelHistory);
        }
        return toAjax(modelInterfaceAddressService.insertModelInterfaceAddress(modelInterfaceAddress));
    }

    /**
     * 修改接口地址
     */
    @PreAuthorize("@ss.hasPermi('modelReconstitution:interfaceAddress:edit')" )
    @Log(title = "接口地址" , businessType = BusinessType.UPDATE)
    @PutMapping
    public AjaxResult edit(@RequestBody ModelInterfaceAddress modelInterfaceAddress) {
        // 添加操作历史
        if (modelInterfaceAddress !=null) {
            ModelHistoryReconstitution modelHistory = new ModelHistoryReconstitution();
            modelHistory.setModelId(modelInterfaceAddress.getModelId());
            modelHistory.setModelName(modelInterfaceAddress.getModelName());
            modelHistory.setContext("修改了【"+modelInterfaceAddress.getInterfaceAddress()+"】接口基本信息");
            modelHistory.setModelVersion(modelInterfaceAddress.getVersion());
            modelHistory.setUpdatorId(getUserId());
            modelHistory.setUpdateBy(getNickName());
            modelHistory.setUpdateTime(modelInterfaceAddress.getCreateTime());
            modelHistoryReconstitutionService.insertModelHistory(modelHistory);
        }
        return toAjax(modelInterfaceAddressService.updateModelInterfaceAddress(modelInterfaceAddress));
    }

    /**
     * 删除接口地址
     */
    @PreAuthorize("@ss.hasPermi('modelReconstitution:interfaceAddress:remove')" )
    @Log(title = "接口地址" , businessType = BusinessType.DELETE)
    @DeleteMapping("/{ids}" )
    public AjaxResult remove(@PathVariable Integer[] ids) {
        return toAjax(modelInterfaceAddressService.deleteModelInterfaceAddressByIds(ids));
    }
}
