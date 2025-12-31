import request from '@/utils/request'

// 查询模型计算管理 列表
export function listCacl(query) {
  return request({
    url: '/modelReconstitution/cacl/list',
    method: 'get',
    params: query
  })
}

// 查询模型计算管理 详细
export function getCacl(id) {
  return request({
    url: '/modelReconstitution/cacl/' + id,
    method: 'get'
  })
}

// 新增模型计算管理
export function addCacl(data) {
  return request({
    url: '/modelReconstitution/cacl',
    method: 'post',
    data: data
  })
}

// 修改模型计算管理
export function updateCacl(data) {
  return request({
    url: '/modelReconstitution/cacl',
    method: 'put',
    data: data
  })
}

// 删除模型计算管理
export function delCacl(id) {
  return request({
    url: '/modelReconstitution/cacl/' + id,
    method: 'delete'
  })
}

// 开始计算模型计算管理
export function startCacl(id) {
  return request({
    url: '/modelReconstitution/cacl/calculate?modelCaclId=' + id,
    method: 'get',
  })
}

// 获取输入参数  模型计算管理
export function findModelInputById(id) {
  return request({
    url: '/modelReconstitution/cacl/findModelInputById?modelCaclId=' + id,
    method: 'get'
  })
}

// 获取输出结果  模型计算管理
export function findModelOutputById(id) {
  return request({
    url: '/modelReconstitution/cacl/findModelOutputById?modelCaclId=' + id,
    method: 'get'
  })
}
