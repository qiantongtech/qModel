const gets = {} as any;
const modules = import.meta.glob("../components/form/rule/*.ts", {eager: true});
for (let each in modules) {
	let split = each.split("/");
	let item = split[split.length - 1];
	gets[item.split(".")[0]] = (modules[each]);
}

export default gets;
