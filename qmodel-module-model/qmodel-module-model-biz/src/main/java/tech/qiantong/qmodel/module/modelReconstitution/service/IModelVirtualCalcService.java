package tech.qiantong.qmodel.module.modelReconstitution.service;

import com.alibaba.fastjson.*;

/**
 * 模型分类Service接口
 *
 * @author surge
 * @date 2023-09-15
 */
public interface IModelVirtualCalcService {

    JSONObject getOneResult();
    JSONObject getTwoResult();
}
