package tech.qiantong.qmodel.module.modelReconstitution.mapper;

import tech.qiantong.qmodel.module.modelReconstitution.domain.*;

import java.util.*;

/**
 * 模型计算管理 Mapper接口
 *
 * @author Ywg
 * @date 2023-09-18
 */
public interface ModelCaclReconstitutionMapper {
    /**
     * 查询模型计算管理
     *
     * @param id 模型计算管理 主键
     * @return 模型计算管理
     */
    public ModelCaclReconstitution selectModelCaclById(Long id);

    /**
     * 查询模型计算管理 列表
     *
     * @param modelCacl 模型计算管理
     * @return 模型计算管理 集合
     */
    public List<ModelCaclReconstitution> selectModelCaclList(ModelCaclReconstitution modelCacl);

    /**
     * 新增模型计算管理
     *
     * @param modelCacl 模型计算管理
     * @return 结果
     */
    public int insertModelCacl(ModelCaclReconstitution modelCacl);

    /**
     * 修改模型计算管理
     *
     * @param modelCacl 模型计算管理
     * @return 结果
     */
    public int updateModelCacl(ModelCaclReconstitution modelCacl);

    /**
     * 删除模型计算管理
     *
     * @param id 模型计算管理 主键
     * @return 结果
     */
    public int deleteModelCaclById(Long id);

    /**
     * 批量删除模型计算管理
     *
     * @param ids 需要删除的数据主键集合
     * @return 结果
     */
    public int deleteModelCaclByIds(Long[] ids);
}
