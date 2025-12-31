import request from '@/utils/request'

// 查询模型分类列表
export function listClassify(query) {
  return request({
    url: '/modelReconstitution/classify/list',
    method: 'get',
    params: query
  })
}

// 查询模型分类详细
export function getClassify(id) {
  return request({
    url: '/modelReconstitution/classify/' + id,
    method: 'get'
  })
}

// 新增模型分类
export function addClassify(data) {
  return request({
    url: '/modelReconstitution/classify',
    method: 'post',
    data: data
  })
}

// 修改模型分类
export function updateClassify(data) {
  return request({
    url: '/modelReconstitution/classify',
    method: 'put',
    data: data
  })
}

// 删除模型分类
export function delClassify(id) {
  return request({
    url: '/modelReconstitution/classify/' + id,
    method: 'delete'
  })
}
