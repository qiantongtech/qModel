package tech.qiantong.qmodel.module.model.service.impl;

import org.springframework.beans.factory.annotation.*;
import org.springframework.stereotype.*;
import tech.qiantong.qmodel.common.utils.*;
import tech.qiantong.qmodel.module.model.domain.*;
import tech.qiantong.qmodel.module.model.mapper.*;
import tech.qiantong.qmodel.module.model.service.*;

import java.util.*;

/**
 * 模型管理 Service业务层处理
 *
 * @author YWG
 * @date 2023-09-14
 */
@Service
public class ModelServiceImpl implements IModelService {
    @Autowired
    private ModelMapper modelMapper;

    /**
     * 查询模型管理 
     *
     * @param id 模型管理 主键
     * @return 模型管理 
     */
    @Override
    public Model selectModelById(Long id) {
        return modelMapper.selectModelById(id);
    }

    /**
     * 查询模型管理 列表
     *
     * @param model 模型管理 
     * @return 模型管理 
     */
    @Override
    public List<Model> selectModelList(Model model) {
        model.setDelFlag(false);
        return modelMapper.selectModelList(model);
    }

    @Override
    public List<Model> selectChildrenModelById(Long classifyId) {
        return modelMapper.selectChildrenModelById(classifyId);
    }

    /**
     * 新增模型管理 
     *
     * @param model 模型管理 
     * @return 结果
     */
    @Override
    public int insertModel(Model model) {
                model.setCreateTime(DateUtils.getNowDate());
            return modelMapper.insertModel(model);
    }

    /**
     * 修改模型管理 
     *
     * @param model 模型管理 
     * @return 结果
     */
    @Override
    public int updateModel(Model model) {
                model.setUpdateTime(DateUtils.getNowDate());
        return modelMapper.updateModel(model);
    }

    /**
     * 批量删除模型管理 
     *
     * @param ids 需要删除的模型管理 主键
     * @return 结果
     */
    @Override
    public int deleteModelByIds(Long[] ids) {
        return modelMapper.deleteModelByIds(ids);
    }

    /**
     * 删除模型管理 信息
     *
     * @param id 模型管理 主键
     * @return 结果
     */
    @Override
    public int deleteModelById(Long id) {
        return modelMapper.deleteModelById(id);
    }
}
