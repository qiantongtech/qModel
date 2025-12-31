package tech.qiantong.qmodel.module.model.mapper;

import tech.qiantong.qmodel.module.model.domain.*;

import java.util.*;

/**
 * 模型管理 Mapper接口
 *
 * @author YWG
 * @date 2023-09-14
 */
public interface ModelMapper {
    /**
     * 查询模型管理 
     *
     * @param id 模型管理 主键
     * @return 模型管理 
     */
    public Model selectModelById(Long id);

    /**
     * 查询模型管理 列表
     *
     * @param model 模型管理 
     * @return 模型管理 集合
     */
    public List<Model> selectModelList(Model model);

    /**
     * 查询模型管理 子列表
     *
     * @param classifyId 模型管理
     * @return 模型管理 集合
     */
    public List<Model> selectChildrenModelById(Long classifyId);

    /**
     * 新增模型管理 
     *
     * @param model 模型管理 
     * @return 结果
     */
    public int insertModel(Model model);

    /**
     * 修改模型管理 
     *
     * @param model 模型管理 
     * @return 结果
     */
    public int updateModel(Model model);

    /**
     * 删除模型管理 
     *
     * @param id 模型管理 主键
     * @return 结果
     */
    public int deleteModelById(Long id);

    /**
     * 批量删除模型管理 
     *
     * @param ids 需要删除的数据主键集合
     * @return 结果
     */
    public int deleteModelByIds(Long[] ids);
}
