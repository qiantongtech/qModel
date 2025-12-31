package tech.qiantong.qmodel.module.modelReconstitution.service.impl;


import org.springframework.beans.factory.annotation.*;
import org.springframework.stereotype.*;
import tech.qiantong.qmodel.common.utils.*;
import tech.qiantong.qmodel.module.modelReconstitution.domain.*;
import tech.qiantong.qmodel.module.modelReconstitution.mapper.*;
import tech.qiantong.qmodel.module.modelReconstitution.service.*;

import java.util.*;

/**
 * 接口地址Service业务层处理
 *
 * @author shu
 * @date 2024-01-10
 */
@Service
public class ModelInterfaceAddressServiceImpl implements IModelInterfaceAddressService {
    @Autowired
    private ModelInterfaceAddressMapper modelInterfaceAddressMapper;

    /**
     * 查询接口地址
     *
     * @param id 接口地址主键
     * @return 接口地址
     */
    @Override
    public ModelInterfaceAddress selectModelInterfaceAddressById(Long id) {
        return modelInterfaceAddressMapper.selectModelInterfaceAddressById(id);
    }

    /**
     * 查询接口地址列表
     *
     * @param modelInterfaceAddress 接口地址
     * @return 接口地址
     */
    @Override
    public List<ModelInterfaceAddress> selectModelInterfaceAddressList(ModelInterfaceAddress modelInterfaceAddress) {
        modelInterfaceAddress.setDelFlag(false);
        return modelInterfaceAddressMapper.selectModelInterfaceAddressList(modelInterfaceAddress);
    }

    /**
     * 新增接口地址
     *
     * @param modelInterfaceAddress 接口地址
     * @return 结果
     */
    @Override
    public int insertModelInterfaceAddress(ModelInterfaceAddress modelInterfaceAddress) {
                modelInterfaceAddress.setCreateTime(DateUtils.getNowDate());
            return modelInterfaceAddressMapper.insertModelInterfaceAddress(modelInterfaceAddress);
    }

    /**
     * 修改接口地址
     *
     * @param modelInterfaceAddress 接口地址
     * @return 结果
     */
    @Override
    public int updateModelInterfaceAddress(ModelInterfaceAddress modelInterfaceAddress) {
                modelInterfaceAddress.setUpdateTime(DateUtils.getNowDate());
        return modelInterfaceAddressMapper.updateModelInterfaceAddress(modelInterfaceAddress);
    }

    /**
     * 批量删除接口地址
     *
     * @param ids 需要删除的接口地址主键
     * @return 结果
     */
    @Override
    public int deleteModelInterfaceAddressByIds(Integer[] ids) {
        return modelInterfaceAddressMapper.deleteModelInterfaceAddressByIds(ids);
    }

    /**
     * 删除接口地址信息
     *
     * @param id 接口地址主键
     * @return 结果
     */
    @Override
    public int deleteModelInterfaceAddressById(Integer id) {
        return modelInterfaceAddressMapper.deleteModelInterfaceAddressById(id);
    }
}
