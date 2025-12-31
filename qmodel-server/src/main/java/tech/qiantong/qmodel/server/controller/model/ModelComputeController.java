package tech.qiantong.qmodel.server.controller.model;

import com.alibaba.fastjson2.*;
import com.github.pagehelper.*;
import org.springframework.beans.factory.annotation.*;
import org.springframework.web.bind.annotation.*;
import tech.qiantong.qmodel.common.annotation.*;
import tech.qiantong.qmodel.common.core.controller.*;
import tech.qiantong.qmodel.common.core.domain.*;
import tech.qiantong.qmodel.common.core.page.*;
import tech.qiantong.qmodel.common.enums.*;
import tech.qiantong.qmodel.common.utils.*;
import tech.qiantong.qmodel.module.model.domain.*;
import tech.qiantong.qmodel.module.model.entity.*;
import tech.qiantong.qmodel.module.model.service.*;

import java.math.*;
import java.sql.*;
import java.util.*;

/**
 * 模型计算管理 Controller
 *
 * @author JW
 * @date 2024-10-18
 */
@RestController
@RequestMapping("/model/compute")
public class ModelComputeController extends BaseController {

    @Autowired
    private IModelComputeService modelComputeService;

    @Anonymous
//    @ApiOperation(value = "入库流量计算")
    @PostMapping("/getInboundFlow")
    public AjaxResult getInboundFlow(@RequestBody InboundFlow inboundFlow) {
        return AjaxResult.success(modelComputeService.getInboundFlow(inboundFlow));
    }

    @GetMapping("/list")
    public TableDataInfo list(ModelCompute modelCompute) {
        startPage();
        PageHelper.orderBy("START_TIME DESC");
        List<ModelCompute> list = modelComputeService.list();
        return getDataTable(list);
    }

    @GetMapping(value = "/{id}")
    public AjaxResult getInfo(@PathVariable("id") Integer id) {
        return AjaxResult.success(modelComputeService.getById(id));
    }
//    @ApiOperation(value = "模拟洪水预报-模型参数添加")
    @PostMapping
    @Log(title = "方案添加" , businessType = BusinessType.INSERT)
    public AjaxResult add(@RequestBody ModelCompute modelCompute) {
        //modelCompute.setCreateTime(DateUtils.getNowDate());
        modelCompute.setCreateTime(new Timestamp(DateUtils.getNowDate().getTime()));
        return toAjax(modelComputeService.save(modelCompute));
    }

//    @ApiOperation(value = "模拟洪水预报-模型参数修改")
    @PutMapping
    @Log(title = "方案修改" , businessType = BusinessType.UPDATE)
    public AjaxResult update(@RequestBody ModelCompute modelCompute) {
        return toAjax(modelComputeService.updateById(modelCompute));
    }

//    @ApiOperation(value = "模拟洪水预报-模型参数删除")
    @DeleteMapping("/{ids}")
    @Log(title = "方案删除" , businessType = BusinessType.DELETE)
    public AjaxResult remove(@PathVariable List<String> ids) {
        return toAjax(modelComputeService.removeByIds(ids));
    }

    @Anonymous
//    @ApiOperation(value = "根据水位计算流量")
    @PostMapping("/calcW")
    public AjaxResult calcW(@RequestBody String jsonString) {
        // 1. 校验输入参数
        if (StringUtils.isBlank(jsonString)) {
            return AjaxResult.error("输入参数不能为空");
        }

        try {
            // 2. 解析JSON数组
            JSONArray array = JSONArray.parseArray(jsonString);
            if (array == null || array.isEmpty()) {
                return AjaxResult.success("无有效数据需要处理");
            }

            // 新增：限制处理的数据量
            final int MAX_ALLOWED_ITEMS = 20000;
            if (array.size() > MAX_ALLOWED_ITEMS) {
                return AjaxResult.error("输入数据量过大，最多允许" + MAX_ALLOWED_ITEMS + "条记录");
            }

            // 3. 处理数据
            for (int i = array.size() - 1; i >= 0; i--) {
                JSONObject jsonObject = array.getJSONObject(i);
                if (jsonObject == null) {
                    continue;
                }

                BigDecimal rz = jsonObject.getBigDecimal("rz");
                if (rz == null) {
                    continue;
                }

                // 4. 计算并设置流量
//                BigDecimal w = modelComputeService.calcWByRz(rz);
//                jsonObject.put("w", w);
            }

            // 5. 返回结果
            AjaxResult success = success();
            success.put("data", array);
            return success;
        } catch (JSONException e) {
            logger.error("JSON解析异常", e);
            return AjaxResult.error("输入数据格式不正确");
        } catch (Exception e) {
            logger.error("计算流量时发生异常", e);
            return AjaxResult.error("计算流量失败");
        }
    }

    //跟上面接口一样, 需要重复请求,post接口重复请求会报错, 所以再加一个接口
    @Anonymous
//    @ApiOperation(value = "根据水位计算流量")
    @PutMapping("/getCalcW")
    public AjaxResult getCalcW(@RequestBody String jsonString) {
        // 1. 校验输入参数是否为空
        if (StringUtils.isBlank(jsonString)) {
            return AjaxResult.error("请求参数不能为空");
        }

        try {
            // 2. 解析JSON数组并校验
            JSONArray array = JSONArray.parseArray(jsonString);
            if (array == null || array.isEmpty()) {
                return AjaxResult.success("无有效数据需要处理", Collections.emptyList());
            }
            // 新增：限制处理的数据量
            final int MAX_ALLOWED_ITEMS = 20000;
            if (array.size() > MAX_ALLOWED_ITEMS) {
                return AjaxResult.error("输入数据量过大，最多允许" + MAX_ALLOWED_ITEMS + "条记录");
            }

            // 3. 处理数据
            for (int i = array.size() - 1; i >= 0; i--) {
                try {
                    JSONObject jsonObject = array.getJSONObject(i);
                    if (jsonObject == null) {
                        continue; // 跳过无效的JSON对象
                    }

                    BigDecimal rz = jsonObject.getBigDecimal("rz");
                    if (rz == null) {
                        continue; // 跳过rz为空的数据
                    }

                    // 4. 计算流量并设置结果
//                    BigDecimal w = modelComputeService.calcWByRz(rz);
//                    jsonObject.put("w", w);
                } catch (Exception e) {
                    logger.error("处理第{}条数据时发生异常: {}", i, e.getMessage());
                    continue; // 单条数据处理失败不影响整体
                }
            }

            // 5. 返回处理结果
            return AjaxResult.success("计算完成", array);
        } catch (JSONException e) {
            logger.error("JSON解析失败: {}", e.getMessage());
            return AjaxResult.error("输入数据格式不正确");
        } catch (Exception e) {
            logger.error("流量计算失败: {}", e.getMessage());
            return AjaxResult.error("流量计算服务异常");
        }
    }

}
