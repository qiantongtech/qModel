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
import tech.qiantong.qmodel.module.model.controller.admin.model.vo.ModelSaveReqVO;
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

    /**
     * 获取构建环境信息
     * 从上传的ZIP文件中读取requirements.txt内容
     *
     * @param filePath 文件相对路径
     * @return 构建环境信息，包含pythonVersion和requirements列表
     */
    Map<String, Object> getBuildEnvInfo(String filePath);

    /**
     * 从模型保存请求中保存文件资源
     * 根据 ModelSaveReqVO 中的文件资源字段创建或更新文件资源记录
     * 并注册事务提交后异步触发依赖检测
     *
     * @param saveReqVO 模型保存请求
     * @param modelId 模型ID
     */
    void saveFileResourceFromModel(ModelSaveReqVO saveReqVO, Long modelId);

    /**
     * 执行模型脚本
     * 根据模型ID查询对应的Python脚本信息，执行main.py并返回结果
     *
     * @param modelId 模型ID
     * @param inputParam 输入参数（JSON格式）
     * @return 脚本执行结果
     */
    String runModelScript(Long modelId, Map<String, Object> inputParam);

    /**
     * 执行模型脚本（支持文件参数）
     * 根据模型ID查询对应的Python脚本信息，执行main.py并返回结果
     * 支持传入JSON参数和文件参数
     *
     * @param modelId 模型ID
     * @param paramsJson JSON参数字符串
     * @param fileKeys 文件参数的key列表，逗号分隔
     * @param files 文件列表
     * @return 脚本执行结果
     */
    String runModelScript(Long modelId, String paramsJson, String fileKeys, List<MultipartFile> files);

    /**
     * 保存文件到临时目录
     * 将上传的文件保存到临时目录，返回文件绝对路径
     *
     * @param file 上传的文件
     * @return 文件绝对路径
     */
    String saveFileToTemp(MultipartFile file);

}
