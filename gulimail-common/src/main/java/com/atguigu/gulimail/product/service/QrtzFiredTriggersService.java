package com.atguigu.gulimail.product.service;

import com.baomidou.mybatisplus.extension.service.IService;
import com.atguigu.common.utils.PageUtils;
import com.atguigu.gulimail.product.entity.QrtzFiredTriggersEntity;

import java.util.Map;

/**
 * 
 *
 * @author fyw
 * @email sunlightcs@gmail.com
 * @date 2023-02-16 23:55:40
 */
public interface QrtzFiredTriggersService extends IService<QrtzFiredTriggersEntity> {

    PageUtils queryPage(Map<String, Object> params);
}
