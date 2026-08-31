/*
 * Copyright (c) 2026 Jiangsu Qiantong Technology Co., Ltd.
 *  *
 * Software Name: qModel Algorithm Model Platform (Commercial Edition)
 *
 *  *
 * [RIGHTS AND LICENSE STATEMENT]
 * This file contains non-public commercial source code of which Jiangsu Qiantong
 * Technology Co., Ltd. lawfully possesses complete intellectual property rights.
 *  *
 * Access and use are limited to entities or individuals who have signed a valid
 * commercial license agreement, within the scope stipulated in the agreement.
 * The "accessibility" of this source code is premised on lawful authorization
 * and does not constitute any form of transfer of intellectual property rights
 * or implied licensing.
 *  *
 * [PROHIBITIONS]
 * Unless explicitly agreed in the license agreement, the following acts in any
 * form are strictly prohibited:
 * 1. Copying, disseminating, disclosing, selling, renting, or redistributing
 * this source code;
 * 2. Providing the software's functionality to third parties via SaaS, PaaS,
 * cloud hosting, or other means;
 * 3. Using this software or its derivative versions to develop products that
 * compete with the Right Holder;
 * 4. Providing or displaying this source code or related technical information
 * to unauthorized third parties;
 * 5. Tampering with, circumventing, or destroying copyright notices, license
 * verifications, or other technical protection measures.
 *  *
 * [LEGAL LIABILITY]
 * Any unauthorized use constitutes an infringement of trade secrets and
 * intellectual property rights.
 *  *
 * The Right Holder will strictly pursue liability for breach of contract and
 * infringement in accordance with the commercial agreement and laws such as
 * the "Copyright Law of the People's Republic of China" and the "Anti-Unfair
 * Competition Law".
 *  *
 * ============================================================================
 *  *
 * Copyright (c) 2026 江苏千桐科技有限公司
 *  *
 * 软件名称：qModel 算法模型平台（商业版）
 *  *
 * 【权利与授权声明】
 * 本文件属于江苏千桐科技有限公司依法享有完全知识产权的非公开商业源代码。
 * 仅限已签署有效商业授权合同的单位或个人在约定范围内查阅和使用。
 * 源代码的“可访问性”均以合法授权为前提，不构成任何形式的知识产权转让或默示授权。
 *  *
 * 【禁止事项】
 * 除授权合同明确约定外，严禁任何形式的：
 * 1. 复制、传播、披露、出售、出租或再分发本源代码；
 * 2. 通过 SaaS、PaaS、云托管等方式向第三方提供本软件功能；
 * 3. 将本软件或其衍生版本用于开发与权利人构成竞争的产品；
 * 4. 向未授权第三方提供或展示本源代码或相关技术信息；
 * 5. 篡改、规避或破坏版权标识、授权校验及其他技术保护措施。
 *  *
 * 【法律责任】
 * 任何未经授权的利用行为，均构成对商业秘密及知识产权的侵害。
 * 权利人将依据商业合同及《中华人民共和国著作权法》《反不正当竞争法》
 * 等法律法规，严厉追究违约与侵权责任。
 */

package tech.qiantong.qmodel.module.model.service.modelVersion.impl;

import cn.hutool.core.collection.CollUtil;
import com.baomidou.mybatisplus.core.conditions.query.LambdaQueryWrapper;
import com.baomidou.mybatisplus.core.conditions.update.LambdaUpdateWrapper;
import com.baomidou.mybatisplus.core.toolkit.Wrappers;
import com.baomidou.mybatisplus.extension.service.impl.ServiceImpl;
import lombok.extern.slf4j.Slf4j;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;
import tech.qiantong.qmodel.common.core.domain.entity.SysDictData;
import tech.qiantong.qmodel.common.core.page.PageResult;
import tech.qiantong.qmodel.common.exception.ServiceException;
import tech.qiantong.qmodel.common.utils.object.BeanUtils;
import tech.qiantong.qmodel.module.model.controller.admin.modelVersion.vo.ModelVersionPageReqVO;
import tech.qiantong.qmodel.module.model.controller.admin.modelVersion.vo.ModelVersionSaveReqVO;
import tech.qiantong.qmodel.module.model.dal.dataobject.model.ModelDO;
import tech.qiantong.qmodel.module.model.dal.dataobject.modelVersion.ModelVersionDO;
import tech.qiantong.qmodel.module.model.dal.mapper.model.ModelMapper;
import tech.qiantong.qmodel.module.model.dal.mapper.modelVersion.ModelVersionMapper;
import tech.qiantong.qmodel.module.model.service.modelVersion.IModelVersionService;

import javax.annotation.Resource;
import javax.validation.ConstraintViolation;
import javax.validation.Validator;
import java.util.*;
import java.util.stream.Collectors;

/**
 * 模型版本Service业务层处理
 *
 * @author anivia
 * @date 2026-08-17
 */
@Slf4j
@Service
@Transactional(rollbackFor = Exception.class)
public class ModelVersionServiceImpl extends ServiceImpl<ModelVersionMapper, ModelVersionDO> implements IModelVersionService {

    @Resource
    private ModelMapper modelMapper;

    @Resource
    private Validator validator;
    /**
     * 查询模型版本分页列表
     *
     * @param pageReqVO 模型版本分页查询
     * @return 模型版本分页列表
     */
    @Override
    public PageResult<ModelVersionDO> getModelVersionPage(ModelVersionPageReqVO pageReqVO) {
        if (Objects.isNull(pageReqVO.getModelId())) {
            return new PageResult<>(0L);
        }
        return baseMapper.selectPage(pageReqVO);
    }

