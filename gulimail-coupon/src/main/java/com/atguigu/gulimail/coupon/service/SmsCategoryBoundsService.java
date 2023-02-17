package com.atguigu.gulimail.coupon.service;

import com.baomidou.mybatisplus.extension.service.IService;
import com.atguigu.common.utils.PageUtils;
import com.atguigu.gulimail.coupon.entity.SmsCategoryBoundsEntity;

import java.util.Map;

/**
 * 商品分类积分设置
 *
 * @author fyw
 * @email sunlightcs@gmail.com
 * @date 2023-02-17 11:07:53
 */
public interface SmsCategoryBoundsService extends IService<SmsCategoryBoundsEntity> {

    PageUtils queryPage(Map<String, Object> params);
}

