package com.atguigu.gulimail.order.dao;

import com.atguigu.gulimail.order.entity.OmsOrderItemEntity;
import com.baomidou.mybatisplus.core.mapper.BaseMapper;
import org.apache.ibatis.annotations.Mapper;

/**
 * 订单项信息
 * 
 * @author fyw
 * @email sunlightcs@gmail.com
 * @date 2023-02-17 11:24:37
 */
@Mapper
public interface OmsOrderItemDao extends BaseMapper<OmsOrderItemEntity> {
	
}
