package tech.qiantong.qmodel.module.model.service.impl;

import org.springframework.beans.factory.annotation.*;
import org.springframework.stereotype.*;
import tech.qiantong.qmodel.common.utils.*;
import tech.qiantong.qmodel.module.model.domain.*;
import tech.qiantong.qmodel.module.model.mapper.*;
import tech.qiantong.qmodel.module.model.service.*;

import java.util.*;

/**
 * 模型历史管理 Service业务层处理
 *
 * @author YangWenGuang
 * @date 2023-09-26
 */
@Service
public class ModelOperateServiceImpl implements IModelOperateService {
    @Autowired
    private ModelOperateMapper modelOperateMapper;

    /**
     * 查询模型历史管理 
     *
     * @param id 模型历史管理 主键
     * @return 模型历史管理 
     */
    @Override
    public ModelOperate selectModelOperateById(Long id) {
        return modelOperateMapper.selectModelOperateById(id);
    }

    /**
     * 查询模型历史管理 列表
     *
     * @param modelOperate 模型历史管理 
     * @return 模型历史管理 
     */
    @Override
    public List<ModelOperate> selectModelOperateList(ModelOperate modelOperate) {
        modelOperate.setDelFlag(false);
        return modelOperateMapper.selectModelOperateList(modelOperate);
    }

    /**
     * 新增模型历史管理 
     *
     * @param modelOperate 模型历史管理 
     * @return 结果
     */
    @Override
    public int insertModelOperate(ModelOperate modelOperate) {
                modelOperate.setCreateTime(DateUtils.getNowDate());
            return modelOperateMapper.insertModelOperate(modelOperate);
    }

    /**
     * 修改模型历史管理 
     *
     * @param modelOperate 模型历史管理 
     * @return 结果
     */
    @Override
    public int updateModelOperate(ModelOperate modelOperate) {
                modelOperate.setUpdateTime(DateUtils.getNowDate());
        return modelOperateMapper.updateModelOperate(modelOperate);
    }

    /**
     * 批量删除模型历史管理 
     *
     * @param ids 需要删除的模型历史管理 主键
     * @return 结果
     */
    @Override
    public int deleteModelOperateByIds(Long[] ids) {
        return modelOperateMapper.deleteModelOperateByIds(ids);
    }

    /**
     * 删除模型历史管理 信息
     *
     * @param id 模型历史管理 主键
     * @return 结果
     */
    @Override
    public int deleteModelOperateById(Long id) {
        return modelOperateMapper.deleteModelOperateById(id);
    }
}
