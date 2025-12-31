import request from '@/utils/request'

// 查询学生列表
export function listGenStudent(query) {
  return request({
    url: '/example/genStudent/list',
    method: 'get',
    params: query
  })
}

// 查询学生详细
export function getGenStudent(id) {
  return request({
    url: '/example/genStudent/' + id,
    method: 'get'
  })
}

// 新增学生
export function addGenStudent(data) {
  return request({
    url: '/example/genStudent',
    method: 'post',
    data: data
  })
}

// 修改学生
export function updateGenStudent(data) {
  return request({
    url: '/example/genStudent',
    method: 'put',
    data: data
  })
}

// 删除学生
export function delGenStudent(id) {
  return request({
    url: '/example/genStudent/' + id,
    method: 'delete'
  })
}
