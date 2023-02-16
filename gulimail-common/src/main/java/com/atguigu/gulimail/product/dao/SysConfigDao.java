package com.atguigu.gulimail.product.dao;

import com.atguigu.gulimail.product.entity.SysConfigEntity;
import com.baomidou.mybatisplus.core.mapper.BaseMapper;
import org.apache.ibatis.annotations.Mapper;

/**
 * 系统配置信息表
 * 
 * @author fyw
 * @email sunlightcs@gmail.com
 * @date 2023-02-16 23:55:41
 */
@Mapper
public interface SysConfigDao extends BaseMapper<SysConfigEntity> {
	
}
