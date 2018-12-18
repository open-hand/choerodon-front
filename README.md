# choerodon-front

Choerodon uses micro front-end as a front-end, which provides a uniform entrance for the convenience of running all the modules. The project is an overall front-end project that combines Choerodon IAM and Choerodon DevOps.

## Modules

There are a number of modules in Choerodon Front, here is a quick overview:

* [choerodon-front-iam](https://github.com/choerodon/choerodon-front-iam) - The project is responsible for the IAM and system configuration of the Choerodon Platform, and provides a better user experience through the rich interface.
* [choerodon-front-devops](https://github.com/choerodon/choerodon-front-devops) - The project is responsible for the continuous delivery of all homepages and provides users with a better user experience through a rich interface.
* [choerodon-front-agile](https://github.com/choerodon/choerodon-front-agile) - Agile Front is the core front service of Choerodon. The service is responsible for Agile process management and providing users with a better user experience through rich display.
* [choerodon-front-wiki](https://github.com/choerodon/choerodon-front-wiki) - This project looks at the wiki space of the organization and project, as well as features such as creating wiki space.
* [choerodon-front-test-manager](https://github.com/choerodon/choerodon-front-test-manager) - Test Manager Front is the core front service of Choerodon. The service provide users with agile continuous testing tools. Improve test flexibility and visibility. Optimize project test management methods.
* [choerodon-front-issue](https://github.com/choerodon/choerodon-front-issue) - `Issue Front` is the core front service of Choerodon. The service is responsible for Issue and stateMachine process management and providing users with a better user experience through rich display.



## To get the code

```
$ git clone https://github.com/choerodon/choerodon-front.git --recursive
```

## Initializing Oracle Database

If you are using the Oracle database, you can follow these steps

### Download The Oracle Client

Download instantclient-basic-linux.x64-12.1.0.1.0.zip from [oracle](https://www.oracle.com/technetwork/topics/linuxx86-64soft-092277.html)

### Add this paragraph in dockerfile

``` dockerfile
ENV ORACLE_BASE /usr/lib/instantclient_12_1
ENV LD_LIBRARY_PATH /usr/lib/instantclient_12_1
ENV TNS_ADMIN /usr/lib/instantclient_12_1
ENV ORACLE_HOME /usr/lib/instantclient_12_1

COPY instantclient-basic-linux.x64-12.1.0.1.0.zip ./instantclient_12_1.zip
RUN  apk add libaio libnsl && \
    unzip instantclient_12_1.zip && \
    mv instantclient_12_1/ /usr/lib/instantclient_12_1 && \
    rm instantclient_12_1.zip && \
    ln /usr/lib/instantclient_12_1/libclntsh.so.12.1 /usr/lib/libclntsh.so && \
    ln /usr/lib/instantclient_12_1/libocci.so.12.1 /usr/lib/libocci.so && \
    ln /usr/lib/instantclient_12_1/libociei.so /usr/lib/libociei.so && \
    ln /usr/lib/instantclient_12_1/libclntshcore.so.12.1 /usr/lib/libclntshcore.so && \
    ln /usr/lib/libnsl.so.2 /usr/lib/libnsl.so.1 && \
    pip install cx_Oracle==6.4.1
```

### Add values at deploy stage

``` yml
preJob:
  preConfig:
    db:
      host: 127.0.0.1
      port: 1521
      username: root
      password: choerodon
      dbname: iam_service
      type: oracle
```

## Reporting Issues
If you find any shortcomings or bugs, please describe them in the [issue](https://github.com/choerodon/choerodon/issues/new?template=issue_template.md).

## How to Contribute
Pull requests are welcome! [Follow](https://github.com/choerodon/choerodon/blob/master/CONTRIBUTING.md) to know for more information on how to contribute.