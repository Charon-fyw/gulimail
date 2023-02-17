package com.atguigu.gulimail.coupon.dao;

import com.atguigu.gulimail.coupon.entity.SmsCouponSpuRelationEntity;
import com.baomidou.mybatisplus.core.mapper.BaseMapper;
import org.apache.ibatis.annotations.Mapper;

/**
 * 优惠券与产品关联
 * 
 * @author fyw
 * @email sunlightcs@gmail.com
 * @date 2023-02-17 11:07:53
 */
@Mapper
public interface SmsCouponSpuRelationDao extends BaseMapper<SmsCouponSpuRelationEntity> {
	
}
