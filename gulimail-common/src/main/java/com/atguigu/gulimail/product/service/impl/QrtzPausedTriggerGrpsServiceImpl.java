package com.atguigu.gulimail.product.service.impl;

import org.springframework.stereotype.Service;
import java.util.Map;
import com.baomidou.mybatisplus.core.conditions.query.QueryWrapper;
import com.baomidou.mybatisplus.core.metadata.IPage;
import com.baomidou.mybatisplus.extension.service.impl.ServiceImpl;
import com.atguigu.common.utils.PageUtils;
import com.atguigu.common.utils.Query;

import com.atguigu.gulimail.product.dao.QrtzPausedTriggerGrpsDao;
import com.atguigu.gulimail.product.entity.QrtzPausedTriggerGrpsEntity;
import com.atguigu.gulimail.product.service.QrtzPausedTriggerGrpsService;


@Service("qrtzPausedTriggerGrpsService")
public class QrtzPausedTriggerGrpsServiceImpl extends ServiceImpl<QrtzPausedTriggerGrpsDao, QrtzPausedTriggerGrpsEntity> implements QrtzPausedTriggerGrpsService {

    @Override
    public PageUtils queryPage(Map<String, Object> params) {
        IPage<QrtzPausedTriggerGrpsEntity> page = this.page(
                new Query<QrtzPausedTriggerGrpsEntity>().getPage(params),
                new QueryWrapper<QrtzPausedTriggerGrpsEntity>()
        );

        return new PageUtils(page);
    }

}