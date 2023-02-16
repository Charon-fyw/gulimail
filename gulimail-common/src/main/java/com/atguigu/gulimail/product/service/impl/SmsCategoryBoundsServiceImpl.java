package com.atguigu.gulimail.product.service.impl;

import org.springframework.stereotype.Service;
import java.util.Map;
import com.baomidou.mybatisplus.core.conditions.query.QueryWrapper;
import com.baomidou.mybatisplus.core.metadata.IPage;
import com.baomidou.mybatisplus.extension.service.impl.ServiceImpl;
import com.atguigu.common.utils.PageUtils;
import com.atguigu.common.utils.Query;

import com.atguigu.gulimail.product.dao.SmsCategoryBoundsDao;
import com.atguigu.gulimail.product.entity.SmsCategoryBoundsEntity;
import com.atguigu.gulimail.product.service.SmsCategoryBoundsService;


@Service("smsCategoryBoundsService")
public class SmsCategoryBoundsServiceImpl extends ServiceImpl<SmsCategoryBoundsDao, SmsCategoryBoundsEntity> implements SmsCategoryBoundsService {

    @Override
    public PageUtils queryPage(Map<String, Object> params) {
        IPage<SmsCategoryBoundsEntity> page = this.page(
                new Query<SmsCategoryBoundsEntity>().getPage(params),
                new QueryWrapper<SmsCategoryBoundsEntity>()
        );

        return new PageUtils(page);
    }

}