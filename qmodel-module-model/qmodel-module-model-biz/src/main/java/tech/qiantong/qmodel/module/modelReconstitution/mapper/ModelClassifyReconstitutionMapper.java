package tech.qiantong.qmodel.module.modelReconstitution.mapper;


import org.apache.ibatis.annotations.Param;
import tech.qiantong.qmodel.module.modelReconstitution.domain.ModelClassifyReconstitution;

import java.util.*;

/**
 * 模型分类Mapper接口
 *
 * @author surge
 * @date 2023-09-18
 */
public interface ModelClassifyReconstitutionMapper {
    /**
     * 查询模型分类
     *
     * @param id 模型分类主键
     * @return 模型分类
     */
    public ModelClassifyReconstitution selectModelClassifyById(Long id);

    /**
     * 查询模型分类列表
     *
     * @param modelClassify 模型分类
     * @return 模型分类集合
     */
    public List<ModelClassifyReconstitution> selectModelClassifyList(ModelClassifyReconstitution modelClassify);

    /**
     * 新增模型分类
     *
     * @param modelClassify 模型分类
     * @return 结果
     */
    public int insertModelClassify(ModelClassifyReconstitution modelClassify);

    /**
     * 修改模型分类
     *
     * @param modelClassify 模型分类
     * @return 结果
     */
    public int updateModelClassify(ModelClassifyReconstitution modelClassify);

    /**
     * 删除模型分类
     *
     * @param id 模型分类主键
     * @return 结果
     */
    public int deleteModelClassifyById(Long id);

    /**
     * 批量删除模型分类
     *
     * @param ids 需要删除的数据主键集合
     * @return 结果
     */
    public int deleteModelClassifyByIds(Long[] ids);

    /**
     * 根据分类ID查询所有子分类
     *
     * @param classifyId 分类ID
     * @return 子分类列表
     */
    public List<ModelClassifyReconstitution> selectChildrenClassifyById(Long classifyId);

    /**
     * 批量更新子分类
     *
     * @param classifies 子分类列表
     * @return 结果
     */
    public int updateModelClassifyChildren(@Param("classifies") List<ModelClassifyReconstitution> classifies);
}
