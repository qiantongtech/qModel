import request from '@/utils/request'

// 查询模型管理 列表
export function listModel(query) {
  return request({
    url: '/modelReconstitution/model/list',
    method: 'get',
    params: query
  })
}

// 查询模型管理 详细
export function getModel(id) {
  return request({
    url: '/modelReconstitution/model/' + id,
    method: 'get'
  })
}

// 查询模型管理 分类
export function getmodelList(classifyId) {
  return request({
    url: '/modelReconstitution/model/list/children/' + classifyId,
    method: 'get'
  })
}

// 新增模型管理
export function addModel(data) {
  return request({
    url: '/modelReconstitution/model',
    method: 'post',
    data: data
  })
}

// 修改模型管理 基础信息
export function updateModel(data) {
  return request({
    url: '/modelReconstitution/model',
    method: 'put',
    data: data
  })
}

// 删除模型管理
export function delModel(id) {
  return request({
    url: '/modelReconstitution/model/' + id,
    method: 'delete'
  })
}

// 新增模型管理
export function getFileList(data) {
  return request({
    url: '/modelReconstitution/model/getFileList',
    method: 'post',
    data: data
  })
}
