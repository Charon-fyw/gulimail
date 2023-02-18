package com.atguigu.gulimail.member.feign;

import com.atguigu.common.utils.R;
import org.springframework.cloud.openfeign.FeignClient;
import org.springframework.web.bind.annotation.RequestMapping;

// 告诉系统这是一个远程调用接口
@FeignClient("gulimail-coupon")
public interface CouponFeignService {

    @RequestMapping("/coupon/smscategorybounds/merber/list")
    public R queryMemCoupons();
}
