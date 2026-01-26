package tech.qiantong.qmodel.module.example.convert.gen;

import java.util.ArrayList;
import java.util.List;
import javax.annotation.Generated;
import tech.qiantong.qmodel.module.example.controller.admin.gen.vo.ExampleDeptPageReqVO;
import tech.qiantong.qmodel.module.example.controller.admin.gen.vo.ExampleDeptRespVO;
import tech.qiantong.qmodel.module.example.controller.admin.gen.vo.ExampleDeptSaveReqVO;
import tech.qiantong.qmodel.module.example.dal.dataobject.gen.ExampleDeptDO;

@Generated(
    value = "org.mapstruct.ap.MappingProcessor",
    date = "2026-01-26T15:16:43+0800",
    comments = "version: 1.5.5.Final, compiler: javac, environment: Java 1.8.0_352 (Amazon.com Inc.)"
)
public class ExampleDeptConvertImpl implements ExampleDeptConvert {

    @Override
    public ExampleDeptDO convertToDO(ExampleDeptPageReqVO exampleDeptPageReqVO) {
        if ( exampleDeptPageReqVO == null ) {
            return null;
        }

        ExampleDeptDO.ExampleDeptDOBuilder exampleDeptDO = ExampleDeptDO.builder();

        exampleDeptDO.id( exampleDeptPageReqVO.getId() );
        exampleDeptDO.name( exampleDeptPageReqVO.getName() );
        exampleDeptDO.leader( exampleDeptPageReqVO.getLeader() );
        exampleDeptDO.phone( exampleDeptPageReqVO.getPhone() );
        exampleDeptDO.email( exampleDeptPageReqVO.getEmail() );
        exampleDeptDO.status( exampleDeptPageReqVO.getStatus() );

        return exampleDeptDO.build();
    }

    @Override
    public ExampleDeptDO convertToDO(ExampleDeptSaveReqVO exampleDeptSaveReqVO) {
        if ( exampleDeptSaveReqVO == null ) {
            return null;
        }

        ExampleDeptDO.ExampleDeptDOBuilder exampleDeptDO = ExampleDeptDO.builder();

        exampleDeptDO.id( exampleDeptSaveReqVO.getId() );
        exampleDeptDO.parentId( exampleDeptSaveReqVO.getParentId() );
        exampleDeptDO.name( exampleDeptSaveReqVO.getName() );
        exampleDeptDO.leader( exampleDeptSaveReqVO.getLeader() );
        exampleDeptDO.phone( exampleDeptSaveReqVO.getPhone() );
        exampleDeptDO.email( exampleDeptSaveReqVO.getEmail() );
        exampleDeptDO.status( exampleDeptSaveReqVO.getStatus() );

        return exampleDeptDO.build();
    }

    @Override
    public ExampleDeptRespVO convertToRespVO(ExampleDeptDO exampleDeptDO) {
        if ( exampleDeptDO == null ) {
            return null;
        }

        ExampleDeptRespVO exampleDeptRespVO = new ExampleDeptRespVO();

        exampleDeptRespVO.setId( exampleDeptDO.getId() );
        exampleDeptRespVO.setParentId( exampleDeptDO.getParentId() );
        exampleDeptRespVO.setName( exampleDeptDO.getName() );
        exampleDeptRespVO.setLeader( exampleDeptDO.getLeader() );
        exampleDeptRespVO.setPhone( exampleDeptDO.getPhone() );
        exampleDeptRespVO.setEmail( exampleDeptDO.getEmail() );
        exampleDeptRespVO.setStatus( exampleDeptDO.getStatus() );
        exampleDeptRespVO.setValidFlag( exampleDeptDO.getValidFlag() );
        exampleDeptRespVO.setDelFlag( exampleDeptDO.getDelFlag() );
        exampleDeptRespVO.setCreateBy( exampleDeptDO.getCreateBy() );
        exampleDeptRespVO.setCreatorId( exampleDeptDO.getCreatorId() );
        exampleDeptRespVO.setCreateTime( exampleDeptDO.getCreateTime() );
        exampleDeptRespVO.setUpdateBy( exampleDeptDO.getUpdateBy() );
        exampleDeptRespVO.setUpdatorId( exampleDeptDO.getUpdatorId() );
        exampleDeptRespVO.setUpdateTime( exampleDeptDO.getUpdateTime() );
        exampleDeptRespVO.setRemark( exampleDeptDO.getRemark() );

        return exampleDeptRespVO;
    }

    @Override
    public List<ExampleDeptRespVO> convertToRespVOList(List<ExampleDeptDO> exampleDeptDOList) {
        if ( exampleDeptDOList == null ) {
            return null;
        }

        List<ExampleDeptRespVO> list = new ArrayList<ExampleDeptRespVO>( exampleDeptDOList.size() );
        for ( ExampleDeptDO exampleDeptDO : exampleDeptDOList ) {
            list.add( convertToRespVO( exampleDeptDO ) );
        }

        return list;
    }
}
