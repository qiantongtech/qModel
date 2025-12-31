import request from '@/utils/request'

// 查询接口地址列表
export function listInterfaceAddress(query) {
  return request({
    url: '/modelReconstitution/interfaceAddress/list',
    method: 'get',
    params: query
  })
}

// 查询接口地址详细
export function getInterfaceAddress(id) {
  return request({
    url: '/modelReconstitution/interfaceAddress/' + id,
    method: 'get'
  })
}

// 新增接口地址
export function addInterfaceAddress(data) {
  return request({
    url: '/modelReconstitution/interfaceAddress',
    method: 'post',
    data: data
  })
}

// 修改接口地址
export function updateInterfaceAddress(data) {
  return request({
    url: '/modelReconstitution/interfaceAddress',
    method: 'put',
    data: data
  })
}

// 删除接口地址
export function delInterfaceAddress(id) {
  return request({
    url: '/modelReconstitution/interfaceAddress/' + id,
    method: 'delete'
  })
}
