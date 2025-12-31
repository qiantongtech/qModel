package tech.qiantong.qmodel.module.modelReconstitution.service;

import tech.qiantong.qmodel.module.modelReconstitution.domain.*;

import java.util.*;

/**
 * 模型库的重构表Service接口
 *
 * @author model
 * @date 2024-01-02
 */
public interface IModelReconstitutionService {
    /**
     * 查询模型库的重构表
     *
     * @param id 模型库的重构表主键
     * @return 模型库的重构表
     */
    public ModelReconstitution selectModelReconstitutionById(Long id);

    /**
     * 查询模型库的重构表列表
     *
     * @param modelReconstitution 模型库的重构表
     * @return 模型库的重构表集合
     */
    public List<ModelReconstitution> selectModelReconstitutionList(ModelReconstitution modelReconstitution);

    /**
     * 新增模型库的重构表
     *
     * @param modelReconstitution 模型库的重构表
     * @return 结果
     */
    public int insertModelReconstitution(ModelReconstitution modelReconstitution);

    /**
     * 修改模型库的重构表
     *
     * @param modelReconstitution 模型库的重构表
     * @return 结果
     */
    public int updateModelReconstitution(ModelReconstitution modelReconstitution);

    /**
     * 批量删除模型库的重构表
     *
     * @param ids 需要删除的模型库的重构表主键集合
     * @return 结果
     */
    public int deleteModelReconstitutionByIds(Long[] ids);

    /**
     * 删除模型库的重构表信息
     *
     * @param id 模型库的重构表主键
     * @return 结果
     */
    public int deleteModelReconstitutionById(Long id);

    /**
     * 查询模型总数
     * 
     * @return 模型总数
     */
    public int count();

    /**
     * 查询上周新增的模型数量
     * 
     * @return 上周新增的模型数量
     */
    public int countLastWeek();
}
