package tech.qiantong.qmodel.module.modelReconstitution.mapper;

import tech.qiantong.qmodel.module.modelReconstitution.domain.*;

import java.util.*;

/**
 * 模型库的重构表Mapper接口
 *
 * @author model
 * @date 2024-01-02
 */
public interface ModelReconstitutionMapper {
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
     * 删除模型库的重构表
     *
     * @param id 模型库的重构表主键
     * @return 结果
     */
    public int deleteModelReconstitutionById(Long id);

    /**
     * 批量删除模型库的重构表
     *
     * @param ids 需要删除的数据主键集合
     * @return 结果
     */
    public int deleteModelReconstitutionByIds(Long[] ids);
}
