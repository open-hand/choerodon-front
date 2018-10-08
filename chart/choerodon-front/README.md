部署文件的渲染模板，我们下文将定义一些变量，helm执行时会将变量渲染进模板文件中。

## _helpers.tpl

这个文件我们用来进行标签模板的定义，以便在上文提到的位置进行标签渲染。

此项目标签总共分为两个部分: 平台、日志。

### 平台标签

#### deployment 级:

```
{{- define "service.labels.standard" -}}
choerodon.io/release: {{ .Release.Name | quote }}
{{- end -}}
```
平台管理实例需要的实例ID。


### 日志标签

#### deployment 级:

```
{{- define "service.logging.deployment.label" -}}
choerodon.io/logs-parser: {{ .Values.logs.parser | quote }}
{{- end -}}
```
日志管理所需要的应用标签。该标签指定应用程序的日志格式，内置格式有`nginx`,`spring-boot`,`docker`对于前端服务请使用`nginx`，如果不需要收集日志请移除此段代码，并删除模板文件关于`service.logging.deployment.label`的引用。

## values.yaml

这个文件中的键值对，即为我们上文中所引用的变量。

将所以有变量集中在一个文件中，方便部署的时候进行归档以及灵活替换。

同时，helm命令支持使用 `--set FOO_BAR=FOOBAR` 参数对values 文件中的变量进行赋值，可以进一步简化部署流程。


## 参数对照表

参数名 | 含义 
--- | --- 
service.enable | 是否创建service
ingress.enable | 是否创建ingress
persistence.enabled | 是否启用持久化存储
persistence.existingClaim | 绑定的pvc名称
preJob.preConfig.db | 初始化菜单数据库信息
preJob.preConfig.db.type | 初始化菜单数据库类型。mysql/oracle
preJob.preConfig.db.enabledelete | 是否删除旧版本中的冗余菜单，需要对应Menu.yml中有所修改。true/false
preJob.preConfig.db.upattrs | 是否严格按照Menu.yml 更新菜单的顺序和层级，选填，可以包含`sort,parent_id`
env.open.PRO_API_HOST | api地址
env.open.PRO_CLIENT_ID | client id
env.open.PRO_LOCAL | 是否本地开发 false
env.open.PRO_TITLE_NAME | 页面显示标题
env.open.PRO_HEADER_TITLE_NAME | 页面header标题
env.open.PRO_DEVOPS_HOST | devops service地址
env.open.PRO_FILE_SERVER | 文件上传服务地址
env.open.PRO_AGILE_HOST | 敏捷文件地址
env.open.PRO_HTTP | 使用协议 http
env.open.PRO_WEBSOCKET_SERVER | websocket 地址