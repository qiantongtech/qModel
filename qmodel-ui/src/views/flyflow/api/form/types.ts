/*
 * Copyright © 2025-present Jiangsu Qiantong Technology Co., Ltd.
 *  *
 * This file is part of qModel Module Platform (Open Source Edition).
 *  *
 * qModel is licensed under Apache License 2.0 with additional qModel terms.
 * You may use qModel for commercial purposes, but you may not remove, hide,
 * modify, or replace the qModel logo, copyright notices, license notices,
 * or attribution information without a separate commercial license.
 *  *
 * White-label use, OEM distribution, rebranding, or presenting qModel as
 * another product requires separate commercial authorization from
 * Jiangsu Qiantong Technology Co., Ltd.
 *  *
 * Business License: `https://qmodel.tech/`
 * See the LICENSE file in the project root for full license information.
 */

export interface FormGroupVO{
	name:string;
	formList:FormVO[];
}
export interface FormVO {
  name: string | "";
  id: String | "";
  type: string | "";
  typeName: string | "";
  placeholder: string;
  required: boolean;
  icon: String;
  props: FormConfigVO;
}
export interface FormConfigVO {
  minLength: Number;
  maxLength: Number;
	privateVal:Boolean;
	remoteConfig:Object;
	dataFrom:Number;
  value: any | "";
  regex: string | "";
  regexDesc: string | "";
  min: Number;
  max: Number;
  radixNum: Number;
  showChinese: boolean;
  self: boolean;
  multi: boolean;
  showThousandSymbol: boolean;
  fileList: any[];
  unit: string;
  options: FormConfigOptionVO[];
  maxSize: Number;
  suffixArray: String[];
}

export interface FormConfigOptionVO {
  key: String;
  value: String;
}


export interface FormConfigUserVO {
  id:string;
  name:string;
  type:string;
  avatar:string;
}
