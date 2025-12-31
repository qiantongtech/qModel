import request from '@/utils/request'

// 查询模型历史管理 列表
export function listOperate(query) {
  return request({
    url: '/model/operate/list',
    method: 'get',
    params: query
  })
}

// 查询模型历史管理 详细
export function getOperate(id) {
  return request({
    url: '/model/operate/' + id,
    method: 'get'
  })
}

// 新增模型历史管理 
export function addOperate(data) {
  return request({
    url: '/model/operate',
    method: 'post',
    data: data
  })
}

// 修改模型历史管理 
export function updateOperate(data) {
  return request({
    url: '/model/operate',
    method: 'put',
    data: data
  })
}

// 删除模型历史管理 
export function delOperate(id) {
  return request({
    url: '/model/operate/' + id,
    method: 'delete'
  })
}
