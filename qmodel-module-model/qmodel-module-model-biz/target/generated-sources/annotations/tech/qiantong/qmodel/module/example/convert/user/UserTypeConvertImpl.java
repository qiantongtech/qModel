package tech.qiantong.qmodel.module.example.convert.user;

import java.util.ArrayList;
import java.util.List;
import javax.annotation.Generated;
import tech.qiantong.qmodel.module.example.controller.admin.user.vo.UserTypePageReqVO;
import tech.qiantong.qmodel.module.example.controller.admin.user.vo.UserTypeRespVO;
import tech.qiantong.qmodel.module.example.controller.admin.user.vo.UserTypeSaveReqVO;
import tech.qiantong.qmodel.module.example.dal.dataobject.user.UserTypeDO;

@Generated(
    value = "org.mapstruct.ap.MappingProcessor",
    date = "2026-07-17T16:02:56+0800",
    comments = "version: 1.5.5.Final, compiler: javac, environment: Java 1.8.0_492 (Amazon.com Inc.)"
)
public class UserTypeConvertImpl implements UserTypeConvert {

    @Override
    public UserTypeDO convertToDO(UserTypePageReqVO userTypePageReqVO) {
        if ( userTypePageReqVO == null ) {
            return null;
        }

        UserTypeDO.UserTypeDOBuilder userTypeDO = UserTypeDO.builder();

        userTypeDO.id( userTypePageReqVO.getId() );
        userTypeDO.name( userTypePageReqVO.getName() );
        userTypeDO.validFlag( userTypePageReqVO.getValidFlag() );
        userTypeDO.delFlag( userTypePageReqVO.getDelFlag() );

        return userTypeDO.build();
    }

    @Override
    public UserTypeDO convertToDO(UserTypeSaveReqVO userTypeSaveReqVO) {
        if ( userTypeSaveReqVO == null ) {
            return null;
        }

        UserTypeDO.UserTypeDOBuilder userTypeDO = UserTypeDO.builder();

        userTypeDO.id( userTypeSaveReqVO.getId() );
        userTypeDO.name( userTypeSaveReqVO.getName() );
        userTypeDO.validFlag( userTypeSaveReqVO.getValidFlag() );
        userTypeDO.delFlag( userTypeSaveReqVO.getDelFlag() );

        return userTypeDO.build();
    }

    @Override
    public UserTypeRespVO convertToRespVO(UserTypeDO userTypeDO) {
        if ( userTypeDO == null ) {
            return null;
        }

        UserTypeRespVO userTypeRespVO = new UserTypeRespVO();

        userTypeRespVO.setId( userTypeDO.getId() );
        userTypeRespVO.setName( userTypeDO.getName() );
        userTypeRespVO.setValidFlag( userTypeDO.getValidFlag() );
        userTypeRespVO.setDelFlag( userTypeDO.getDelFlag() );
        userTypeRespVO.setCreateBy( userTypeDO.getCreateBy() );
        userTypeRespVO.setCreatorId( userTypeDO.getCreatorId() );
        userTypeRespVO.setCreateTime( userTypeDO.getCreateTime() );
        userTypeRespVO.setUpdateBy( userTypeDO.getUpdateBy() );
        userTypeRespVO.setUpdatorId( userTypeDO.getUpdatorId() );
        userTypeRespVO.setUpdateTime( userTypeDO.getUpdateTime() );
        userTypeRespVO.setRemark( userTypeDO.getRemark() );

        return userTypeRespVO;
    }

    @Override
    public List<UserTypeRespVO> convertToRespVOList(List<UserTypeDO> userTypeDOList) {
        if ( userTypeDOList == null ) {
            return null;
        }

        List<UserTypeRespVO> list = new ArrayList<UserTypeRespVO>( userTypeDOList.size() );
        for ( UserTypeDO userTypeDO : userTypeDOList ) {
            list.add( convertToRespVO( userTypeDO ) );
        }

        return list;
    }
}
