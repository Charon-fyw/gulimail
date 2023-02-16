package com.atguigu.gulimail.product.service;

import com.baomidou.mybatisplus.extension.service.IService;
import com.atguigu.common.utils.PageUtils;
import com.atguigu.gulimail.product.entity.PmsAttrEntity;

import java.util.Map;

/**
 * 商品属性
 *
 * @author fyw
 * @email sunlightcs@gmail.com
 * @date 2023-02-17 00:24:20
 */
public interface PmsAttrService extends IService<PmsAttrEntity> {

    PageUtils queryPage(Map<String, Object> params);
}

