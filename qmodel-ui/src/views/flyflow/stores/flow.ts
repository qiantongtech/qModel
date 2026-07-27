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

/*
 * @Date: 2022-08-25 14:13:11
 * @LastEditors: StavinLi 495727881@qq.com
 * @LastEditTime: 2023-05-24 15:00:32
 * @FilePath: /Workflow-Vue3/src/store/index.js
 */
import {defineStore} from "pinia";
import {FormVO} from "../api/form/types";
import {reactive} from "vue";


export const useFlowStore = defineStore("flow", {
    state: () => {
        return {
			formValue:{

			},
            step1: {
                logo: "",
                name: "",
                flowId: "",
				uniqueId: "",
                groupId: undefined,
                admin: reactive([]),
                rangeList: reactive([]),
                remark: "",
            },
            step3: {},
            step2: [] as FormVO[],
            step2Form: [] as FormVO[],
            step2Pc: [] as FormVO[]
        };
    },
    actions: {
		setFormValue(v){
			this.formValue=v;
		},
        setStep2(p: FormVO[]) {
            this.step2 = p;
        },
        setStep2Pc(p: FormVO[]) {
            this.step2Pc = p;
        },
        setStep2Form(p: FormVO[]) {
            this.step2Form = p;
        },
        setStep3(p: any) {
            this.step3 = p;
        }
    },
});
