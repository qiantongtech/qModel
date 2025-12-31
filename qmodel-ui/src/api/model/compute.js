import request from '@/utils/request'

export function listCompute(query) {
  return request({
    url: '/model/compute/list',
    method: 'get',
    params: query
  })
}

export function getInboundFlow(data) {
  return request({
    url: 'model/compute/getInboundFlow',
    method: 'post',
    data: data
  })
}

// 查询模型计算管理 详细
export function getCompute(id) {
  return request({
    url: '/model/compute/' + id,
    method: 'get'
  })
}

// 新增模型计算管理
export function addCompute(data) {
  return request({
    url: '/model/compute',
    method: 'post',
    data: data
  })
}

// 修改模型计算管理
export function updateCompute(data) {
  return request({
    url: '/model/compute',
    method: 'put',
    data: data
  })
}

// 删除模型计算管理
export function delCompute(id) {
  return request({
    url: '/model/compute/' + id,
    method: 'delete'
  })
}
