package com.atguigu.gulimail.product;

import org.springframework.boot.SpringApplication;
import org.springframework.boot.autoconfigure.SpringBootApplication;

/**
 * 整合mybatis-plus
 * 1） 导入依赖
 *   <dependency>
 *             <groupId>com.baomidou</groupId>
 *             <artifactId>mybatis-plus-boot-starter</artifactId>
 *             <version>3.3.1</version>
 *   </dependency>
 *
 * 2） 配置
 *    2.1 数据源
 *      2.1.1 数据库驱动 mysql驱动
 *      2.1.2 在application.yaml配置数据源相关信息
 *    2.2 配置Mybatis-Plus
 *      2.2.1 使用@MapperScan
 *      2.2.2 告诉mybatis-plus  sql映射文件在哪里
 *
 *
 *
 */
@SpringBootApplication
public class GulimailProductApplication {

    public static void main(String[] args) {
        SpringApplication.run(GulimailProductApplication.class, args);
    }

}
