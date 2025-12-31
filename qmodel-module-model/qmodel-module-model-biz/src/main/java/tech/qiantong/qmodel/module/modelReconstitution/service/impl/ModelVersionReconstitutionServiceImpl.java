package tech.qiantong.qmodel.module.modelReconstitution.service.impl;

import org.springframework.beans.factory.annotation.*;
import org.springframework.stereotype.*;
import tech.qiantong.qmodel.common.utils.*;
import tech.qiantong.qmodel.module.modelReconstitution.domain.*;
import tech.qiantong.qmodel.module.modelReconstitution.mapper.*;
import tech.qiantong.qmodel.module.modelReconstitution.service.*;

import java.util.*;

/**
 * 版本管理Service业务层处理
 *
 * @author surge
 * @date 2023-09-15
 */
@Service
public class ModelVersionReconstitutionServiceImpl implements IModelVersionReconstitutionService {
    @Autowired
    private ModelVersionReconstitutionMapper modelVersionReconstitutionMapper;

    /**
     * 查询版本管理
     *
     * @param id 版本管理主键
     * @return 版本管理
     */
    @Override
    public ModelVersionReconstitution selectModelVersionById(Long id) {
        return modelVersionReconstitutionMapper.selectModelVersionById(id);
    }

    /**
     * 查询版本管理列表
     *
     * @param modelVersion 版本管理
     * @return 版本管理
     */
    @Override
    public List<ModelVersionReconstitution> selectModelVersionList(ModelVersionReconstitution modelVersion) {
        modelVersion.setDelFlag(false);
        return modelVersionReconstitutionMapper.selectModelVersionList(modelVersion);
    }

    @Override
    public List<ModelVersionReconstitution> selectMVList(Long modelId) {
        return modelVersionReconstitutionMapper.selectMVList(modelId);
    }

    /**
     * 新增版本管理
     *
     * @param modelVersion 版本管理
     * @return 结果
     */
    @Override
    public int insertModelVersion(ModelVersionReconstitution modelVersion) {
                modelVersion.setCreateTime(DateUtils.getNowDate());
            return modelVersionReconstitutionMapper.insertModelVersion(modelVersion);
    }

    /**
     * 修改版本管理
     *
     * @param modelVersion 版本管理
     * @return 结果
     */
    @Override
    public int updateModelVersion(ModelVersionReconstitution modelVersion) {
                modelVersion.setUpdateTime(DateUtils.getNowDate());
        return modelVersionReconstitutionMapper.updateModelVersion(modelVersion);
    }

    /**
     * 批量删除版本管理
     *
     * @param ids 需要删除的版本管理主键
     * @return 结果
     */
    @Override
    public int deleteModelVersionByIds(Long[] ids) {
        return modelVersionReconstitutionMapper.deleteModelVersionByIds(ids);
    }

    /**
     * 删除版本管理信息
     *
     * @param id 版本管理主键
     * @return 结果
     */
    @Override
    public int deleteModelVersionById(Long id) {
        return modelVersionReconstitutionMapper.deleteModelVersionById(id);
    }
}
