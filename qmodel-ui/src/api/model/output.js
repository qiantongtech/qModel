import request from '@/utils/request'

// 查询 模型输出管理列表
export function listOutput(query) {
  return request({
    url: '/model/output/list',
    method: 'get',
    params: query
  })
}

// 查询 模型输出管理详细
export function getOutput(id) {
  return request({
    url: '/model/output/' + id,
    method: 'get'
  })
}

// 新增 模型输出管理
export function addOutput(data) {
  return request({
    url: '/model/output',
    method: 'post',
    data: data
  })
}

// 修改 模型输出管理
export function updateOutput(data) {
  return request({
    url: '/model/output',
    method: 'put',
    data: data
  })
}

// 删除 模型输出管理
export function delOutput(id) {
  return request({
    url: '/model/output/' + id,
    method: 'delete'
  })
}

export function findAllModel(data) {
  return request({
    url: '/model/output/findAllModel',
    method: 'post',
    data: data
  })
}

// 所有模型版本
export function findAllModelVersion(data) {
  return request({
    url: '/model/output/findAllModelVersion',
    method: 'post',
    data: data
  })
}

// 文件模型数据
export function waterSurfaceProfileAndQzhb() {
  return request({
    url: '/model/output/waterSurfaceProfileAndQzhb',
    method: 'post',
  })
}

// 文件模型数据数据合并起来的
export function waterSurfaceProfileAndQzhbMerge() {
  return request({
    url: '/model/output/waterSurfaceProfileAndQzhbMerge',
    method: 'post',
  })
}
