package tech.qiantong.qmodel.module.model.mapper;

import tech.qiantong.qmodel.module.model.domain.*;

import java.util.*;

/**
 * 模型计算管理 Mapper接口
 *
 * @author Ywg
 * @date 2023-09-18
 */
public interface ModelCaclMapper {
    /**
     * 查询模型计算管理 
     *
     * @param id 模型计算管理 主键
     * @return 模型计算管理 
     */
    public ModelCacl selectModelCaclById(Long id);

    /**
     * 查询模型计算管理 列表
     *
     * @param modelCacl 模型计算管理 
     * @return 模型计算管理 集合
     */
    public List<ModelCacl> selectModelCaclList(ModelCacl modelCacl);

    /**
     * 新增模型计算管理 
     *
     * @param modelCacl 模型计算管理 
     * @return 结果
     */
    public int insertModelCacl(ModelCacl modelCacl);

    /**
     * 修改模型计算管理 
     *
     * @param modelCacl 模型计算管理 
     * @return 结果
     */
    public int updateModelCacl(ModelCacl modelCacl);

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
