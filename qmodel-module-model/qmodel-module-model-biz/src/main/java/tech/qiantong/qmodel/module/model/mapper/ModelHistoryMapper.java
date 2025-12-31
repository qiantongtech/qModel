package tech.qiantong.qmodel.module.model.mapper;

import tech.qiantong.qmodel.module.model.domain.*;

import java.util.*;

/**
 * 操作历史Mapper接口
 *
 * @author surge
 * @date 2023-09-15
 */
public interface ModelHistoryMapper {
    /**
     * 查询操作历史
     *
     * @param id 操作历史主键
     * @return 操作历史
     */
    public ModelHistory selectModelHistoryById(Long id);

    /**
     * 查询操作历史列表
     *
     * @param modelHistory 操作历史
     * @return 操作历史集合
     */
    public List<ModelHistory> selectModelHistoryList(ModelHistory modelHistory);

    /**
     * 查询某个操作历史列表
     *
     * @param modelId 操作历史
     * @return 操作历史集合
     */
    public List<ModelHistory> selectModelHistoryByModelId(Long modelId);

    /**
     * 新增操作历史
     *
     * @param modelHistory 操作历史
     * @return 结果
     */
    public int insertModelHistory(ModelHistory modelHistory);

    /**
     * 修改操作历史
     *
     * @param modelHistory 操作历史
     * @return 结果
     */
    public int updateModelHistory(ModelHistory modelHistory);

    /**
     * 删除操作历史
     *
     * @param id 操作历史主键
     * @return 结果
     */
    public int deleteModelHistoryById(Long id);

    /**
     * 批量删除操作历史
     *
     * @param ids 需要删除的数据主键集合
     * @return 结果
     */
    public int deleteModelHistoryByIds(Long[] ids);
}
