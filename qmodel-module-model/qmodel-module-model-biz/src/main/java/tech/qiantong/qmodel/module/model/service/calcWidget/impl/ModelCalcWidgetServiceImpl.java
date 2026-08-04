/*
 * Copyright © 2025-present Jiangsu Qiantong Technology Co., Ltd.
 *
 * This file is part of qModel Module Platform (Open Source Edition).
 *
 * qModel is licensed under Apache License 2.0 with additional qModel terms.
 * You may use qModel for commercial purposes, but you may not remove, hide,
 * modify, or replace the qModel logo, copyright notices, license notices,
 * or attribution information without a separate commercial license.
 *
 * White-label use, OEM distribution, rebranding, or presenting qModel as
 * another product requires separate commercial authorization from
 * Jiangsu Qiantong Technology Co., Ltd.
 *
 * Business License: `https://qmodel.tech/`
 * See the LICENSE file in the project root for full license information.
 */

package tech.qiantong.qmodel.module.model.service.calcWidget.impl;

import java.util.Collection;
import java.util.List;
import java.util.ArrayList;
import java.util.Map;
import java.util.HashMap;
import java.util.Objects;
import java.util.stream.Collectors;

import com.alibaba.fastjson2.JSON;
import com.alibaba.fastjson2.JSONObject;
import com.baomidou.mybatisplus.extension.service.impl.ServiceImpl;
import lombok.extern.slf4j.Slf4j;
import javax.annotation.Resource;
import tech.qiantong.qmodel.common.core.page.PageResult;
import tech.qiantong.qmodel.common.utils.object.BeanUtils;
import tech.qiantong.qmodel.common.utils.StringUtils;
import tech.qiantong.qmodel.common.exception.ServiceException;
import com.baomidou.mybatisplus.core.conditions.query.QueryWrapper;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;
import tech.qiantong.qmodel.module.model.controller.admin.calcWidget.vo.ModelCalcWidgetPageReqVO;
import tech.qiantong.qmodel.module.model.controller.admin.calcWidget.vo.ModelCalcWidgetRespVO;
import tech.qiantong.qmodel.module.model.controller.admin.calcWidget.vo.ModelCalcWidgetSaveReqVO;
import tech.qiantong.qmodel.module.model.controller.admin.calcWidget.vo.ModelCalcWidgetYFieldVO;
import tech.qiantong.qmodel.module.model.dal.dataobject.calcWidget.ModelCalcWidgetDO;
import tech.qiantong.qmodel.module.model.dal.dataobject.calc.ModelCalcDO;
import tech.qiantong.qmodel.module.model.dal.mapper.calcWidget.ModelCalcWidgetMapper;
import tech.qiantong.qmodel.module.model.dal.mapper.calc.ModelCalcMapper;
import tech.qiantong.qmodel.module.model.service.calcWidget.IModelCalcWidgetService;
/**
 * 模型计算任务可视化组件配置Service业务层处理
 *
 * @author anivia
 * @date 2026-08-04
 */
@Slf4j
@Service
@Transactional(rollbackFor = Exception.class)
public class ModelCalcWidgetServiceImpl  extends ServiceImpl<ModelCalcWidgetMapper,ModelCalcWidgetDO> implements IModelCalcWidgetService {
    @Resource
    private ModelCalcWidgetMapper modelCalcWidgetMapper;

    @Resource
    private ModelCalcMapper modelCalcMapper;

    @Override
    public PageResult<ModelCalcWidgetDO> getModelCalcWidgetPage(ModelCalcWidgetPageReqVO pageReqVO) {
        return modelCalcWidgetMapper.selectPage(pageReqVO);
    }

    @Override
    public List<ModelCalcWidgetRespVO> getModelCalcWidgetListByCalcId(Long calcId) {
        if (calcId == null) {
            return new ArrayList<>();
        }
        List<ModelCalcWidgetDO> list = modelCalcWidgetMapper.selectList(
                new QueryWrapper<ModelCalcWidgetDO>()
                        .eq("calc_id", calcId)
                        .eq("valid_flag", 1)
                        .orderByAsc("sort", "id")
        );
        return list.stream().map(this::convertToRespVO).collect(Collectors.toList());
    }

    @Override
    public Long createModelCalcWidget(ModelCalcWidgetSaveReqVO createReqVO) {
        // 校验并补全计算任务信息
        ModelCalcDO calc = validateAndFillCalc(createReqVO);

        // 校验组件配置
        validateWidgetConfig(createReqVO);

        ModelCalcWidgetDO widget = BeanUtils.toBean(createReqVO, ModelCalcWidgetDO.class);
        widget.setConfig(buildConfigJson(createReqVO));
        if (widget.getSort() == null) {
            widget.setSort(0L);
        }
        if (widget.getValidFlag() == null) {
            widget.setValidFlag(true);
        }
        if (calc != null) {
            widget.setCompanyId(calc.getCompanyId());
            if (widget.getModelId() == null) {
                widget.setModelId(calc.getModelId());
            }
        }
        modelCalcWidgetMapper.insert(widget);
        return widget.getId();
    }

