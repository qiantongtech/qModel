package tech.qiantong.qmodel.module.modelReconstitution.service.impl;

import org.springframework.beans.factory.annotation.*;
import org.springframework.stereotype.*;
import tech.qiantong.qmodel.common.utils.*;
import tech.qiantong.qmodel.module.modelReconstitution.domain.*;
import tech.qiantong.qmodel.module.modelReconstitution.mapper.*;
import tech.qiantong.qmodel.module.modelReconstitution.service.*;

import java.util.*;

/**
 * 操作历史Service业务层处理
 *
 * @author surge
 * @date 2023-09-15
 */
@Service
public class ModelHistoryReconstitutionServiceImpl implements IModelHistoryReconstitutionService {
    @Autowired
    private ModelHistoryReconstitutionMapper modelHistoryReconstitutionMapper;

    /**
     * 查询操作历史
     *
     * @param id 操作历史主键
     * @return 操作历史
     */
    @Override
    public ModelHistoryReconstitution selectModelHistoryById(Long id) {
        return modelHistoryReconstitutionMapper.selectModelHistoryById(id);
    }

    /**
     * 查询操作历史列表
     *
     * @param modelHistory 操作历史
     * @return 操作历史
     */
    @Override
    public List<ModelHistoryReconstitution> selectModelHistoryList(ModelHistoryReconstitution modelHistory) {
        modelHistory.setDelFlag(false);
        return modelHistoryReconstitutionMapper.selectModelHistoryList(modelHistory);
    }

    /**
     * 查询某个操作历史列表
     *
     * @param modelId 操作历史
     * @return 操作历史集合
     */
    public List<ModelHistoryReconstitution> selectModelHistoryByModelId(Long modelId){
        return modelHistoryReconstitutionMapper.selectModelHistoryByModelId(modelId);
    }

    /**
     * 新增操作历史
     *
     * @param modelHistory 操作历史
     * @return 结果
     */
    @Override
    public int insertModelHistory(ModelHistoryReconstitution modelHistory) {
//                modelHistory.setCreateTime(DateUtils.getNowDate());
            return modelHistoryReconstitutionMapper.insertModelHistory(modelHistory);
    }

    /**
     * 修改操作历史
     *
     * @param modelHistory 操作历史
     * @return 结果
     */
    @Override
    public int updateModelHistory(ModelHistoryReconstitution modelHistory) {
                modelHistory.setUpdateTime(DateUtils.getNowDate());
        return modelHistoryReconstitutionMapper.updateModelHistory(modelHistory);
    }

    /**
     * 批量删除操作历史
     *
     * @param ids 需要删除的操作历史主键
     * @return 结果
     */
    @Override
    public int deleteModelHistoryByIds(Long[] ids) {
        return modelHistoryReconstitutionMapper.deleteModelHistoryByIds(ids);
    }

    /**
     * 删除操作历史信息
     *
     * @param id 操作历史主键
     * @return 结果
     */
    @Override
    public int deleteModelHistoryById(Long id) {
        return modelHistoryReconstitutionMapper.deleteModelHistoryById(id);
    }
}
