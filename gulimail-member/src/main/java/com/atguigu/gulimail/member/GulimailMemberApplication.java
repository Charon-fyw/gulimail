package com.atguigu.gulimail.member;

import org.springframework.boot.SpringApplication;
import org.springframework.boot.autoconfigure.SpringBootApplication;
import org.springframework.cloud.client.discovery.EnableDiscoveryClient;
import org.springframework.cloud.context.config.annotation.RefreshScope;
import org.springframework.cloud.openfeign.EnableFeignClients;

/**
 * 1. 想要远程调用别的服务
 * 1.1 引入open-feign
 * 1.2 编写一个接口， 告诉springcloud这个接口需要调用远程服务
 *       在接口中声明的每一个方法都是调用远程服务的请求
 * 1.3 开启远程调用功能
 *
 * 2. 如何使用nacos作为配置中心统一管理配置
 * 2.1 引入依赖
 * 2.2 创建bootstrap，properties
 *       spring.application.name=gulimail-member
 *       spring.cloud.nacos.config.server-addr=127.0.0.1:8848
 *       spring.config.import[0]=nacos:nacos-config.properties
 *
 * 2.3 需要给配置中心默认添加当前应用名。properties数据集,默认规则是应用名.properties
 * 2.4 给应用名。properties添加任何配置
 * 2.5 动态获取配置
 *     @RefreshScope 动态获取并刷新配置
 *     @Value spring获取配置文件值
 *     如果配置中心和当前应用配置文件中， 都配置了相同的项， 那么优先使用配置中心的配置
 *
 * 细节：
 * 1. 命名空间： 配置隔离
 *      默认： public（保留空间） 默认新增的所有配置都在public空间
 *      1.1 开发 测试， 生产 利用命名空间来做环境隔离
 *          注意： 需要在bootstrap.properties配置上需要使用哪个命名空间下的配置
 *          spring.cloud.nacos.config.namespace=5f85694b-c524-480e-9e98-07cb0511051a
 *      1.2 每一个微服务都创建自己的命名空间， 这样只加载自己命名空间下的配置
 * 2. 配置集
 * 3. 配置集id
 *  Data Id: 类似文件名
 *
 * 4. 配置分组
 *  默认所有的配置集都属于: Default_Group;
 *
 *  每个微服务创建自己的命名空间, 使用配置分组区分环境, dev, test, prod
 *
 */
@SpringBootApplication
@EnableDiscoveryClient
@EnableFeignClients(basePackages = "com.atguigu.gulimail.member.feign")
public class GulimailMemberApplication {

    public static void main(String[] args) {
        SpringApplication.run(GulimailMemberApplication.class, args);
    }

}
