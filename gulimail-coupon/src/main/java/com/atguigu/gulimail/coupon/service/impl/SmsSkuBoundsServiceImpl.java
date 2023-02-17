package com.atguigu.gulimail.coupon.service.impl;

import org.springframework.stereotype.Service;
import java.util.Map;
import com.baomidou.mybatisplus.core.conditions.query.QueryWrapper;
import com.baomidou.mybatisplus.core.metadata.IPage;
import com.baomidou.mybatisplus.extension.service.impl.ServiceImpl;
import com.atguigu.common.utils.PageUtils;
import com.atguigu.common.utils.Query;

import com.atguigu.gulimail.coupon.dao.SmsSkuBoundsDao;
import com.atguigu.gulimail.coupon.entity.SmsSkuBoundsEntity;
import com.atguigu.gulimail.coupon.service.SmsSkuBoundsService;


@Service("smsSkuBoundsService")
public class SmsSkuBoundsServiceImpl extends ServiceImpl<SmsSkuBoundsDao, SmsSkuBoundsEntity> implements SmsSkuBoundsService {

    @Override
    public PageUtils queryPage(Map<String, Object> params) {
        IPage<SmsSkuBoundsEntity> page = this.page(
                new Query<SmsSkuBoundsEntity>().getPage(params),
                new QueryWrapper<SmsSkuBoundsEntity>()
        );

        return new PageUtils(page);
    }

}