package tech.qiantong.qmodel.module.example.service.user;

import java.util.List;
import java.util.Map;
import java.util.Collection;
import com.baomidou.mybatisplus.extension.service.IService;
import tech.qiantong.qmodel.common.core.page.PageResult;
import tech.qiantong.qmodel.module.example.controller.admin.user.vo.UserTypeSaveReqVO;
import tech.qiantong.qmodel.module.example.controller.admin.user.vo.UserTypePageReqVO;
import tech.qiantong.qmodel.module.example.dal.dataobject.user.UserTypeDO;

/**
 * 用户类型Service接口
 *
 * @author anivia
 * @date 2024-11-27
 */
public interface IUserTypeService extends IService<UserTypeDO> {

    /**
     * 获得用户类型分页列表
     *
     * @param pageReqVO 分页请求
     * @return 用户类型分页列表
     */
    PageResult<UserTypeDO> getUserTypePage(UserTypePageReqVO pageReqVO);

    /**
     * 创建用户类型
     *
     * @param createReqVO 用户类型信息
     * @return 用户类型编号
     */
    Long createUserType(UserTypeSaveReqVO createReqVO);

    /**
     * 更新用户类型
     *
     * @param updateReqVO 用户类型信息
     */
    int updateUserType(UserTypeSaveReqVO updateReqVO);

    /**
     * 删除用户类型
     *
     * @param idList 用户类型编号
     */
    int removeUserType(Collection<Long> idList);

    /**
     * 获得用户类型详情
     *
     * @param id 用户类型编号
     * @return 用户类型
     */
    UserTypeDO getUserTypeById(Long id);

    /**
     * 获得全部用户类型列表
     *
     * @return 用户类型列表
     */
    List<UserTypeDO> getUserTypeList();

    /**
     * 获得全部用户类型 Map
     *
     * @return 用户类型 Map
     */
    Map<Long, UserTypeDO> getUserTypeMap();

}
