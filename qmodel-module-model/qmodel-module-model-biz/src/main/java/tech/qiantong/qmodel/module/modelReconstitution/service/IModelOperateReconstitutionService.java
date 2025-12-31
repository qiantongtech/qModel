package tech.qiantong.qmodel.module.modelReconstitution.service;

import tech.qiantong.qmodel.module.modelReconstitution.domain.*;

import java.util.*;

/**
 * 模型历史管理 Service接口
 *
 * @author YangWenGuang
 * @date 2023-09-26
 */
public interface IModelOperateReconstitutionService {
    /**
     * 查询模型历史管理
     *
     * @param id 模型历史管理 主键
     * @return 模型历史管理
     */
    public ModelOperateReconstitution selectModelOperateById(Long id);

    /**
     * 查询模型历史管理 列表
     *
     * @param modelOperate 模型历史管理
     * @return 模型历史管理 集合
     */
    public List<ModelOperateReconstitution> selectModelOperateList(ModelOperateReconstitution modelOperate);

    /**
     * 新增模型历史管理
     *
     * @param modelOperate 模型历史管理
     * @return 结果
     */
    public int insertModelOperate(ModelOperateReconstitution modelOperate);

    /**
     * 修改模型历史管理
     *
     * @param modelOperate 模型历史管理
     * @return 结果
     */
    public int updateModelOperate(ModelOperateReconstitution modelOperate);

    /**
     * 批量删除模型历史管理
     *
     * @param ids 需要删除的模型历史管理 主键集合
     * @return 结果
     */
    public int deleteModelOperateByIds(Long[] ids);

    /**
     * 删除模型历史管理 信息
     *
     * @param id 模型历史管理 主键
     * @return 结果
     */
    public int deleteModelOperateById(Long id);
}