    /**
     * 创建模型版本
     *
     * @param createReqVO 模型版本
     * @return 模型版本编号
     */
    @Override
    public Long createModelVersion(ModelVersionSaveReqVO createReqVO) {
        // 校验参数
        Set<ConstraintViolation<ModelVersionSaveReqVO>> violations = validator.validate(createReqVO);
        if (!violations.isEmpty()) {
            // 拼接错误信息，抛出参数异常
            StringBuilder sb = new StringBuilder();
            for (ConstraintViolation<ModelVersionSaveReqVO> v : violations) {
                sb.append(v.getMessage()).append(";");
            }
            throw new ServiceException(sb.toString());
        }
        boolean versionExists = isModelVersionExists(createReqVO.getModelId(), createReqVO.getModelVersion());
        if (versionExists){
            throw new ServiceException("模型版本号已存在");
        }

        ModelVersionDO dictType = BeanUtils.toBean(createReqVO, ModelVersionDO.class);
        dictType.setId(null);
        baseMapper.insert(dictType);
        return dictType.getId();
    }

    /**
     * 更新模型版本
     *
     * @param updateReqVO 模型版本
     * @return 是否更新成功
     */
    @Override
    public Boolean updateModelVersion(ModelVersionSaveReqVO updateReqVO) {
        // 相关校验
        // 校验参数
        Set<ConstraintViolation<ModelVersionSaveReqVO>> violations = validator.validate(updateReqVO);
        if (!violations.isEmpty()) {
            // 拼接错误信息，抛出参数异常
            StringBuilder sb = new StringBuilder();
            for (ConstraintViolation<ModelVersionSaveReqVO> v : violations) {
                sb.append(v.getMessage()).append(";");
            }
            throw new ServiceException(sb.toString());
        }
        LambdaUpdateWrapper<ModelVersionDO> updateWrapper = Wrappers.lambdaUpdate(ModelVersionDO.class)
                .eq(ModelVersionDO::getId, updateReqVO.getId())
                .set(ModelVersionDO::getDigest, updateReqVO.getDigest())
                .set(ModelVersionDO::getDescription, updateReqVO.getDescription());
        // 更新模型版本
        return super.update(updateWrapper);
    }

    /**
     * 删除模型版本
     *
     * @param idList 模型版本编号
     * @return 是否删除成功
     */
    @Override
    public Integer removeModelVersion(Collection<Long> idList) {
        // 批量删除模型版本
        return baseMapper.deleteBatchIds(idList);
    }

    /**
     * 获得模型版本详情
     *
     * @param id 模型版本编号
     * @return 模型版本
     */
    @Override
    public ModelVersionDO getModelVersionById(Long id) {
        return baseMapper.selectById(id);
    }

    /**
     * 查询版本号是否存在
     *
     * @param modelId      模型id
     * @param modelVersion 模型版本号
     * @return 是否存在
     */
    @Override
    public boolean isModelVersionExists(Long modelId, String modelVersion) {
        LambdaQueryWrapper<ModelVersionDO> queryWrapper = Wrappers.lambdaQuery(ModelVersionDO.class)
                .eq(ModelVersionDO::getModelId, modelId)
                .eq(ModelVersionDO::getModelVersion, modelVersion);
        return baseMapper.selectCount(queryWrapper) > 0;
    }

    /**
     * 获取版本号列表字典
     *
     * @param modelId 模型id
     * @return 版本号列表字典
     */
    @Override
    public List<SysDictData> getModelVersionDict(Long modelId) {
        LambdaQueryWrapper<ModelVersionDO> queryWrapper = Wrappers.lambdaQuery(ModelVersionDO.class)
                .eq(ModelVersionDO::getModelId, modelId);
        List<ModelVersionDO> list = baseMapper.selectList(queryWrapper);
        if (CollUtil.isEmpty(list)) {
            return new ArrayList<>(0);
        }
        return list.stream().map(item -> {
            SysDictData dictData = new SysDictData();
            dictData.setDictLabel(item.getModelVersion());
            dictData.setDictValue(item.getModelVersion());
            return dictData;
        }).collect(Collectors.toList());
    }

    /**
     * todo：修改版本号
     *
     * @param modelVersion 模型版本信息
     * @return 是否切换成功
     */
    @Override
    public Boolean changeVersion(ModelVersionSaveReqVO modelVersion) {
        // 相关校验，校验是否已经上架
        // 修改模型版本信息
        ModelDO model = new ModelDO();
        model.setId(modelVersion.getModelId());
        model.setVersion(modelVersion.getModelVersion());

        return modelMapper.updateById(model) > 0;
    }

    /**
     * 根据模型id和版本号获取模型版本
     *
     * @param modelId 模型id
     * @param version 版本号
     * @return 模型版本
     */
    @Override
    public ModelVersionDO getModelVersion(Long modelId, String version) {
        LambdaQueryWrapper<ModelVersionDO> queryWrapper = Wrappers.lambdaQuery(ModelVersionDO.class)
                .eq(ModelVersionDO::getModelId, modelId)
                .eq(ModelVersionDO::getModelVersion, version);
        return baseMapper.selectOne(queryWrapper);
    }
}
