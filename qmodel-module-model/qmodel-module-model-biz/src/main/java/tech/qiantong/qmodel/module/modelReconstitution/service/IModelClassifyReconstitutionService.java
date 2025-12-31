package tech.qiantong.qmodel.module.modelReconstitution.service;

import tech.qiantong.qmodel.module.modelReconstitution.domain.*;

import java.util.*;

/**
 * 模型分类Service接口
 *
 * @author surge
 * @date 2023-09-15
 */
public interface IModelClassifyReconstitutionService {
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
     * 批量删除模型分类
     *
     * @param ids 需要删除的模型分类主键集合
     * @return 结果
     */
    public int deleteModelClassifyByIds(Long[] ids);

    /**
     * 删除模型分类信息
     *
     * @param id 模型分类主键
     * @return 结果
     */
    public int deleteModelClassifyById(Long id);

    /**
     * 查询模型分类总数
     * 
     * @return 模型分类总数
     */
    public int count();

    /**
     * 查询上周新增的模型分类数量
     * 
     * @return 上周新增的模型分类数量
     */
    public int countLastWeek();

}
