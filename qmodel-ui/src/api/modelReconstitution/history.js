import request from '@/utils/request'

// 查询操作历史列表
export function historyList(query) {
  return request({
    url: '/modelReconstitution/history/list/',
    method: 'get',
    params: query
  })
}

// 查询操作历史列表
export function listHistory(query) {
  return request({
    url: '/modelReconstitution/history/modelList/',
    method: 'get',
    params: query
  })
}

// 查询操作历史详细
export function getHistory(id) {
  return request({
    url: '/modelReconstitution/history/' + id,
    method: 'get'
  })
}

// 新增操作历史
export function addHistory(data) {
  return request({
    url: '/modelReconstitution/history',
    method: 'post',
    data: data
  })
}

// 修改操作历史
export function updateHistory(data) {
  return request({
    url: '/modelReconstitution/history',
    method: 'put',
    data: data
  })
}

// 删除操作历史
export function delHistory(id) {
  return request({
    url: '/modelReconstitution/history/' + id,
    method: 'delete'
  })
}
