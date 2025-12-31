package tech.qiantong.qmodel.module.example.convert.genStudent;

import java.util.ArrayList;
import java.util.List;
import javax.annotation.Generated;
import tech.qiantong.qmodel.module.example.controller.admin.genStudent.vo.ExampleStudentPageReqVO;
import tech.qiantong.qmodel.module.example.controller.admin.genStudent.vo.ExampleStudentRespVO;
import tech.qiantong.qmodel.module.example.controller.admin.genStudent.vo.ExampleStudentSaveReqVO;
import tech.qiantong.qmodel.module.example.dal.dataobject.genStudent.ExampleStudentDO;

@Generated(
    value = "org.mapstruct.ap.MappingProcessor",
    date = "2025-12-31T15:54:37+0800",
    comments = "version: 1.5.5.Final, compiler: javac, environment: Java 1.8.0_352 (Amazon.com Inc.)"
)
public class ExampleStudentConvertImpl implements ExampleStudentConvert {

    @Override
    public ExampleStudentDO convertToDO(ExampleStudentPageReqVO exampleStudentPageReqVO) {
        if ( exampleStudentPageReqVO == null ) {
            return null;
        }

        ExampleStudentDO.ExampleStudentDOBuilder exampleStudentDO = ExampleStudentDO.builder();

        exampleStudentDO.id( exampleStudentPageReqVO.getId() );
        exampleStudentDO.name( exampleStudentPageReqVO.getName() );
        exampleStudentDO.pictureUrl( exampleStudentPageReqVO.getPictureUrl() );
        exampleStudentDO.experience( exampleStudentPageReqVO.getExperience() );
        exampleStudentDO.sex( exampleStudentPageReqVO.getSex() );
        exampleStudentDO.birthday( exampleStudentPageReqVO.getBirthday() );
        exampleStudentDO.age( exampleStudentPageReqVO.getAge() );
        exampleStudentDO.studentNumber( exampleStudentPageReqVO.getStudentNumber() );
        exampleStudentDO.grade( exampleStudentPageReqVO.getGrade() );
        exampleStudentDO.hobby( exampleStudentPageReqVO.getHobby() );

        return exampleStudentDO.build();
    }

    @Override
    public ExampleStudentDO convertToDO(ExampleStudentSaveReqVO exampleStudentSaveReqVO) {
        if ( exampleStudentSaveReqVO == null ) {
            return null;
        }

        ExampleStudentDO.ExampleStudentDOBuilder exampleStudentDO = ExampleStudentDO.builder();

        exampleStudentDO.id( exampleStudentSaveReqVO.getId() );
        exampleStudentDO.name( exampleStudentSaveReqVO.getName() );
        exampleStudentDO.pictureUrl( exampleStudentSaveReqVO.getPictureUrl() );
        exampleStudentDO.experience( exampleStudentSaveReqVO.getExperience() );
        exampleStudentDO.sex( exampleStudentSaveReqVO.getSex() );
        exampleStudentDO.birthday( exampleStudentSaveReqVO.getBirthday() );
        exampleStudentDO.age( exampleStudentSaveReqVO.getAge() );
        exampleStudentDO.studentNumber( exampleStudentSaveReqVO.getStudentNumber() );
        exampleStudentDO.grade( exampleStudentSaveReqVO.getGrade() );
        exampleStudentDO.hobby( exampleStudentSaveReqVO.getHobby() );

        return exampleStudentDO.build();
    }

    @Override
    public ExampleStudentRespVO convertToRespVO(ExampleStudentDO exampleStudentDO) {
        if ( exampleStudentDO == null ) {
            return null;
        }

        ExampleStudentRespVO exampleStudentRespVO = new ExampleStudentRespVO();

        exampleStudentRespVO.setId( exampleStudentDO.getId() );
        exampleStudentRespVO.setName( exampleStudentDO.getName() );
        exampleStudentRespVO.setPictureUrl( exampleStudentDO.getPictureUrl() );
        exampleStudentRespVO.setExperience( exampleStudentDO.getExperience() );
        exampleStudentRespVO.setSex( exampleStudentDO.getSex() );
        exampleStudentRespVO.setBirthday( exampleStudentDO.getBirthday() );
        exampleStudentRespVO.setAge( exampleStudentDO.getAge() );
        exampleStudentRespVO.setStudentNumber( exampleStudentDO.getStudentNumber() );
        exampleStudentRespVO.setGrade( exampleStudentDO.getGrade() );
        exampleStudentRespVO.setHobby( exampleStudentDO.getHobby() );
        exampleStudentRespVO.setValidFlag( exampleStudentDO.getValidFlag() );
        exampleStudentRespVO.setDelFlag( exampleStudentDO.getDelFlag() );
        exampleStudentRespVO.setCreateBy( exampleStudentDO.getCreateBy() );
        exampleStudentRespVO.setCreatorId( exampleStudentDO.getCreatorId() );
        exampleStudentRespVO.setCreateTime( exampleStudentDO.getCreateTime() );
        exampleStudentRespVO.setUpdateBy( exampleStudentDO.getUpdateBy() );
        exampleStudentRespVO.setUpdatorId( exampleStudentDO.getUpdatorId() );
        exampleStudentRespVO.setUpdateTime( exampleStudentDO.getUpdateTime() );
        exampleStudentRespVO.setRemark( exampleStudentDO.getRemark() );

        return exampleStudentRespVO;
    }

    @Override
    public List<ExampleStudentRespVO> convertToRespVOList(List<ExampleStudentDO> exampleStudentDOList) {
        if ( exampleStudentDOList == null ) {
            return null;
        }

        List<ExampleStudentRespVO> list = new ArrayList<ExampleStudentRespVO>( exampleStudentDOList.size() );
        for ( ExampleStudentDO exampleStudentDO : exampleStudentDOList ) {
            list.add( convertToRespVO( exampleStudentDO ) );
        }

        return list;
    }
}
