package tech.qiantong.qmodel.module.model.service.impl;

import org.springframework.beans.factory.annotation.*;
import org.springframework.stereotype.*;
import tech.qiantong.qmodel.common.utils.*;
import tech.qiantong.qmodel.module.model.domain.*;
import tech.qiantong.qmodel.module.model.mapper.*;
import tech.qiantong.qmodel.module.model.service.*;

import java.util.*;

/**
 * 操作历史Service业务层处理
 *
 * @author surge
 * @date 2023-09-15
 */
@Service
public class ModelHistoryServiceImpl implements IModelHistoryService {
    @Autowired
    private ModelHistoryMapper modelHistoryMapper;

    /**
     * 查询操作历史
     *
     * @param id 操作历史主键
     * @return 操作历史
     */
    @Override
    public ModelHistory selectModelHistoryById(Long id) {
        return modelHistoryMapper.selectModelHistoryById(id);
    }

    /**
     * 查询操作历史列表
     *
     * @param modelHistory 操作历史
     * @return 操作历史
     */
    @Override
    public List<ModelHistory> selectModelHistoryList(ModelHistory modelHistory) {
        modelHistory.setDelFlag(false);
        return modelHistoryMapper.selectModelHistoryList(modelHistory);
    }

    /**
     * 查询某个操作历史列表
     *
     * @param modelId 操作历史
     * @return 操作历史集合
     */
    public List<ModelHistory> selectModelHistoryByModelId(Long modelId){
        return modelHistoryMapper.selectModelHistoryByModelId(modelId);
    }

    /**
     * 新增操作历史
     *
     * @param modelHistory 操作历史
     * @return 结果
     */
    @Override
    public int insertModelHistory(ModelHistory modelHistory) {
//                modelHistory.setCreateTime(DateUtils.getNowDate());
            return modelHistoryMapper.insertModelHistory(modelHistory);
    }

    /**
     * 修改操作历史
     *
     * @param modelHistory 操作历史
     * @return 结果
     */
    @Override
    public int updateModelHistory(ModelHistory modelHistory) {
                modelHistory.setUpdateTime(DateUtils.getNowDate());
        return modelHistoryMapper.updateModelHistory(modelHistory);
    }

    /**
     * 批量删除操作历史
     *
     * @param ids 需要删除的操作历史主键
     * @return 结果
     */
    @Override
    public int deleteModelHistoryByIds(Long[] ids) {
        return modelHistoryMapper.deleteModelHistoryByIds(ids);
    }

    /**
     * 删除操作历史信息
     *
     * @param id 操作历史主键
     * @return 结果
     */
    @Override
    public int deleteModelHistoryById(Long id) {
        return modelHistoryMapper.deleteModelHistoryById(id);
    }
}
