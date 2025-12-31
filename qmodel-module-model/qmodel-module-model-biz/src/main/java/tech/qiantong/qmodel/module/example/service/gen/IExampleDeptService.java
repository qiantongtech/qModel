package tech.qiantong.qmodel.module.example.service.gen;

import java.util.List;
import java.util.Map;

import com.baomidou.mybatisplus.extension.service.IService;
import tech.qiantong.qmodel.common.core.page.PageResult;
import tech.qiantong.qmodel.module.example.controller.admin.gen.vo.ExampleDeptSaveReqVO;
import tech.qiantong.qmodel.module.example.controller.admin.gen.vo.ExampleDeptPageReqVO;
import tech.qiantong.qmodel.module.example.dal.dataobject.gen.ExampleDeptDO;
/**
 * 示例部门Service接口
 *
 * @author anivia
 * @date 2024-12-09
 */
public interface IExampleDeptService extends IService<ExampleDeptDO> {

    /**
     * 获得示例部门分页列表
     *
     * @param pageReqVO 分页请求
     * @return 示例部门分页列表
     */
    PageResult<ExampleDeptDO> getExampleDeptPage(ExampleDeptPageReqVO pageReqVO);

    /**
     * 创建示例部门
     *
     * @param createReqVO 示例部门信息
     * @return 示例部门编号
     */
    Long createExampleDept(ExampleDeptSaveReqVO createReqVO);

    /**
     * 更新示例部门
     *
     * @param updateReqVO 示例部门信息
     */
    int updateExampleDept(ExampleDeptSaveReqVO updateReqVO);

    /**
     * 删除示例部门
     *
     * @param id 示例部门编号
     */
    int removeExampleDept(Long id);

    /**
     * 获得示例部门详情
     *
     * @param id 示例部门编号
     * @return 示例部门
     */
    ExampleDeptDO getExampleDeptById(Long id);

    /**
     * 获得全部示例部门列表
     *
     * @return 示例部门列表
     */
    List<ExampleDeptDO> getExampleDeptList();

    /**
     * 获得全部示例部门 Map
     *
     * @return 示例部门 Map
     */
    Map<Long, ExampleDeptDO> getExampleDeptMap();

    /**
     * 是否存在示例部门子节点
     *
     * @param id 示例部门id
     * @return 结果 true 存在 false 不存在
     */
    boolean hasChildByExampleDeptId(Long id);


}
