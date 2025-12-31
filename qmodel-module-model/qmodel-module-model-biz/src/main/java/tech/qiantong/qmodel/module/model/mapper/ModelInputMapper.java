package tech.qiantong.qmodel.module.model.mapper;

import tech.qiantong.qmodel.module.model.domain.*;

import java.util.*;

/**
 * 模型输入管理 Mapper接口
 *
 * @author YWG
 * @date 2023-09-14
 */
public interface ModelInputMapper {
    /**
     * 查询模型输入管理 
     *
     * @param id 模型输入管理 主键
     * @return 模型输入管理 
     */
    public ModelInput selectModelInputById(Long id);

    /**
     * 查询模型输入管理 列表
     *
     * @param modelInput 模型输入管理 
     * @return 模型输入管理 集合
     */
    public List<ModelInput> selectModelInputList(ModelInput modelInput);

    /**
     * 新增模型输入管理 
     *
     * @param modelInput 模型输入管理 
     * @return 结果
     */
    public int insertModelInput(ModelInput modelInput);

    /**
     * 修改模型输入管理 
     *
     * @param modelInput 模型输入管理 
     * @return 结果
     */
    public int updateModelInput(ModelInput modelInput);

    /**
     * 删除模型输入管理 
     *
     * @param id 模型输入管理 主键
     * @return 结果
     */
    public int deleteModelInputById(Long id);

    /**
     * 批量删除模型输入管理 
     *
     * @param ids 需要删除的数据主键集合
     * @return 结果
     */
    public int deleteModelInputByIds(Long[] ids);
}
