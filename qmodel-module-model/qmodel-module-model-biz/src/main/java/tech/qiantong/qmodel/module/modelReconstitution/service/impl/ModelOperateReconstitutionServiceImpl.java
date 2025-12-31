package tech.qiantong.qmodel.module.modelReconstitution.service.impl;

import org.springframework.beans.factory.annotation.*;
import org.springframework.stereotype.*;
import tech.qiantong.qmodel.common.utils.*;
import tech.qiantong.qmodel.module.modelReconstitution.domain.*;
import tech.qiantong.qmodel.module.modelReconstitution.mapper.*;
import tech.qiantong.qmodel.module.modelReconstitution.service.*;

import java.util.*;

/**
 * 模型历史管理 Service业务层处理
 *
 * @author YangWenGuang
 * @date 2023-09-26
 */
@Service
public class ModelOperateReconstitutionServiceImpl implements IModelOperateReconstitutionService {
    @Autowired
    private ModelOperateReconstitutionMapper modelOperateReconstitutionMapper;

    /**
     * 查询模型历史管理
     *
     * @param id 模型历史管理 主键
     * @return 模型历史管理
     */
    @Override
    public ModelOperateReconstitution selectModelOperateById(Long id) {
        return modelOperateReconstitutionMapper.selectModelOperateById(id);
    }

    /**
     * 查询模型历史管理 列表
     *
     * @param modelOperate 模型历史管理
     * @return 模型历史管理
     */
    @Override
    public List<ModelOperateReconstitution> selectModelOperateList(ModelOperateReconstitution modelOperate) {
        modelOperate.setDelFlag(false);
        return modelOperateReconstitutionMapper.selectModelOperateList(modelOperate);
    }

    /**
     * 新增模型历史管理
     *
     * @param modelOperate 模型历史管理
     * @return 结果
     */
    @Override
    public int insertModelOperate(ModelOperateReconstitution modelOperate) {
                modelOperate.setCreateTime(DateUtils.getNowDate());
            return modelOperateReconstitutionMapper.insertModelOperate(modelOperate);
    }

    /**
     * 修改模型历史管理
     *
     * @param modelOperate 模型历史管理
     * @return 结果
     */
    @Override
    public int updateModelOperate(ModelOperateReconstitution modelOperate) {
                modelOperate.setUpdateTime(DateUtils.getNowDate());
        return modelOperateReconstitutionMapper.updateModelOperate(modelOperate);
    }

    /**
     * 批量删除模型历史管理
     *
     * @param ids 需要删除的模型历史管理 主键
     * @return 结果
     */
    @Override
    public int deleteModelOperateByIds(Long[] ids) {
        return modelOperateReconstitutionMapper.deleteModelOperateByIds(ids);
    }

    /**
     * 删除模型历史管理 信息
     *
     * @param id 模型历史管理 主键
     * @return 结果
     */
    @Override
    public int deleteModelOperateById(Long id) {
        return modelOperateReconstitutionMapper.deleteModelOperateById(id);
    }
}
