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

/**
 * 部门查询参数
 */
export interface DeptQuery {
  keywords?: string;
  status?: number;
}

/**
 * 部门类型
 */
export interface DeptVO {
  /**
   * 子部门
   */
  children?: DeptVO[];
  /**
   * 创建时间
   */
  createTime?: Date;
  /**
   * 部门ID
   */
  id?: number;
  /**
   * 部门名称
   */
  name?: string;
  /**
   * 父部门ID
   */
  parentId?: number;
  /**
   * 排序
   */
  sort?: number;
  /**
   * 状态(1:启用；0:禁用)
   */
  status?: number;
  /**
   * 修改时间
   */
  updateTime?: Date;
}

/**
 * 部门表单类型
 */
export interface DeptForm {
  /**
   * 部门ID(新增不填)
   */
  id?: number;
  /**
   * 部门名称
   */
  name?: string;
  /**
   * 父部门ID
   */
  parentId: number;
  /**
   * 排序
   */
  sort?: number;
  /**
   * 状态(1:启用；0：禁用)
   */
  status?: number;
	/**
	 * 主管id
	 */
	leaderUserId?:number;
	/**
	 * 主管名称
	 */
  leaderName?:String;
	/**
	 * 主管头像
	 */
	leaderAvatar?:String;
}
