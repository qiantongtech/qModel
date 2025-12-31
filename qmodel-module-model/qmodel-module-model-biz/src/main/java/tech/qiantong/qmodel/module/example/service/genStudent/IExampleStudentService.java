package tech.qiantong.qmodel.module.example.service.genStudent;

import java.util.List;
import java.util.Map;
import java.util.Collection;
import com.baomidou.mybatisplus.extension.service.IService;
import tech.qiantong.qmodel.common.core.page.PageResult;
import tech.qiantong.qmodel.module.example.controller.admin.genStudent.vo.ExampleStudentSaveReqVO;
import tech.qiantong.qmodel.module.example.controller.admin.genStudent.vo.ExampleStudentPageReqVO;
import tech.qiantong.qmodel.module.example.controller.admin.genStudent.vo.ExampleStudentRespVO;
import tech.qiantong.qmodel.module.example.dal.dataobject.genStudent.ExampleStudentDO;
/**
 * 学生Service接口
 *
 * @author anivia
 * @date 2025-02-18
 */
public interface IExampleStudentService extends IService<ExampleStudentDO> {

    /**
     * 获得学生分页列表
     *
     * @param pageReqVO 分页请求
     * @return 学生分页列表
     */
    PageResult<ExampleStudentDO> getExampleStudentPage(ExampleStudentPageReqVO pageReqVO);

    /**
     * 创建学生
     *
     * @param createReqVO 学生信息
     * @return 学生编号
     */
    Long createExampleStudent(ExampleStudentSaveReqVO createReqVO);

    /**
     * 更新学生
     *
     * @param updateReqVO 学生信息
     */
    int updateExampleStudent(ExampleStudentSaveReqVO updateReqVO);

    /**
     * 删除学生
     *
     * @param idList 学生编号
     */
    int removeExampleStudent(Collection<Long> idList);

    /**
     * 获得学生详情
     *
     * @param id 学生编号
     * @return 学生
     */
    ExampleStudentDO getExampleStudentById(Long id);

    /**
     * 获得全部学生列表
     *
     * @return 学生列表
     */
    List<ExampleStudentDO> getExampleStudentList();

    /**
     * 获得全部学生 Map
     *
     * @return 学生 Map
     */
    Map<Long, ExampleStudentDO> getExampleStudentMap();


    /**
     * 导入学生数据
     *
     * @param importExcelList 学生数据列表
     * @param isUpdateSupport 是否更新支持，如果已存在，则进行更新数据
     * @param operName 操作用户
     * @return 结果
     */
    String importExampleStudent(List<ExampleStudentRespVO> importExcelList, boolean isUpdateSupport, String operName);

}
