package com.atguigu.gulimail.coupon.dao;

import com.atguigu.gulimail.coupon.entity.SmsCouponEntity;
import com.baomidou.mybatisplus.core.mapper.BaseMapper;
import org.apache.ibatis.annotations.Mapper;

/**
 * 优惠券信息
 * 
 * @author fyw
 * @email sunlightcs@gmail.com
 * @date 2023-02-17 10:53:12
 */
@Mapper
public interface SmsCouponDao extends BaseMapper<SmsCouponEntity> {
	
}
