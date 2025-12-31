package tech.qiantong.qmodel.module.modelReconstitution.mapper;

import tech.qiantong.qmodel.module.modelReconstitution.domain.*;

import java.util.*;


/**
 * 接口地址Mapper接口
 *
 * @author shu
 * @date 2024-01-10
 */
public interface ModelInterfaceAddressMapper {
    /**
     * 查询接口地址
     *
     * @param id 接口地址主键
     * @return 接口地址
     */
    public ModelInterfaceAddress selectModelInterfaceAddressById(Long id);

    /**
     * 查询接口地址列表
     *
     * @param modelInterfaceAddress 接口地址
     * @return 接口地址集合
     */
    public List<ModelInterfaceAddress> selectModelInterfaceAddressList(ModelInterfaceAddress modelInterfaceAddress);

    /**
     * 新增接口地址
     *
     * @param modelInterfaceAddress 接口地址
     * @return 结果
     */
    public int insertModelInterfaceAddress(ModelInterfaceAddress modelInterfaceAddress);

    /**
     * 修改接口地址
     *
     * @param modelInterfaceAddress 接口地址
     * @return 结果
     */
    public int updateModelInterfaceAddress(ModelInterfaceAddress modelInterfaceAddress);

    /**
     * 删除接口地址
     *
     * @param id 接口地址主键
     * @return 结果
     */
    public int deleteModelInterfaceAddressById(Integer id);

    /**
     * 批量删除接口地址
     *
     * @param ids 需要删除的数据主键集合
     * @return 结果
     */
    public int deleteModelInterfaceAddressByIds(Integer[] ids);
}
