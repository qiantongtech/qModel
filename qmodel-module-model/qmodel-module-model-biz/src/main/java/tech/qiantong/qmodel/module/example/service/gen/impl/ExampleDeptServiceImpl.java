package tech.qiantong.qmodel.module.example.service.gen.impl;

import java.util.List;
import java.util.Map;
import java.util.stream.Collectors;
import lombok.extern.slf4j.Slf4j;
import javax.annotation.Resource;
import tech.qiantong.qmodel.common.core.page.PageResult;
import tech.qiantong.qmodel.common.utils.object.BeanUtils;
import com.baomidou.mybatisplus.extension.service.impl.ServiceImpl;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;
import tech.qiantong.qmodel.module.example.controller.admin.gen.vo.ExampleDeptPageReqVO;
import tech.qiantong.qmodel.module.example.controller.admin.gen.vo.ExampleDeptSaveReqVO;
import tech.qiantong.qmodel.module.example.dal.dataobject.gen.ExampleDeptDO;
import tech.qiantong.qmodel.module.example.dal.mapper.gen.ExampleDeptMapper;
import tech.qiantong.qmodel.module.example.service.gen.IExampleDeptService;
/**
 * 示例部门Service业务层处理
 *
 * @author anivia
 * @date 2024-12-09
 */
@Slf4j
@Service
@Transactional(rollbackFor = Exception.class)
public class ExampleDeptServiceImpl  extends ServiceImpl<ExampleDeptMapper,ExampleDeptDO> implements IExampleDeptService {
    @Resource
    private ExampleDeptMapper exampleDeptMapper;

    @Override
    public PageResult<ExampleDeptDO> getExampleDeptPage(ExampleDeptPageReqVO pageReqVO) {
        return exampleDeptMapper.selectPage(pageReqVO);
    }

    @Override
    public Long createExampleDept(ExampleDeptSaveReqVO createReqVO) {
        ExampleDeptDO dictType = BeanUtils.toBean(createReqVO, ExampleDeptDO.class);
        exampleDeptMapper.insert(dictType);
        return dictType.getId();
    }

    @Override
    public int updateExampleDept(ExampleDeptSaveReqVO updateReqVO) {
        // 相关校验

        // 更新示例部门
        ExampleDeptDO updateObj = BeanUtils.toBean(updateReqVO, ExampleDeptDO.class);
        return exampleDeptMapper.updateById(updateObj);
    }
    @Override
    public int removeExampleDept(Long id) {
        // 单独删除示例部门
        return exampleDeptMapper.deleteById(id);
    }

    @Override
    public ExampleDeptDO getExampleDeptById(Long id) {
        return exampleDeptMapper.selectById(id);
    }

    @Override
    public List<ExampleDeptDO> getExampleDeptList() {
        return exampleDeptMapper.selectList();
    }

    @Override
    public Map<Long, ExampleDeptDO> getExampleDeptMap() {
        List<ExampleDeptDO> exampleDeptList = exampleDeptMapper.selectList();
        return exampleDeptList.stream()
                .collect(Collectors.toMap(
                        ExampleDeptDO::getId,
                        exampleDeptDO -> exampleDeptDO,
                        // 保留已存在的值
                        (existing, replacement) -> existing
                ));
    }

    @Override
    public boolean hasChildByExampleDeptId(Long id) {
        return exampleDeptMapper.selectCount(ExampleDeptDO::getParentId, id) > 0;
    }


}
