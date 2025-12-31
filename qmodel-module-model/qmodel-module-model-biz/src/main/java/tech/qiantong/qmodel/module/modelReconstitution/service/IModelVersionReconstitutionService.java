package tech.qiantong.qmodel.module.modelReconstitution.service;

import tech.qiantong.qmodel.module.modelReconstitution.domain.*;

import java.util.*;

/**
 * 版本管理Service接口
 *
 * @author surge
 * @date 2023-09-15
 */
public interface IModelVersionReconstitutionService {
    /**
     * 查询版本管理
     *
     * @param id 版本管理主键
     * @return 版本管理
     */
    public ModelVersionReconstitution selectModelVersionById(Long id);

    /**
     * 查询版本管理列表
     *
     * @param modelVersion 版本管理
     * @return 版本管理集合
     */
    public List<ModelVersionReconstitution> selectModelVersionList(ModelVersionReconstitution modelVersion);

    /**
     * 查询一个模型其版本管理列表
     *
     * @param modelId 版本管理主键
     * @return 版本管理
     */
    public  List<ModelVersionReconstitution> selectMVList(Long modelId);

    /**
     * 新增版本管理
     *
     * @param modelVersion 版本管理
     * @return 结果
     */
    public int insertModelVersion(ModelVersionReconstitution modelVersion);

    /**
     * 修改版本管理
     *
     * @param modelVersion 版本管理
     * @return 结果
     */
    public int updateModelVersion(ModelVersionReconstitution modelVersion);

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
