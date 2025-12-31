package tech.qiantong.qmodel.module.example.convert.gen;

import java.util.List;
import org.mapstruct.Mapper;
import org.mapstruct.factory.Mappers;
import tech.qiantong.qmodel.module.example.controller.admin.gen.vo.ExampleDeptPageReqVO;
import tech.qiantong.qmodel.module.example.controller.admin.gen.vo.ExampleDeptRespVO;
import tech.qiantong.qmodel.module.example.controller.admin.gen.vo.ExampleDeptSaveReqVO;
import tech.qiantong.qmodel.module.example.dal.dataobject.gen.ExampleDeptDO;

/**
 * 示例部门 Convert
 *
 * @author anivia
 * @date 2024-12-09
 */
@Mapper
public interface ExampleDeptConvert {
    ExampleDeptConvert INSTANCE = Mappers.getMapper(ExampleDeptConvert.class);

    /**
     * PageReqVO 转换为 DO
     * @param exampleDeptPageReqVO 请求参数
     * @return ExampleDeptDO
     */
     ExampleDeptDO convertToDO(ExampleDeptPageReqVO exampleDeptPageReqVO);

    /**
     * SaveReqVO 转换为 DO
     * @param exampleDeptSaveReqVO 保存请求参数
     * @return ExampleDeptDO
     */
     ExampleDeptDO convertToDO(ExampleDeptSaveReqVO exampleDeptSaveReqVO);

    /**
     * DO 转换为 RespVO
     * @param exampleDeptDO 实体对象
     * @return ExampleDeptRespVO
     */
     ExampleDeptRespVO convertToRespVO(ExampleDeptDO exampleDeptDO);

    /**
     * DOList 转换为 RespVOList
     * @param exampleDeptDOList 实体对象列表
     * @return List<ExampleDeptRespVO>
     */
     List<ExampleDeptRespVO> convertToRespVOList(List<ExampleDeptDO> exampleDeptDOList);
}
