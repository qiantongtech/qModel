package tech.qiantong.qmodel.module.model.service.impl;

import org.springframework.beans.factory.annotation.*;
import org.springframework.stereotype.*;
import tech.qiantong.qmodel.common.utils.*;
import tech.qiantong.qmodel.module.model.domain.*;
import tech.qiantong.qmodel.module.model.mapper.*;
import tech.qiantong.qmodel.module.model.service.*;

import java.util.*;

/**
 * 版本管理Service业务层处理
 *
 * @author surge
 * @date 2023-09-15
 */
@Service
public class ModelVersionServiceImpl implements IModelVersionService {
    @Autowired
    private ModelVersionMapper modelVersionMapper;

    /**
     * 查询版本管理
     *
     * @param id 版本管理主键
     * @return 版本管理
     */
    @Override
    public ModelVersion selectModelVersionById(Long id) {
        return modelVersionMapper.selectModelVersionById(id);
    }

    /**
     * 查询版本管理列表
     *
     * @param modelVersion 版本管理
     * @return 版本管理
     */
    @Override
    public List<ModelVersion> selectModelVersionList(ModelVersion modelVersion) {
        modelVersion.setDelFlag(false);
        return modelVersionMapper.selectModelVersionList(modelVersion);
    }

    @Override
    public List<ModelVersion> selectMVList(Long modelId) {
        return modelVersionMapper.selectMVList(modelId);
    }

    /**
     * 新增版本管理
     *
     * @param modelVersion 版本管理
     * @return 结果
     */
    @Override
    public int insertModelVersion(ModelVersion modelVersion) {
                modelVersion.setCreateTime(DateUtils.getNowDate());
            return modelVersionMapper.insertModelVersion(modelVersion);
    }

    /**
     * 修改版本管理
     *
     * @param modelVersion 版本管理
     * @return 结果
     */
    @Override
    public int updateModelVersion(ModelVersion modelVersion) {
                modelVersion.setUpdateTime(DateUtils.getNowDate());
        return modelVersionMapper.updateModelVersion(modelVersion);
    }

    /**
     * 批量删除版本管理
     *
     * @param ids 需要删除的版本管理主键
     * @return 结果
     */
    @Override
    public int deleteModelVersionByIds(Long[] ids) {
        return modelVersionMapper.deleteModelVersionByIds(ids);
    }

    /**
     * 删除版本管理信息
     *
     * @param id 版本管理主键
     * @return 结果
     */
    @Override
    public int deleteModelVersionById(Long id) {
        return modelVersionMapper.deleteModelVersionById(id);
    }
}
