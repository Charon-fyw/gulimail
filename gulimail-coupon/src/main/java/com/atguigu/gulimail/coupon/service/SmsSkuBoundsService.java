package com.atguigu.gulimail.coupon.service;

import com.baomidou.mybatisplus.extension.service.IService;
import com.atguigu.common.utils.PageUtils;
import com.atguigu.gulimail.coupon.entity.SmsSkuBoundsEntity;

import java.util.Map;

/**
 * 商品sku积分设置
 *
 * @author fyw
 * @email sunlightcs@gmail.com
 * @date 2023-02-17 10:53:11
 */
public interface SmsSkuBoundsService extends IService<SmsSkuBoundsEntity> {

    PageUtils queryPage(Map<String, Object> params);
}

