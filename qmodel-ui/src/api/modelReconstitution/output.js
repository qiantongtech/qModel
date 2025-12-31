import request from '@/utils/request'

// 查询 模型输出管理列表
export function listOutput(query) {
  return request({
    url: '/modelReconstitution/output/list',
    method: 'get',
    params: query
  })
}

// 查询 模型输出管理详细
export function getOutput(id) {
  return request({
    url: '/modelReconstitution/output/' + id,
    method: 'get'
  })
}

// 新增 模型输出管理
export function addOutput(data) {
  return request({
    url: '/modelReconstitution/output',
    method: 'post',
    data: data
  })
}

// 修改 模型输出管理
export function updateOutput(data) {
  return request({
    url: '/modelReconstitution/output',
    method: 'put',
    data: data
  })
}

// 删除 模型输出管理
export function delOutput(id) {
  return request({
    url: '/modelReconstitution/output/' + id,
    method: 'delete'
  })
}

export function findAllModel(data) {
  return request({
    url: '/modelReconstitution/output/findAllModel',
    method: 'post',
    data: data
  })
}

// 所有模型版本
export function findAllModelVersion(data) {
  return request({
    url: '/modelReconstitution/output/findAllModelVersion',
    method: 'post',
    data: data
  })
}

// 文件模型数据
export function waterSurfaceProfileAndQzhb(modelId) {
  return request({
    url: '/modelReconstitution/output/waterSurfaceProfileAndQzhb/' + modelId,
    method: 'get',
  })
}

// 文件模型数据数据合并起来的
export function waterSurfaceProfileAndQzhbMerge() {
  return request({
    url: '/modelReconstitution/output/waterSurfaceProfileAndQzhbMerge',
    method: 'post',
  })
}
