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
