package tech.qiantong.qmodel.module.model.service;

import com.alibaba.fastjson2.*;
import com.baomidou.mybatisplus.extension.service.*;
import tech.qiantong.qmodel.module.model.domain.*;
import tech.qiantong.qmodel.module.model.entity.*;

import java.math.*;

/**
 * 模型计算管理 Service接口
 *
 * @author JW
 * @date 2024-10-18
 */
public interface IModelComputeService extends IService<ModelCompute> {

    public JSONObject getInboundFlow(InboundFlow inboundFlow);
}
