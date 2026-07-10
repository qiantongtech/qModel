DROP TABLE IF EXISTS model_file_resource;
CREATE TABLE model_file_resource
(
    `id`                 BIGINT AUTO_INCREMENT COMMENT 'ID',
    `model_id`           BIGINT COMMENT '模型id',
    `file_name`          VARCHAR(32) COMMENT '原始上传文件名',
    `script_name`        VARCHAR(32) COMMENT '脚本名称(入口文件)',
    `file_path`          VARCHAR(256) COMMENT '文件存储地址',
    `deps_file_path`     VARCHAR(256) COMMENT '依赖文件路径',
    `model_version`      INT COMMENT '模型版本号',
    `resource_type`      TINYINT(4) UNSIGNED   COMMENT '资源类型：1=模型文件(onnx/pth/safetensors)，2=Python算法脚本(.py)',
    `file_size`          DECIMAL COMMENT '文件大小MB',
    `log_file_path`      VARCHAR(256) COMMENT '运行日志文件路径',
    `exec_timeout`       INT COMMENT '请求超时秒数',
    `docker_file_path`   VARCHAR(256) COMMENT '自动生成dockerFile文件地址',
    `image_tag`          VARCHAR(256) COMMENT '构建镜像标签',
    `image_version`      VARCHAR(32) COMMENT '镜像版本',
    `image_build_status` TINYINT(4) UNSIGNED  DEFAULT 0 COMMENT '镜像构建状态（0 = 未构建、1 = 构建中、2 = 构建成功、3 = 构建失败）',
    `image_build_time`   INT COMMENT '镜像构建时间',
    `image_build_log`    VARCHAR(256) COMMENT '镜像构建日志文件地址',
    `resource_limit`     VARCHAR(3072) COMMENT '容器硬件资源配额JSON，gpu_num/gpu_mem_gb/cpu_core/mem_gb',
    `container_env`      VARCHAR(3072) COMMENT '容器自定义环境变量，JSON数组格式',
    `container_mounts`   VARCHAR(3072) COMMENT '容器额外挂载目录配置，JSON数组格式',
    `container_ports`    INT COMMENT '容器暴露端口',
    `mapped_host_port`   INT COMMENT '宿主机端口',
    `container_status`   TINYINT(4) UNSIGNED  DEFAULT 0 COMMENT '容器运行状态(容器运行状态：0=待启动，1=运行中，2=运行成功，3=运行失败，4=手动停止，5=已销毁)',
    `container_id`       VARCHAR(128) COMMENT '容器id',
    `valid_flag`         TINYINT(1) NOT NULL DEFAULT 1 COMMENT '是否有效;0：无效，1：有效',
    `del_flag`           TINYINT(1) NOT NULL DEFAULT 0 COMMENT '删除标志;1：已删除，0：未删除',
    `create_by`          VARCHAR(32) COMMENT '创建人',
    `creator_id`         BIGINT COMMENT '创建人id',
    `create_time`        DATETIME NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
    `update_by`          VARCHAR(32) COMMENT '更新人',
    `updator_id`         BIGINT COMMENT '更新人id',
    `update_time`        DATETIME NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '更新时间',
    `remark`             VARCHAR(512) COMMENT '备注',
    PRIMARY KEY (id)
) COMMENT = '模型文件部署表';


ALTER TABLE QMODEL_DEV."MODEL" ADD CODE VARCHAR2(128);

COMMENT ON COLUMN QMODEL_DEV."MODEL".CODE IS '编码';


ALTER TABLE QMODEL_DEV."MODEL" ADD ACCESS_TYPE INTEGER;

COMMENT ON COLUMN QMODEL_DEV."MODEL".ACCESS_TYPE IS '编码';


ALTER TABLE QMODEL_DEV."MODEL" ADD STATUS INTEGER;

COMMENT ON COLUMN QMODEL_DEV."MODEL".STATUS IS '状态: 0-停用, 1-启用';


ALTER TABLE QMODEL_DEV."MODEL" ADD AUTHOR VARCHAR2(128);

COMMENT ON COLUMN QMODEL_DEV."MODEL".AUTHOR IS '作者';


