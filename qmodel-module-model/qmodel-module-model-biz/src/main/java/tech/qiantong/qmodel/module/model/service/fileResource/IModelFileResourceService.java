/*
 * Copyright © 2026 Qiantong Technology Co., Ltd.
 * qModel Model Platform(Open Source Edition)
 *  *
 * License:
 * Released under the Apache License, Version 2.0.
 * You may use, modify, and distribute this software for commercial purposes
 * under the terms of the License.
 *  *
 * Special Notice:
 * All derivative versions are strictly prohibited from modifying or removing
 * the default system logo and copyright information.
 * For brand customization, please apply for brand customization authorization via official channels.
 *  *
 * More information: https://qmodel.qiantong.tech/business.html
 *  *
 * ============================================================================
 *  *
 * 版权所有 © 2026 江苏千桐科技有限公司
 * qModel 模型平台（开源版）
 *  *
 * 许可协议：
 * 本项目基于 Apache License 2.0 开源协议发布，
 * 允许在遵守协议的前提下进行商用、修改和分发。
 *  *
 * 特别说明：
 * 所有衍生版本不得修改或移除系统默认的 LOGO 和版权信息；
 * 如需定制品牌，请通过官方渠道申请品牌定制授权。
 *  *
 * 更多信息请访问：https://qmodel.qiantong.tech/business.html
 */

package tech.qiantong.qmodel.module.model.service.fileResource;

import java.util.List;
import java.util.Map;
import java.util.Collection;
import com.baomidou.mybatisplus.extension.service.IService;
import org.springframework.web.multipart.MultipartFile;
import tech.qiantong.qmodel.common.core.page.PageResult;
import tech.qiantong.qmodel.module.model.controller.admin.fileResource.vo.ModelFileResourceSaveReqVO;
import tech.qiantong.qmodel.module.model.controller.admin.fileResource.vo.ModelFileResourcePageReqVO;
import tech.qiantong.qmodel.module.model.controller.admin.fileResource.vo.ModelFileResourceRespVO;
import tech.qiantong.qmodel.module.model.dal.dataobject.fileResource.ModelFileResourceDO;
/**
 * 模型文件部署Service接口
 *
 * @author anivia
 * @date 2026-07-07
 */
public interface IModelFileResourceService extends IService<ModelFileResourceDO> {

    /**
     * 获得模型文件部署分页列表
     *
     * @param pageReqVO 分页请求
     * @return 模型文件部署分页列表
     */
    PageResult<ModelFileResourceDO> getModelFileResourcePage(ModelFileResourcePageReqVO pageReqVO);

    /**
     * 创建模型文件部署
     *
     * @param createReqVO 模型文件部署信息
     * @return 模型文件部署编号
     */
    Long createModelFileResource(ModelFileResourceSaveReqVO createReqVO);

    /**
     * 更新模型文件部署
     *
     * @param updateReqVO 模型文件部署信息
     */
    int updateModelFileResource(ModelFileResourceSaveReqVO updateReqVO);

    /**
     * 删除模型文件部署
     *
     * @param idList 模型文件部署编号
     */
    int removeModelFileResource(Collection<Long> idList);

    /**
     * 获得模型文件部署详情
     *
     * @param id 模型文件部署编号
     * @return 模型文件部署
     */
    ModelFileResourceDO getModelFileResourceById(Long id);

    /**
     * 获得全部模型文件部署列表
     *
     * @return 模型文件部署列表
     */
    List<ModelFileResourceDO> getModelFileResourceList();

    /**
     * 获得全部模型文件部署 Map
     *
     * @return 模型文件部署 Map
     */
    Map<Long, ModelFileResourceDO> getModelFileResourceMap();


    /**
     * 导入模型文件部署数据
     *
     * @param importExcelList 模型文件部署数据列表
     * @param isUpdateSupport 是否更新支持，如果已存在，则进行更新数据
     * @param operName 操作用户
     * @return 结果
     */
    String importModelFileResource(List<ModelFileResourceRespVO> importExcelList, boolean isUpdateSupport, String operName);

    /**
     * 检测上传的ZIP压缩包
     * 验证ZIP包内是否包含main.py、requirements.txt文件，以及main.py中是否包含predict函数
     *
     * @param file 上传的ZIP文件
     * @return 检测结果Map，包含pass(是否通过)、errors(错误列表)
     */
    Map<String, Object> checkZipFile(MultipartFile file);

    /**
     * 触发异步依赖检测
     * 在模型文件资源保存到数据库后调用，异步启动依赖检测和安装
     *
     * @param fileResourceId 文件资源ID
     */
    void triggerDepsCheck(Long fileResourceId);

}
