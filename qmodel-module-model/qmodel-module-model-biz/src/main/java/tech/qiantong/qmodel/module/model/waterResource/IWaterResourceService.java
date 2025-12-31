package tech.qiantong.qmodel.module.model.waterResource;

import com.alibaba.fastjson2.*;
import tech.qiantong.qmodel.common.core.domain.*;

import java.io.*;
import java.text.*;

/**
 * 模型计算管理 Service接口
 *
 * @author Ywg
 * @date 2023-09-18
 */
public interface IWaterResourceService {

    /**
     * 水资源模型 -- 保存用户输入的参数
     * @param target
     * @return
     */
    public JSONObject saveInputForModelWaterResource(JSONObject target) throws ParseException;


    public AjaxResult getAllDatFileMsg();


    public JSONObject saveInputForModelWaterResourceByScreen(JSONObject target);


    public void runProcess(Long id) throws IOException;

    public void runProcess(Long id,String filePath) throws IOException;

}
