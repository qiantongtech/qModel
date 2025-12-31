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