    @Override
    public int updateModelCalcWidget(ModelCalcWidgetSaveReqVO updateReqVO) {
        if (updateReqVO.getId() == null) {
            throw new ServiceException("组件ID不能为空");
        }
        ModelCalcWidgetDO existing = modelCalcWidgetMapper.selectById(updateReqVO.getId());
        if (existing == null) {
            throw new ServiceException("可视化组件不存在");
        }

        // 校验并补全计算任务信息
        validateAndFillCalc(updateReqVO);

        // 校验组件配置
        validateWidgetConfig(updateReqVO);

        ModelCalcWidgetDO widget = BeanUtils.toBean(updateReqVO, ModelCalcWidgetDO.class);
        widget.setConfig(buildConfigJson(updateReqVO));
        if (widget.getSort() == null) {
            widget.setSort(existing.getSort());
        }
        // 保留原创建信息，防止被覆盖
        widget.setCompanyId(existing.getCompanyId());
        widget.setCreateBy(existing.getCreateBy());
        widget.setCreatorId(existing.getCreatorId());
        widget.setCreateTime(existing.getCreateTime());
        return modelCalcWidgetMapper.updateById(widget);
    }

    @Override
    public int removeModelCalcWidget(Collection<Long> idList) {
        // 批量删除模型计算任务可视化组件配置
        return modelCalcWidgetMapper.deleteBatchIds(idList);
    }

    @Override
    public ModelCalcWidgetDO getModelCalcWidgetById(Long id) {
        return modelCalcWidgetMapper.selectById(id);
    }

    @Override
    public List<ModelCalcWidgetDO> getModelCalcWidgetList() {
        return modelCalcWidgetMapper.selectList();
    }

    @Override
    public Map<Long, ModelCalcWidgetDO> getModelCalcWidgetMap() {
        List<ModelCalcWidgetDO> modelCalcWidgetList = modelCalcWidgetMapper.selectList();
        return modelCalcWidgetList.stream()
                .collect(Collectors.toMap(
                        ModelCalcWidgetDO::getId,
                        modelCalcWidgetDO -> modelCalcWidgetDO,
                        // 保留已存在的值
                        (existing, replacement) -> existing
                ));
    }


        /**
         * 导入模型计算任务可视化组件配置数据
         *
         * @param importExcelList 模型计算任务可视化组件配置数据列表
         * @param isUpdateSupport 是否更新支持，如果已存在，则进行更新数据
         * @param operName 操作用户
         * @return 结果
         */
        @Override
        public String importModelCalcWidget(List<ModelCalcWidgetRespVO> importExcelList, boolean isUpdateSupport, String operName) {
            if (StringUtils.isNull(importExcelList) || importExcelList.size() == 0) {
                throw new ServiceException("导入数据不能为空！");
            }

            int successNum = 0;
            int failureNum = 0;
            List<String> successMessages = new ArrayList<>();
            List<String> failureMessages = new ArrayList<>();

            for (ModelCalcWidgetRespVO respVO : importExcelList) {
                try {
                    ModelCalcWidgetDO modelCalcWidgetDO = BeanUtils.toBean(respVO, ModelCalcWidgetDO.class);
                    Long modelCalcWidgetId = respVO.getId();
                    if (isUpdateSupport) {
                        if (modelCalcWidgetId != null) {
                            ModelCalcWidgetDO existingModelCalcWidget = modelCalcWidgetMapper.selectById(modelCalcWidgetId);
                            if (existingModelCalcWidget != null) {
                                modelCalcWidgetMapper.updateById(modelCalcWidgetDO);
                                successNum++;
                                successMessages.add("数据更新成功，ID为 " + modelCalcWidgetId + " 的模型计算任务可视化组件配置记录。");
                            } else {
                                failureNum++;
                                failureMessages.add("数据更新失败，ID为 " + modelCalcWidgetId + " 的模型计算任务可视化组件配置记录不存在。");
                            }
                        } else {
                            failureNum++;
                            failureMessages.add("数据更新失败，某条记录的ID不存在。");
                        }
                    } else {
                        QueryWrapper<ModelCalcWidgetDO> queryWrapper = new QueryWrapper<>();
                        queryWrapper.eq("id", modelCalcWidgetId);
                        ModelCalcWidgetDO existingModelCalcWidget = modelCalcWidgetMapper.selectOne(queryWrapper);
                        if (existingModelCalcWidget == null) {
                            modelCalcWidgetMapper.insert(modelCalcWidgetDO);
                            successNum++;
                            successMessages.add("数据插入成功，ID为 " + modelCalcWidgetId + " 的模型计算任务可视化组件配置记录。");
                        } else {
                            failureNum++;
                            failureMessages.add("数据插入失败，ID为 " + modelCalcWidgetId + " 的模型计算任务可视化组件配置记录已存在。");
                        }
                    }
                } catch (Exception e) {
                    failureNum++;
                    String errorMsg = "数据导入失败，错误信息：" + e.getMessage();
                    failureMessages.add(errorMsg);
                    log.error(errorMsg, e);
                }
            }
            StringBuilder resultMsg = new StringBuilder();
            if (failureNum > 0) {
                resultMsg.append("很抱歉，导入失败！共 ").append(failureNum).append(" 条数据格式不正确，错误如下：");
                resultMsg.append("<br/>").append(String.join("<br/>", failureMessages));
                throw new ServiceException(resultMsg.toString());
            } else {
                resultMsg.append("恭喜您，数据已全部导入成功！共 ").append(successNum).append(" 条。");
            }
            return resultMsg.toString();
        }

