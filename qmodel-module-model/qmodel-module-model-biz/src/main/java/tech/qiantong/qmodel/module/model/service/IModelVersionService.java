package tech.qiantong.qmodel.module.model.service;

import tech.qiantong.qmodel.module.model.domain.*;

import java.util.*;

/**
 * 版本管理Service接口
 *
 * @author surge
 * @date 2023-09-15
 */
public interface IModelVersionService {
    /**
     * 查询版本管理
     *
     * @param id 版本管理主键
     * @return 版本管理
     */
    public ModelVersion selectModelVersionById(Long id);

    /**
     * 查询版本管理列表
     *
     * @param modelVersion 版本管理
     * @return 版本管理集合
     */
    public List<ModelVersion> selectModelVersionList(ModelVersion modelVersion);

    /**
     * 查询一个模型其版本管理列表
     *
     * @param modelId 版本管理主键
     * @return 版本管理
     */
    public  List<ModelVersion> selectMVList(Long modelId);

    /**
     * 新增版本管理
     *
     * @param modelVersion 版本管理
     * @return 结果
     */
    public int insertModelVersion(ModelVersion modelVersion);

    /**
     * 修改版本管理
     *
     * @param modelVersion 版本管理
     * @return 结果
     */
    public int updateModelVersion(ModelVersion modelVersion);

    /**
     * 批量删除版本管理
     *
     * @param ids 需要删除的版本管理主键集合
     * @return 结果
     */
    public int deleteModelVersionByIds(Long[] ids);

    /**
     * 删除版本管理信息
     *
     * @param id 版本管理主键
     * @return 结果
     */
    public int deleteModelVersionById(Long id);
}
