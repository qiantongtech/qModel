import request from '@/utils/request'

// 查询模型输入管理 列表
export function listInput(query) {
  return request({
    url: '/model/input/list',
    method: 'get',
    params: query
  })
}

// 查询模型输入管理 详细
export function getInput(id) {
  return request({
    url: '/model/input/' + id,
    method: 'get'
  })
}

// 新增模型输入管理
export function addInput(data) {
  return request({
    url: '/model/input',
    method: 'post',
    data: data
  })
}

// 修改模型输入管理
export function updateInput(data) {
  return request({
    url: '/model/input',
    method: 'put',
    data: data
  })
}

// 删除模型输入管理
export function delInput(id) {
  return request({
    url: '/model/input/' + id,
    method: 'delete'
  })
}

// 所有模型
export function findAllModel(data) {
  return request({
    url: '/model/input/findAllModel',
    method: 'post',
    data: data
  })
}

// 所有模型版本
export function findAllModelVersion(data) {
  return request({
    url: '/model/input/findAllModelVersion',
    method: 'post',
    data: data
  })
}

// 查询模型Dat文件的数据 json
export function getAllDatFileJson() {
  return request({
    url: '/model/input/getAllDatFileJson',
    method: 'get',
  })
}

// 查询模型input文件的数据 json
export function getAllInputJson() {
  return request({
    url: '/model/input/getAllInputJson',
    method: 'get',
  })
}
