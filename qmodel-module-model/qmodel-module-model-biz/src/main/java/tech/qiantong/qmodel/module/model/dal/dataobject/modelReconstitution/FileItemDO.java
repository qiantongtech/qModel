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

package tech.qiantong.qmodel.module.model.dal.dataobject.modelReconstitution;

import com.alibaba.fastjson.annotation.JSONField;
import java.util.List;

/**
 * 文件项数据对象
 * 用于表示压缩包内文件列表的结构
 *
 * @author qModel
 * @date 2026-01-21
 */
public class FileItemDO {

    /**
     * 文件或文件夹名称
     */
    @JSONField(name = "fileName")
    private String fileName;

    /**
     * 子文件列表（如果是文件夹的话）
     */
    @JSONField(name = "children")
    private List<FileItemDO> children;

    public FileItemDO() {
    }

    public FileItemDO(String fileName) {
        this.fileName = fileName;
    }

    public FileItemDO(String fileName, List<FileItemDO> children) {
        this.fileName = fileName;
        this.children = children;
    }

    public String getFileName() {
        return fileName;
    }

    public void setFileName(String fileName) {
        this.fileName = fileName;
    }

    public List<FileItemDO> getChildren() {
        return children;
    }

    public void setChildren(List<FileItemDO> children) {
        this.children = children;
    }

    /**
     * 添加子文件项
     * @param child 子文件项
     */
    public void addChild(FileItemDO child) {
        if (this.children == null) {
            this.children = new java.util.ArrayList<>();
        }
        this.children.add(child);
    }
}