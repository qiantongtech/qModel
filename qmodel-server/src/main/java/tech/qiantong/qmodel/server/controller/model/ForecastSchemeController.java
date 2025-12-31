package tech.qiantong.qmodel.server.controller.model;

import com.baomidou.mybatisplus.core.conditions.query.*;
import org.springframework.beans.factory.annotation.*;
import org.springframework.web.bind.annotation.*;
import tech.qiantong.qmodel.common.annotation.*;
import tech.qiantong.qmodel.common.core.controller.*;
import tech.qiantong.qmodel.common.core.domain.*;
import tech.qiantong.qmodel.common.core.page.*;
import tech.qiantong.qmodel.common.enums.*;
import tech.qiantong.qmodel.module.model.entity.*;
import tech.qiantong.qmodel.module.model.service.*;

import java.util.*;

@RestController
@RequestMapping("/model/forecastScheme")
public class ForecastSchemeController extends BaseController {

    @Autowired
    private IForecastSchemeService forecastSchemeService;

    /**
     * 查询模型分类列表
     */
    @GetMapping("/list")
    public TableDataInfo list(ForecastScheme forecastScheme) {
        startPage();
        QueryWrapper<ForecastScheme> queryWrapper = new QueryWrapper<>();
        if (forecastScheme.getSchemeType() != null){
            queryWrapper.eq("SCHEME_TYPE", forecastScheme.getSchemeType());
        }
        if (forecastScheme.getName() != null){
            queryWrapper.like("NAME", forecastScheme.getName());
        }
        if (forecastScheme.getObjCode() != null){
         queryWrapper.eq("OBJ_CODE", forecastScheme.getObjCode());
        }
        List<ForecastScheme> list = forecastSchemeService.list(queryWrapper);
        return getDataTable(list);
    }

    @GetMapping(value = "/{id}")
    public AjaxResult getInfo(@PathVariable("id") Integer id) {
        return AjaxResult.success(forecastSchemeService.getById(id));
    }
    @PostMapping
    @Log(title = "方案添加" , businessType = BusinessType.INSERT)
    public AjaxResult add(@RequestBody ForecastScheme forecastScheme) {
        return toAjax(forecastSchemeService.save(forecastScheme));
    }

    @PutMapping
    @Log(title = "方案修改" , businessType = BusinessType.UPDATE)
    public AjaxResult update(@RequestBody ForecastScheme forecastScheme) {
        return toAjax(forecastSchemeService.updateById(forecastScheme));
    }

    @DeleteMapping("/{ids}")
    @Log(title = "方案删除" , businessType = BusinessType.DELETE)
    public AjaxResult remove(@PathVariable List<String> ids) {
        return toAjax(forecastSchemeService.removeByIds(ids));
    }

//    @ApiOperation(value = "开始预测")
    @PostMapping("/startForecast")
    public AjaxResult startForecast(Long id) {
        return toAjax(forecastSchemeService.startForecast(id));
    }

}
