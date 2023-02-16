package com.atguigu.gulimail.product.service;

import com.baomidou.mybatisplus.extension.service.IService;
import com.atguigu.common.utils.PageUtils;
import com.atguigu.gulimail.product.entity.CategoryEntity;

import java.util.Map;

/**
 * 商品三级分类
 *
 * @author fyw
 * @email sunlightcs@gmail.com
 * @date 2023-02-16 23:55:43
 */
public interface CategoryService extends IService<CategoryEntity> {

    PageUtils queryPage(Map<String, Object> params);
}
