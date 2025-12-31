import request from '@/utils/request'

// 查询版本管理列表
export function listVersion(query) {
  return request({
    url: '/modelReconstitution/version/list',
    method: 'get',
    params: query
  })
}

// 查询版本管理详细
export function getVersion(id) {
  return request({
    url: '/modelReconstitution/version/' + id,
    method: 'get'
  })
}

// 查询一个模型全部版本记录
export function getMVList(modelId) {
  return request({
    url: '/modelReconstitution/version/MVList/' + modelId,
    method: 'get'
  })
}

// 展示一个模型全部版本记录
export function getVersionList(query) {
  return request({
    url: '/modelReconstitution/version/VersionList/',
    method: 'get',
    params: query
  })
}

// 版本的切换
export function handoffVersion(data) {
  return request({
    url: '/modelReconstitution/version/handoff',
    method: 'put',
    data: data
  })
}

// 新增版本管理
export function addVersion(data) {
  return request({
    url: '/modelReconstitution/version',
    method: 'post',
    data: data
  })
}

// 修改版本管理
export function updateVersion(data) {
  return request({
    url: '/modelReconstitution/version',
    method: 'put',
    data: data
  })
}

// 删除版本管理
export function delVersion(id) {
  return request({
    url: '/modelReconstitution/version/' + id,
    method: 'delete'
  })
}
