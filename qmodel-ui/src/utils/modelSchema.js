/**
 * @file 模型 JSON Schema 公共工具
 * 提供 Schema 安全解析与参数默认值（default 关键字）提取能力，
 * 供模型新增第四步测试、详情在线调试、模型计算参数绑定等场景统一回填使用。
 */

/**
 * 安全解析 JSON Schema 文本
 * @param {string|Object} schema Schema 文本或对象
 * @returns {Object|null} 解析后的 Schema 对象，非法时返回 null
 */
export function parseJsonSchema(schema) {
  if (!schema) return null
  if (typeof schema === 'object') return schema
  try {
    const parsed = JSON.parse(schema)
    return parsed && typeof parsed === 'object' ? parsed : null
  } catch {
    return null
  }
}

/**
 * 判断参数定义是否配置了有效默认值
 * @param {Object} prop 单个参数的 Schema 定义
 * @returns {boolean} 是否配置了 default（null/undefined 视为未配置）
 */
export function hasSchemaDefault(prop) {
  return !!prop && prop.default !== undefined && prop.default !== null
}

/**
 * 将 Schema 参数默认值转换为表单控件可直接回填的值
 * 转换规则：
 * - integer/number -> Number（非法数字视为未配置）
 * - boolean -> 布尔值
 * - array/object -> JSON 字符串（文本框展示，提交时再解析还原）
 * - 其余（string/file 等） -> 字符串
 * @param {Object} prop 单个参数的 Schema 定义
 * @returns {*} 回填值，未配置默认值时返回 undefined
 */
export function getSchemaDefaultValue(prop) {
  if (!hasSchemaDefault(prop)) return undefined
  const def = prop.default
  const type = prop.type

  if (type === 'integer' || type === 'number') {
    const num = Number(def)
    return Number.isNaN(num) ? undefined : num
  }
  if (type === 'boolean') {
    return typeof def === 'boolean' ? def : String(def).toLowerCase() === 'true'
  }
  if (type === 'array' || type === 'object' || typeof def === 'object') {
    try {
      return JSON.stringify(def)
    } catch {
      return undefined
    }
  }
  return String(def)
}

/**
 * 将默认值格式化为只读展示文本
 * @param {*} def 默认值
 * @returns {string} 展示文本
 */
export function formatSchemaDefault(def) {
  if (def === undefined || def === null) return ''
  if (typeof def === 'object') {
    try {
      return JSON.stringify(def)
    } catch {
      return String(def)
    }
  }
  return String(def)
}

/** JSON Schema 规范允许的 type 取值 */
const STANDARD_TYPES = ['string', 'number', 'integer', 'boolean', 'object', 'array', 'null']

/** 常见非标准 type 到标准 type 的映射（大小写不敏感），用于兼容历史 Schema */
const TYPE_ALIAS = {
  file: 'string',
  text: 'string',
  date: 'string',
  datetime: 'string',
  time: 'string',
  timestamp: 'string',
  float: 'number',
  double: 'number',
  decimal: 'number',
  int: 'integer',
  long: 'integer',
  short: 'integer',
  byte: 'integer',
  bool: 'boolean'
}

/**
 * 把 Schema 中不合法的 type 归一化为标准取值
 *
 * ajv 会按 JSON Schema 元规范校验入参 Schema，type 取值不在标准范围内时会直接抛
 * 「schema is invalid: data/properties/xxx/type must be equal to one of the allowed values」，
 * 导致测试与在线调试无法继续。本方法只作用于调试用的副本，不会写回已保存的 Schema。
 *
 * @param {Object} schema Schema 对象，会被直接修改
 * @returns {string[]} 被修正字段的说明，无修正时返回空数组
 */
export function normalizeSchemaTypes(schema) {
  const fixes = []

  const walk = (node, path) => {
    if (!node || typeof node !== 'object') return

    const type = node.type
    if (type !== undefined && type !== null) {
      const list = Array.isArray(type) ? type : [type]
      const invalid = list.filter((item) => !STANDARD_TYPES.includes(item))
      if (invalid.length > 0) {
        const raw = invalid.join(' | ')
        const mapped = TYPE_ALIAS[String(raw).toLowerCase()] || 'string'
        node.type = mapped
        fixes.push(`${path || '根节点'} 的 type「${raw}」不是合法值，已按 ${mapped} 校验`)
      }
    }

    Object.keys(node.properties || {}).forEach((key) => {
      walk(node.properties[key], path ? `${path}.${key}` : key)
    })
    if (node.items) {
      walk(node.items, `${path || 'items'}[]`)
    }
  }

  walk(schema, '')
  return fixes
}

/**
 * 递归移除 Schema 中所有 format: 'binary'，ajv 默认不认识该格式
 * @param {Object} node Schema 节点，会被直接修改
 */
export function stripBinaryFormat(node) {
  if (!node || typeof node !== 'object') return
  if (node.format === 'binary') {
    delete node.format
  }
  Object.keys(node).forEach((key) => stripBinaryFormat(node[key]))
}
