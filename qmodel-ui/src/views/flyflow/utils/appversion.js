

//判断是否是飞书
export function isFeishu(){
	const userAgentStr = navigator.userAgent
	return  (userAgentStr.indexOf("Lark") >= 0);

};
//是否是企微
export function isWxCp() {
	const userAgentStr = navigator.userAgent

	return userAgentStr.indexOf('wxwork')>=0;
}

//判断是钉钉
export function isDD() {
	let userAgent = navigator.userAgent;
	return userAgent.indexOf('DingTalk')>=0;
}
//判断是否是手机端
export function isMobile() {
	const ua = navigator.userAgent.toLowerCase();
	return /mobile|android|iphone|ipod|phone|ipad/i.test(ua);
}
