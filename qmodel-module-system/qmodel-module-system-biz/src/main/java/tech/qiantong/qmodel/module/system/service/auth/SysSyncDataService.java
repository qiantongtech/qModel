package tech.qiantong.qmodel.module.system.service.auth;

import com.alibaba.fastjson2.JSONObject;
import tech.qiantong.qmodel.common.core.domain.AjaxResult;

/**
 * 接收认证平台推送的数据
 */
public interface SysSyncDataService {
    public AjaxResult syncData(JSONObject jsonObject);
}
