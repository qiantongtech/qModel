/**
 * 可视化组件数据解析（纯函数）
 *
 * 设计原则：完全由配置驱动。配置里写了什么路径就取什么值，
 * 不做结构自动识别、不做字段猜测，展示效果可预期。
 */

/**
 * 按点分路径取值，支持 arr[0] / arr[*]（[*] 取索引 0，用于兼容历史配置）；
 * 空路径或 '$' 表示根节点。
 */
export function resolvePath(root, path) {
  if (!path || path === '$') return root;
  let value = root;
  for (const rawKey of String(path).split('.')) {
    if (value === null || value === undefined) return undefined;
    const arrayMatch = rawKey.match(/^(.+)\[(\*|\d+)\]$/);
    if (arrayMatch) {
      const arr = value[arrayMatch[1]];
      if (!Array.isArray(arr)) return undefined;
      const index = arrayMatch[2] === '*' ? 0 : parseInt(arrayMatch[2], 10);
      value = arr[index];
    } else {
      value = value[rawKey];
    }
  }
  return value;
}

/**
 * 数值转换：null / 空值 / 非数值一律返回 null（图表断点），不能补 0；
 * 0、负数、数字字符串按原值保留。
 */
export function toNumeric(item) {
  if (item === null || item === undefined || item === '') return null;
  if (typeof item === 'number') return Number.isFinite(item) ? item : null;
  if (typeof item === 'boolean') return null;
  const num = parseFloat(item);
  return Number.isFinite(num) ? num : null;
}

export function toCategory(item) {
  return item === null || item === undefined || item === '' ? '-' : String(item);
}

const asArray = (value) => (Array.isArray(value) ? value : []);
const asObject = (value) =>
  value && typeof value === 'object' && !Array.isArray(value) ? value : {};

/** 老配置没有 shape 字段，一律按并行数组解析 */
export function getWidgetShape(config) {
  return (config && config.shape) || 'parallel';
}

/**
 * 按配置把任意返回结果解析成图表组件的统一输入：
 * { xValue: [...], series: [{ name, value: [...] }] }
 */
export function resolveWidgetData(config, outputResult) {
  const safeConfig = config || {};
  const shape = getWidgetShape(safeConfig);
  const yFields = asArray(safeConfig.yFields);

  // 对象数组：按配置者选中的列名做整列抽取
  if (shape === 'records') {
    const rows = asArray(resolvePath(outputResult, safeConfig.path));
    return {
      xValue: rows.map((row) => toCategory(asObject(row)[safeConfig.xField])),
      series: yFields.map((field) => ({
        name: field.tag || '',
        value: rows.map((row) => toNumeric(asObject(row)[field.field]))
      }))
    };
  }

  // 键值数组：对象的每个数值数组 key 各成一条系列
  if (shape === 'seriesMap') {
    const map = asObject(resolvePath(outputResult, safeConfig.path));
    const series = yFields.map((field) => ({
      name: field.tag || '',
      value: asArray(map[field.field]).map(toNumeric)
    }));
    let xValue = safeConfig.xField
      ? asArray(map[safeConfig.xField]).map(toCategory)
      : [];
    if (xValue.length === 0) {
      const len = series.reduce((max, item) => Math.max(max, item.value.length), 0);
      xValue = Array.from({ length: len }, (_, index) => String(index + 1));
    }
    return { xValue, series };
  }

  // 并行数组（含历史配置）
  const series = yFields.map((field) => ({
    name: field.tag || '',
    value: asArray(resolvePath(outputResult, field.field)).map(toNumeric)
  }));
  let xValue = asArray(resolvePath(outputResult, safeConfig.xField)).map(toCategory);
  if (xValue.length === 0) {
    const len = series.reduce((max, item) => Math.max(max, item.value.length), 0);
    xValue = Array.from({ length: len }, (_, index) => String(index + 1));
  }
  return { xValue, series };
}

/**
 * 把后端返回的组件记录整理成表单/渲染用的平铺配置。
 * 优先使用 config 原串（新配置），后端平铺字段作为旧数据兜底。
 */
export function parseWidgetConfig(widget) {
  let config = {};
  if (widget && widget.config) {
    try {
      config = typeof widget.config === 'string'
        ? JSON.parse(widget.config)
        : widget.config;
    } catch (error) {
      config = {};
    }
  }
  if (!config || typeof config !== 'object') config = {};
  const yFields = asArray(config.yFields ?? widget?.yFields);
  return {
    shape: getWidgetShape(config),
    path: config.path ?? widget?.path ?? '',
    field: config.field ?? widget?.field ?? '',
    xField: config.xField ?? widget?.xField ?? '',
    yFields: yFields.map((item) => ({
      tag: item?.tag || '',
      field: item?.field || ''
    }))
  };
}

/** 按配置生成写入 model_calc_widget.config 的 JSON */
export function buildWidgetConfig(form) {
  if (form.type === 'base64') {
    return { field: form.field };
  }
  const config = {
    shape: form.shape || 'parallel',
    xField: form.xField || '',
    yFields: (form.yFields || []).map((item) => ({
      tag: item.tag,
      field: item.field
    }))
  };
  if (config.shape !== 'parallel') {
    config.path = form.path || '$';
  }
  return config;
}
