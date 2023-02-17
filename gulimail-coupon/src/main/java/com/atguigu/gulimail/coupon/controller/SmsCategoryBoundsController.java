package com.atguigu.gulimail.coupon.controller;

import java.util.Arrays;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.RestController;

import com.atguigu.gulimail.coupon.entity.SmsCategoryBoundsEntity;
import com.atguigu.gulimail.coupon.service.SmsCategoryBoundsService;
import com.atguigu.common.utils.PageUtils;
import com.atguigu.common.utils.R;



/**
 * 商品分类积分设置
 *
 * @author fyw
 * @email sunlightcs@gmail.com
 * @date 2023-02-17 11:07:53
 */
@RestController
@RequestMapping("coupon/smscategorybounds")
public class SmsCategoryBoundsController {
    @Autowired
    private SmsCategoryBoundsService smsCategoryBoundsService;

    /**
     * 列表
     */
    @RequestMapping("/list")
    // @RequiresPermissions("coupon:smscategorybounds:list")
    public R list(@RequestParam Map<String, Object> params){
        PageUtils page = smsCategoryBoundsService.queryPage(params);

        return R.ok().put("page", page);
    }


    /**
     * 信息
     */
    @RequestMapping("/info/{id}")
    // @RequiresPermissions("coupon:smscategorybounds:info")
    public R info(@PathVariable("id") Long id){
		SmsCategoryBoundsEntity smsCategoryBounds = smsCategoryBoundsService.getById(id);

        return R.ok().put("smsCategoryBounds", smsCategoryBounds);
    }

    /**
     * 保存
     */
    @RequestMapping("/save")
    // @RequiresPermissions("coupon:smscategorybounds:save")
    public R save(@RequestBody SmsCategoryBoundsEntity smsCategoryBounds){
		smsCategoryBoundsService.save(smsCategoryBounds);

        return R.ok();
    }

    /**
     * 修改
     */
    @RequestMapping("/update")
    // @RequiresPermissions("coupon:smscategorybounds:update")
    public R update(@RequestBody SmsCategoryBoundsEntity smsCategoryBounds){
		smsCategoryBoundsService.updateById(smsCategoryBounds);

        return R.ok();
    }

    /**
     * 删除
     */
    @RequestMapping("/delete")
    // @RequiresPermissions("coupon:smscategorybounds:delete")
    public R delete(@RequestBody Long[] ids){
		smsCategoryBoundsService.removeByIds(Arrays.asList(ids));

        return R.ok();
    }

}
