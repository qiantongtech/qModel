const gets = {} as any;
const modules = import.meta.glob("../components/form/rule/*.ts", { eager: true });

for (let each in modules) {
  // var str = (modules[each] as any).default.__file;
  // var obj = str.lastIndexOf("/");
  //
  // const name = str.substr(obj + 1, str.lastIndexOf(".") - obj - 1);
  const name = modules[each].default.__name;




  gets[name] = (modules[each] as any).default;
}

export default gets;
