import {useFlowStore} from '../stores/flow'
import {computed} from "vue";
import * as util from "@/views/flyflow/utils/objutil.js";
let flowStore = useFlowStore();
const step2FormList = computed(() => {
	let step2 = flowStore.step2;

	return step2;
})


export function getAboveSameTypeFormList(aboveFormId,type,autoAddStarter=false){

	let value = step2FormList.value;


	var fList = [];

	if (util.isNotBlank(aboveFormId)) {
		for (var it of value) {
			if (it.id === aboveFormId) {
				break
			}
			fList.push(it)
		}

	} else {
		fList = value;
	}

	let $deepCopy = util.deepCopy(fList.filter(res =>
		res.type != 'SelectMultiUser' &&
		res.type != 'SelectMultiDept' &&
		res.type != 'Description' &&

		res.type != 'UploadImage' &&
		res.type != 'UploadFile'
	));


	//自动添加发起人信息
	if(autoAddStarter){
		$deepCopy.push({
			id: 'rootUser',
			name: '发起人',
			type: "SelectUser",
			typeName: "用户"
		})
	}




	//判断类型
	if(util.isNotBlank(type)){
		return $deepCopy.filter(res=>res.type===type);
	}

	return $deepCopy;
}
