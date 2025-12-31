package tech.qiantong.qmodel.module.model.mapper;

import tech.qiantong.qmodel.module.model.domain.*;

import java.util.*;

/**
 * 模型分类Mapper接口
 *
 * @author surge
 * @date 2023-09-18
 */
public interface ModelClassifyMapper {
    /**
     * 查询模型分类
     *
     * @param id 模型分类主键
     * @return 模型分类
     */
    public ModelClassify selectModelClassifyById(Long id);

    /**
     * 查询模型分类列表
     *
     * @param modelClassify 模型分类
     * @return 模型分类集合
     */
    public List<ModelClassify> selectModelClassifyList(ModelClassify modelClassify);

    /**
     * 新增模型分类
     *
     * @param modelClassify 模型分类
     * @return 结果
     */
    public int insertModelClassify(ModelClassify modelClassify);

    /**
     * 修改模型分类
     *
     * @param modelClassify 模型分类
     * @return 结果
     */
    public int updateModelClassify(ModelClassify modelClassify);

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
}
