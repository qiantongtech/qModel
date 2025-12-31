package tech.qiantong.qmodel.module.modelReconstitution.service;

import com.alibaba.fastjson.*;
import tech.qiantong.qmodel.module.modelReconstitution.domain.*;

import java.util.*;

/**
 *  模型输出管理Service接口
 *
 * @author surge
 * @date 2023-09-14
 */
public interface IModelOutputReconstitutionService {
    /**
     * 查询 模型输出管理
     *
     * @param id  模型输出管理主键
     * @return  模型输出管理
     */
    public ModelOutputReconstitution selectModelOutputById(Long id);

    /**
     * 查询 模型输出管理列表
     *
     * @param modelOutput  模型输出管理
     * @return  模型输出管理集合
     */
    public List<ModelOutputReconstitution> selectModelOutputList(ModelOutputReconstitution modelOutput);

    /**
     * 新增 模型输出管理
     *
     * @param modelOutput  模型输出管理
     * @return 结果
     */
    public int insertModelOutput(ModelOutputReconstitution modelOutput);

    /**
     * 修改 模型输出管理
     *
     * @param modelOutput  模型输出管理
     * @return 结果
     */
    public int updateModelOutput(ModelOutputReconstitution modelOutput);

    /**
     * 批量删除 模型输出管理
     *
     * @param ids 需要删除的 模型输出管理主键集合
     * @return 结果
     */
    public int deleteModelOutputByIds(Long[] ids);

    /**
     * 删除 模型输出管理信息
     *
     * @param id  模型输出管理主键
     * @return 结果
     */
    public int deleteModelOutputById(Long id);

    /**
     * out输入文件读取
     * @param shuiMianXianPathList out文件里面的水面线文件地址集合
     * @param QzhbPathList out文件里面的Qzhb文件地址集合
     * @return 数据集合
     *
     * 结构说明：
    |--waterSurfaceProfile(水面线文件类型数据读取)
    |  |--时间
    |     |--断面名称
    |        |--断面累计距离（m）
    |        |--断面水位（m）
    |--Qzhb(断面信息文件读取)
    |  |--时间
    |     |--计算典型断面计算流量(m3/s)
    |        |--断面名称
    |           |--流量(m3/s)
    |     |--计算典型断面计算水深(m)
    |        |--断面名称
    |           |--水深(m)
    |     |--计算典型断面水面宽(m)
    |        |--断面名称
    |           |--水面宽(m)
    |     |--计算水面与堤顶的距离(m)
    |        |--断面名称
    |           |--堤顶的距离(m)
     */
    public Map<String, Object>  waterSurfaceProfileAndQzhb(List<String> shuiMianXianPathList,List<String> QzhbPathList);

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
    Map<String, Map<String, List<String>>> waterSurfaceProfileAndQzhbMerge(Map<String, Object> stringObjectMap);

    JSONObject readNewQzhbFile();

    /**
     * 查询模型输出总数
     * 
     * @return 模型输出总数
     */
    public int count();

    /**
     * 查询上周新增的模型输出数量
     * 
     * @return 上周新增的模型输出数量
     */
    public int countLastWeek();
}
