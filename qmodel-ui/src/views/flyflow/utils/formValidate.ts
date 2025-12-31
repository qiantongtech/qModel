import * as util from "./objutil";


export function inputValidate(configValue: any) {

    let minLength = configValue.props.minLength;
    let maxLength = configValue.props.maxLength;
    let value = configValue.props.value;
    let regex = configValue.props.regex;
    let regexDesc = configValue.props.regexDesc;

    if (minLength && maxLength && maxLength < minLength) {

        return {
            valid: false,
            msg: configValue.name + ':长度设置错误'
        };
    }
    if (util.isNotBlank(regex)) {
        if (!util.isNotBlank(regexDesc)) {

            return {
                valid: false,
                msg: configValue.name + ':请填写正则表达式提示语'
            };
        }

    }

    if (util.isNotBlank(value)) {
        if (minLength) {
            if (value.length < minLength) {

                return {
                    valid: false,
                    msg: configValue.name + ':默认值长度不能小于' + minLength
                };
            }
        }
        if (maxLength) {
            if (value.length > maxLength) {

                return {
                    valid: false,
                    msg: configValue.name + ':默认值长度不能大于' + maxLength
                };
            }
        }
        if (util.isNotBlank(regex)) {
            var reg = new RegExp(regex, "g")
            if (!reg.test(value)) {

                return {
                    valid: false,
                    msg: configValue.name + ':默认值不符合正则表达式'
                };
            }
        }
    }
    return {
        valid: true
    };
}

export function descriptionValidate(configValue: any) {
    let placeHolder = configValue.placeholder;
    if (util.isBlank(placeHolder)) {
        return {
            valid: false, msg: configValue.name + ':请设置提示'
        }
    }
    return {
        valid: true
    };
}

export function timeValidate(configValue: any) {

    let min = configValue.props.min;
    let max = configValue.props.max;
    let defaultValue = configValue.props.value;


    let format = "HH:mm:ss";
    if (min && max) {
        let minDate = util.momentFunc(min, format);
        let maxDate = util.momentFunc(max, format);
        if (maxDate.isBefore(minDate)) {
            return {
                valid: false, msg: configValue.name + ':值范围设置错误'
            }
        }
    }


    if ((defaultValue)) {

        let valueDate = util.momentFunc(defaultValue, format);
        if (min) {
            let minDate = util.momentFunc(min, format);

            if (valueDate.isBefore(minDate)) {

                return {
                    valid: false, msg: configValue.name + ':默认值不能小于' + min
                }
            }
        }
        if (max) {
            let maxDate = util.momentFunc(max, format);

            if (maxDate.isBefore(valueDate)) {


                return {
                    valid: false, msg: configValue.name + ':默认值不能大于' + max
                }
            }
        }


    }

    return {
        valid: true
    };
}

export function dateValidate(configValue: any) {

    let min = configValue.props.min;
    let max = configValue.props.max;
    let defaultValue = configValue.props.value;


    let format = "YYYY-MM-DD";
    if (min && max) {
        let minDate = util.momentFunc(min, format);
        let maxDate = util.momentFunc(max, format);
        if (maxDate.isBefore(minDate)) {
            return {
                valid: false, msg: configValue.name + ':值范围设置错误'
            }
        }
    }


    if ((defaultValue)) {

        let valueDate = util.momentFunc(defaultValue, format);
        if (min) {
            let minDate = util.momentFunc(min, format);

            if (valueDate.isBefore(minDate)) {

                return {
                    valid: false, msg: configValue.name + ':默认值不能小于' + min
                }
            }
        }
        if (max) {
            let maxDate = util.momentFunc(max, format);

            if (maxDate.isBefore(valueDate)) {


                return {
                    valid: false, msg: configValue.name + ':默认值不能大于' + max
                }
            }
        }


    }

    return {
        valid: true
    };
}

