# choerodon-front

Choerodon uses micro front-end as a front-end, which provides a uniform entrance for the convenience of running all the modules. The project is an overall front-end project that combines Choerodon IAM and Choerodon DevOps.

## Modules

* [@choerodon/boot](https://github.com/choerodon/choerodon-front-boot) - 是 Choerodon 前端的包管理、启动、编译的工具包。它主要用于提供自定义的一些配置文件，以创建一个可以在某种程度上修改的 React 项目。
* [@choerodon/master](https://github.com/choerodon/choerodon-front-master) - 内置 Choerodon 前端的 React 页面框架布局。
* [@choerodon/iam](https://github.com/choerodon/iam-service) - IAM 是 Choerodon 的核心前端服务之一。该服务主要负责 Choerodon 平台中的基础功能，包括用户，角色，权限，组织，项目，密码策略，客户端，菜单，并支持通过ldap导入第三方用户。
* [@choerodon/asgard](https://github.com/choerodon/asgard-service) - Asgard 用于提供 Choerodon 的分布式定时任务及事务管理的前端交互支持。
* [@choerodon/notify](https://github.com/choerodon/notify-service) - 通知服务用于提供 Choerodon 平台的消息中心及个人通知的前端交互支持。
* [@choerodon/manager](https://github.com/choerodon/manager-service) - 管理服务用于提供 Choerodon 自身的微服务管理的前端交互支持。
* [@choerodon/devops](https://github.com/choerodon/devops-service) - Devops 是 Choerodon 的核心前端服务之一。该服务负责持续交付模块相关功能的前端交互，其中包括应用管理、开发流水线与部署流水线；并通过丰富的界面使这些模块的功能更加直观易懂，便于操作。
* [@choerodon/agile](https://github.com/choerodon/agile-service) - Agile 是 Choerodon 的核心前端服务之一。该服务负责敏捷管理模块相关功能的前端交互，提供了待办事项、敏捷看板、故事地图等敏捷管理所必须的功能页面，并支持拖动对问题进行快速管理。提供多维度的数据报表帮助团队分析问题。
* [@choerodon/testmanager](https://github.com/choerodon/test-manager-service) - TestManager 是 Choerodon 的核心前端服务之一。该服务负责测试管理模块相关功能的前端交互，其中包括测试用例、测试执行及自动化测试等功能。并提供多维度的数据报表帮助团队分析测试过程中的问题。
* [@choerodon/knowledge](https://github.com/choerodon/knowledge-service) - 该服务负责知识管理模块相关功能的前端交互，支持markdown和所见即所得两种编辑模式，并提供多种快捷操作及扩展插件，帮助用户更加方便的进行知识管理。
* [@choerodon/issue](https://github.com/choerodon/issue-service) - 该服务负责问题管理模块相关功能的前端交互，主要负责对问题类型、状态、优先级的维护。并提供了可视化的状态机管理页面，允许用户更加方便的管理状态机流程。
* [@choerodon/wiki](https://github.com/choerodon/wiki-service) - 该服务负责wiki管理模块相关功能的前端交互，主要负责对wiki空间的同步与管理。

## To get the code

``` bash
git clone https://github.com/choerodon/choerodon-front.git
```

## Start

``` bash
cd choerodon-front
npm install
npm start
```

## Dist

``` bash
cd choerodon-front
npm dist
```

## Reporting Issues
If you find any shortcomings or bugs, please describe them in the [issue](https://github.com/choerodon/choerodon/issues/new?template=issue_template.md).

## How to Contribute
Pull requests are welcome! [Follow](https://github.com/choerodon/choerodon/blob/master/CONTRIBUTING.md) to know for more information on how to contribute.