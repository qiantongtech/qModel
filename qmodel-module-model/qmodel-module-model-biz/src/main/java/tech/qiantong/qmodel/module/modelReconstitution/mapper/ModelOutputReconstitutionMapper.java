package tech.qiantong.qmodel.module.modelReconstitution.mapper;

import tech.qiantong.qmodel.module.modelReconstitution.domain.*;

import java.util.*;

/**
 *  模型输出管理Mapper接口
 *
 * @author surge
 * @date 2023-09-14
 */
public interface ModelOutputReconstitutionMapper {
    /**
     * 查询 模型输出管理
     *
     * @param id  模型输出管理主键
     * @return  模型输出管理
     */
    public ModelOutputReconstitution selectModelOutputById(Long id);

    /**
     * 查询 模型输出管理列表
     *
     * @param modelOutput  模型输出管理
     * @return  模型输出管理集合
     */
    public List<ModelOutputReconstitution> selectModelOutputList(ModelOutputReconstitution modelOutput);

    /**
     * 新增 模型输出管理
     *
     * @param modelOutput  模型输出管理
     * @return 结果
     */
    public int insertModelOutput(ModelOutputReconstitution modelOutput);

    /**
     * 修改 模型输出管理
     *
     * @param modelOutput  模型输出管理
     * @return 结果
     */
    public int updateModelOutput(ModelOutputReconstitution modelOutput);

    /**
     * 删除 模型输出管理
     *
     * @param id  模型输出管理主键
     * @return 结果
     */
    public int deleteModelOutputById(Long id);

    /**
     * 批量删除 模型输出管理
     *
     * @param ids 需要删除的数据主键集合
     * @return 结果
     */
    public int deleteModelOutputByIds(Long[] ids);
}
