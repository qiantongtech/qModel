import request from '@/utils/request'

// 查询模型管理 列表
export function listModel(query) {
  return request({
    url: '/model/model/list',
    method: 'get',
    params: query
  })
}

// 查询模型管理 详细
export function getModel(id) {
  return request({
    url: '/model/model/' + id,
    method: 'get'
  })
}

// 查询模型管理 分类
export function getmodelList(classifyId) {
  return request({
    url: '/model/model/list/children/' + classifyId,
    method: 'get'
  })
}

// 新增模型管理
export function addModel(data) {
  return request({
    url: '/model/model',
    method: 'post',
    data: data
  })
}

// 修改模型管理 基础信息
export function updateModel(data) {
  return request({
    url: '/model/model',
    method: 'put',
    data: data
  })
}

// 修改模型管理 详细信息
export function updateModelDetailed(data) {
  return request({
    url: '/model/model/update',
    method: 'put',
    data: data
  })
}

// 删除模型管理
export function delModel(id) {
  return request({
    url: '/model/model/' + id,
    method: 'delete'
  })
}


// 查询模型管理 列表
// export function listOutData() {
//   return request({
//     url: '/screen/model/list',
//     method: 'get'
//   })
// }