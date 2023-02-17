package com.atguigu.gulimail.coupon.service.impl;

import org.springframework.stereotype.Service;
import java.util.Map;
import com.baomidou.mybatisplus.core.conditions.query.QueryWrapper;
import com.baomidou.mybatisplus.core.metadata.IPage;
import com.baomidou.mybatisplus.extension.service.impl.ServiceImpl;
import com.atguigu.common.utils.PageUtils;
import com.atguigu.common.utils.Query;

import com.atguigu.gulimail.coupon.dao.SmsSeckillSkuRelationDao;
import com.atguigu.gulimail.coupon.entity.SmsSeckillSkuRelationEntity;
import com.atguigu.gulimail.coupon.service.SmsSeckillSkuRelationService;


@Service("smsSeckillSkuRelationService")
public class SmsSeckillSkuRelationServiceImpl extends ServiceImpl<SmsSeckillSkuRelationDao, SmsSeckillSkuRelationEntity> implements SmsSeckillSkuRelationService {

    @Override
    public PageUtils queryPage(Map<String, Object> params) {
        IPage<SmsSeckillSkuRelationEntity> page = this.page(
                new Query<SmsSeckillSkuRelationEntity>().getPage(params),
                new QueryWrapper<SmsSeckillSkuRelationEntity>()
        );

        return new PageUtils(page);
    }

}