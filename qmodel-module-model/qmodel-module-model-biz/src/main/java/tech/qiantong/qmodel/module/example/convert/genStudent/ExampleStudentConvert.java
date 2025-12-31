package tech.qiantong.qmodel.module.example.convert.genStudent;

import java.util.List;
import org.mapstruct.Mapper;
import org.mapstruct.factory.Mappers;
import tech.qiantong.qmodel.module.example.controller.admin.genStudent.vo.ExampleStudentPageReqVO;
import tech.qiantong.qmodel.module.example.controller.admin.genStudent.vo.ExampleStudentRespVO;
import tech.qiantong.qmodel.module.example.controller.admin.genStudent.vo.ExampleStudentSaveReqVO;
import tech.qiantong.qmodel.module.example.dal.dataobject.genStudent.ExampleStudentDO;

/**
 * 学生 Convert
 *
 * @author anivia
 * @date 2025-02-18
 */
@Mapper
public interface ExampleStudentConvert {
    ExampleStudentConvert INSTANCE = Mappers.getMapper(ExampleStudentConvert.class);

    /**
     * PageReqVO 转换为 DO
     * @param exampleStudentPageReqVO 请求参数
     * @return ExampleStudentDO
     */
     ExampleStudentDO convertToDO(ExampleStudentPageReqVO exampleStudentPageReqVO);

    /**
     * SaveReqVO 转换为 DO
     * @param exampleStudentSaveReqVO 保存请求参数
     * @return ExampleStudentDO
     */
     ExampleStudentDO convertToDO(ExampleStudentSaveReqVO exampleStudentSaveReqVO);

    /**
     * DO 转换为 RespVO
     * @param exampleStudentDO 实体对象
     * @return ExampleStudentRespVO
     */
     ExampleStudentRespVO convertToRespVO(ExampleStudentDO exampleStudentDO);

    /**
     * DOList 转换为 RespVOList
     * @param exampleStudentDOList 实体对象列表
     * @return List<ExampleStudentRespVO>
     */
     List<ExampleStudentRespVO> convertToRespVOList(List<ExampleStudentDO> exampleStudentDOList);
}