    /**
     * 校验计算任务是否存在，并补全请求中的租户/模型信息
     */
    private ModelCalcDO validateAndFillCalc(ModelCalcWidgetSaveReqVO reqVO) {
        if (reqVO.getCalcId() == null) {
            throw new ServiceException("计算任务ID不能为空");
        }
        ModelCalcDO calc = modelCalcMapper.selectById(reqVO.getCalcId());
        if (calc == null) {
            throw new ServiceException("计算任务不存在");
        }
        if (reqVO.getCompanyId() == null) {
            reqVO.setCompanyId(calc.getCompanyId());
        }
        if (reqVO.getModelId() == null) {
            reqVO.setModelId(calc.getModelId());
        }
        return calc;
    }

    /**
     * 校验组件配置是否合法
     */
    private void validateWidgetConfig(ModelCalcWidgetSaveReqVO reqVO) {
        String type = reqVO.getType();
        if (!"base64".equals(type) && !"line".equals(type)) {
            throw new ServiceException("不支持的组件类型：" + type);
        }
        if ("base64".equals(type)) {
            if (StringUtils.isEmpty(reqVO.getField())) {
                throw new ServiceException("Base64 组件字段绑定不能为空");
            }
            return;
        }
        if ("line".equals(type)) {
            if (StringUtils.isEmpty(reqVO.getXField())) {
                throw new ServiceException("折线图 X 轴字段不能为空");
            }
            List<ModelCalcWidgetYFieldVO> yFields = reqVO.getYFields();
            if (yFields == null || yFields.isEmpty()) {
                throw new ServiceException("折线图至少需要一条 Y 轴数据");
            }
            if (yFields.size() > 5) {
                throw new ServiceException("折线图最多支持 5 条 Y 轴数据");
            }
            for (int i = 0; i < yFields.size(); i++) {
                ModelCalcWidgetYFieldVO item = yFields.get(i);
                if (item == null || StringUtils.isEmpty(item.getTag())) {
                    throw new ServiceException("第 " + (i + 1) + " 条 Y 轴图例名称不能为空");
                }
                if (StringUtils.isEmpty(item.getField())) {
                    throw new ServiceException("第 " + (i + 1) + " 条 Y 轴字段绑定不能为空");
                }
            }
        }
    }

    /**
     * 根据前端平铺字段组装 config JSON
     */
    private String buildConfigJson(ModelCalcWidgetSaveReqVO reqVO) {
        Map<String, Object> config = new HashMap<>();
        if ("base64".equals(reqVO.getType())) {
            config.put("field", reqVO.getField());
        } else if ("line".equals(reqVO.getType())) {
            config.put("xField", reqVO.getXField());
            List<Map<String, String>> yFields = reqVO.getYFields().stream()
                    .filter(Objects::nonNull)
                    .map(item -> {
                        Map<String, String> map = new HashMap<>();
                        map.put("tag", item.getTag());
                        map.put("field", item.getField());
                        return map;
                    }).collect(Collectors.toList());
            config.put("yFields", yFields);
        }
        return JSON.toJSONString(config);
    }

    /**
     * 将 DO 转换为带平铺字段的 RespVO
     */
    private ModelCalcWidgetRespVO convertToRespVO(ModelCalcWidgetDO widget) {
        if (widget == null) {
            return null;
        }
        ModelCalcWidgetRespVO respVO = BeanUtils.toBean(widget, ModelCalcWidgetRespVO.class);
        if (StringUtils.isNotEmpty(widget.getConfig())) {
            try {
                JSONObject config = JSON.parseObject(widget.getConfig());
                if ("base64".equals(widget.getType())) {
                    respVO.setField(config.getString("field"));
                } else if ("line".equals(widget.getType())) {
                    respVO.setXField(config.getString("xField"));
                    if (config.getJSONArray("yFields") != null) {
                        List<ModelCalcWidgetYFieldVO> yFields = config.getJSONArray("yFields").toJavaList(ModelCalcWidgetYFieldVO.class);
                        respVO.setYFields(yFields);
                    }
                }
            } catch (Exception e) {
                log.warn("可视化组件 config 解析失败，id={}，config={}", widget.getId(), widget.getConfig(), e);
            }
        }
        return respVO;
    }
}