export function dateTimeValidate(configValue: any) {

    let min = configValue.props.min;
    let max = configValue.props.max;
    let defaultValue = configValue.props.value;


    let format = "YYYY-MM-DD HH:mm:ss";
    if (min && max) {
        let minDate = util.momentFunc(min, format);
        let maxDate = util.momentFunc(max, format);
        if (maxDate.isBefore(minDate)) {
            return {
                valid: false, msg: configValue.name + ':值范围设置错误'
            }
        }
    }


    if ((defaultValue)) {

        let valueDate = util.momentFunc(defaultValue, format);
        if (min) {
            let minDate = util.momentFunc(min, format);

            if (valueDate.isBefore(minDate)) {

                return {
                    valid: false, msg: configValue.name + ':默认值不能小于' + min
                }
            }
        }
        if (max) {
            let maxDate = util.momentFunc(max, format);

            if (maxDate.isBefore(valueDate)) {


                return {
                    valid: false, msg: configValue.name + ':默认值不能大于' + max
                }
            }
        }


    }

    return {
        valid: true
    };
}

export function numberValidate(configValue: any) {

    let min = configValue.props.min;
    let max = configValue.props.max;
    let defaultValue = configValue.props.value;
    let radixNum = configValue.props.radixNum;

    if (min && max && max < min) {
        return {
            valid: false, msg: configValue.name + ':值范围设置错误'
        }
    }

    if (radixNum) {
        if (min) {
            let num = util.getNumberRadixNum(min);
            if (num > radixNum) {

                return {
                    valid: false, msg: configValue.name + ':最小值小数点位数不能超过' + radixNum
                }
            }
        }
        if (max) {
            let num = util.getNumberRadixNum(max);
            if (num > radixNum) {
                return {
                    valid: false, msg: configValue.name + ':最大值小数点位数不能超过' + radixNum
                }
            }
        }
    }

    if ((defaultValue)) {
        if (radixNum) {
            let num = util.getNumberRadixNum(defaultValue);
            if (num > radixNum) {

                return {
                    valid: false, msg: configValue.name + ':默认值小数点位数不能超过' + radixNum
                }
            }
        }
        if (min) {
            if (defaultValue < min) {

                return {
                    valid: false, msg: configValue.name + ':默认值不能小于' + min
                }
            }
        }
        if (max) {
            if (defaultValue > max) {

                return {
                    valid: false, msg: configValue.name + ':默认值不能大于' + max
                }
            }
        }


    }

    return {
        valid: true
    };
}

export function selectValidate(configValue: any) {

    var options = configValue.props.options;
    if (!options) {
        options = []
    }

    if (options.length < 1) {
        return {
            valid: false, msg: configValue.name + ":请设置选项"
        };
    }

    {
        var keyList = options.map((w) => w.key);
        let newList = Array.from(new Set(keyList));
        if (keyList.length > newList.length) {

            return {
                valid: false, msg: configValue.name + ":选项值不能重复"
            };
        }
    }
    {
        let length = options.filter(
            (res) => util.isBlank(res.key) || util.isBlank(res.value)
        ).length;
        if (length > 0) {

            return {
                valid: false, msg: configValue.name + ":选项不能为空"
            };
        }
    }

    {
        var keyList = options.map((w) => w.value);
        let newList = Array.from(new Set(keyList));
        if (keyList.length > newList.length) {
            return {
                valid: false, msg: configValue.name + ":选项标签不能重复"
            };
        }
    }
	//判断远程加载
	if(configValue.props.dataFrom===2){
		let r = util.checkHttpSetting(configValue.props.remoteConfig,configValue.name);
		if(!r.ok){
			return {
				valid:false,
				msg:r.msg
			}
		}
	}
	//判断默认值
	let value = configValue.props.value;
	if(value){
		for(var item of value){
			let le = options.filter(res=>res.key===item.key).length;
			if(le<=0){
				    return {
					valid: false, msg: configValue.name + ":默认值非选项"
				};
			}
		}
	}
    return {
        valid: true
    };
}


export function fileValidate(configValue: any) {
    let min = configValue.props.min;
    let max = configValue.props.max;

    if (min && max && max < min) {

        return {
            valid: false, msg: configValue.name + ":数量设置错误"
        };
    }

    return {
        valid: true
    };
}

export let formValidateDict = {
    'Input': inputValidate,
    'Textarea': inputValidate,
    'Number': numberValidate,
    'Money': numberValidate,
    'Description': descriptionValidate,
    'Date': dateValidate,
    'DateTime': dateTimeValidate,
    'Time': timeValidate,
    'SingleSelect': selectValidate,
    'MultiSelect': selectValidate,
    'UploadFile': fileValidate,
    'UploadImage': fileValidate

}

