package com.atguigu.gulimail.member;

import org.springframework.boot.SpringApplication;
import org.springframework.boot.autoconfigure.SpringBootApplication;
import org.springframework.cloud.client.discovery.EnableDiscoveryClient;
import org.springframework.cloud.openfeign.EnableFeignClients;

/**
 * 1. 想要远程调用别的服务
 * 1.1 引入open-feign
 * 1.2 编写一个接口， 告诉springcloud这个接口需要调用远程服务
 *       在接口中声明的每一个方法都是调用远程服务的请求
 * 1.3 开启远程调用功能
 */
@SpringBootApplication
@EnableDiscoveryClient
@EnableFeignClients(basePackages = "com.atguigu.gulimail.member.feign")
public class GulimailMemberApplication {

    public static void main(String[] args) {
        SpringApplication.run(GulimailMemberApplication.class, args);
    }

}
