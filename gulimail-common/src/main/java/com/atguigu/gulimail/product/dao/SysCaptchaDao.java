package com.atguigu.gulimail.product.dao;

import com.atguigu.gulimail.product.entity.SysCaptchaEntity;
import com.baomidou.mybatisplus.core.mapper.BaseMapper;
import org.apache.ibatis.annotations.Mapper;

/**
 * 系统验证码
 * 
 * @author fyw
 * @email sunlightcs@gmail.com
 * @date 2023-02-16 23:55:41
 */
@Mapper
public interface SysCaptchaDao extends BaseMapper<SysCaptchaEntity> {
	
}
