package tech.qiantong.qmodel.module.example.dal.mapper.user;

import tech.qiantong.qmodel.module.example.dal.dataobject.user.UserTypeDO;
import java.util.Arrays;
import java.util.HashSet;
import java.util.Set;

import tech.qiantong.qmodel.common.core.page.PageResult;
import tech.qiantong.qmodel.module.example.controller.admin.user.vo.UserTypePageReqVO;
import tech.qiantong.qmodel.mybatis.core.mapper.BaseMapperX;
import tech.qiantong.qmodel.mybatis.core.query.LambdaQueryWrapperX;

/**
 * 用户类型Mapper接口
 *
 * @author anivia
 * @date 2024-12-03
 */
public interface UserTypeMapper extends BaseMapperX<UserTypeDO> {

    default PageResult<UserTypeDO> selectPage(UserTypePageReqVO reqVO) {
        // 定义允许排序的字段集合（）
        Set<String> allowedColumns = new HashSet<>(Arrays.asList("id", "name", "create_time", "update_time"));

        // 构造动态查询条件
        return selectPage(reqVO, new LambdaQueryWrapperX<UserTypeDO>()
                .eqIfPresent(UserTypeDO::getId, reqVO.getId())
                .likeIfPresent(UserTypeDO::getName, reqVO.getName())
                .neIfPresent(UserTypeDO::getValidFlag, reqVO.getValidFlag())
                .eqIfPresent(UserTypeDO::getDelFlag, reqVO.getDelFlag())
                .eqIfPresent(UserTypeDO::getCreateBy, reqVO.getCreateBy())
                .eqIfPresent(UserTypeDO::getCreatorId, reqVO.getCreatorId())
                .betweenIfPresent(UserTypeDO::getCreateTime, reqVO.getParamByKey("beginCreateTime"), reqVO.getParamByKey("endCreateTime"))
                .eqIfPresent(UserTypeDO::getUpdateBy, reqVO.getUpdateBy())
                .eqIfPresent(UserTypeDO::getUpdatorId, reqVO.getUpdatorId())
                .betweenIfPresent(UserTypeDO::getUpdateTime, reqVO.getParamByKey("beginUpdateTime"), reqVO.getParamByKey("endUpdateTime"))
                .eqIfPresent(UserTypeDO::getRemark, reqVO.getRemark())
                // 如果 reqVO.getName() 不为空，则添加 name 的精确匹配条件（name = '<name>'）
                // .likeIfPresent(UserTypeDO::getName, reqVO.getName())
                // 按照 createTime 字段降序排序
                .orderBy(reqVO.getOrderByColumn(),reqVO.getIsAsc(),allowedColumns));
    }
}
