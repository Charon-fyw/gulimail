package com.atguigu.gulimail.coupon.dao;

import com.atguigu.gulimail.coupon.entity.SmsSeckillSessionEntity;
import com.baomidou.mybatisplus.core.mapper.BaseMapper;
import org.apache.ibatis.annotations.Mapper;

/**
 * 秒杀活动场次
 * 
 * @author fyw
 * @email sunlightcs@gmail.com
 * @date 2023-02-17 10:53:11
 */
@Mapper
public interface SmsSeckillSessionDao extends BaseMapper<SmsSeckillSessionEntity> {
	
}
