package com.atguigu.gulimail.order.dao;

import com.atguigu.gulimail.order.entity.OmsPaymentInfoEntity;
import com.baomidou.mybatisplus.core.mapper.BaseMapper;
import org.apache.ibatis.annotations.Mapper;

/**
 * 支付信息表
 * 
 * @author fyw
 * @email sunlightcs@gmail.com
 * @date 2023-02-17 11:24:37
 */
@Mapper
public interface OmsPaymentInfoDao extends BaseMapper<OmsPaymentInfoEntity> {
	
}
