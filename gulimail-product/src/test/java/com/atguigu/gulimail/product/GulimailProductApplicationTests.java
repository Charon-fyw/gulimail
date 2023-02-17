package com.atguigu.gulimail.product;

import com.atguigu.gulimail.product.entity.PmsBrandEntity;
import com.atguigu.gulimail.product.service.PmsBrandService;
import com.baomidou.mybatisplus.core.conditions.query.QueryWrapper;
import org.junit.jupiter.api.Test;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.boot.test.context.SpringBootTest;

import java.util.List;

@SpringBootTest
class GulimailProductApplicationTests {


    @Autowired
    private PmsBrandService brandService;
    @Test
    void contextLoads() {
        PmsBrandEntity pmsBrandEntity = new PmsBrandEntity();
        pmsBrandEntity.setName("demo");
        pmsBrandEntity.setLogo("adlajdkajsd");
        pmsBrandEntity.setSort(2);
        pmsBrandEntity.setDescript("测试");
        pmsBrandEntity.setFirstLetter("a");
        pmsBrandEntity.setShowStatus(0);
        boolean save = brandService.save(pmsBrandEntity);
        if (save)
            System.out.printf("插入成功");
    }

    @Test
    public void updateTest(){
//
//        PmsBrandEntity entity = new PmsBrandEntity();
//        entity.setBrandId(1L);
//        entity.setName("huawei");
//        brandService.updateById(entity);

        List<PmsBrandEntity> list =
                brandService.list(new QueryWrapper<PmsBrandEntity>().eq("brand_id", 1L));
        list.forEach((item) ->{
            System.out.println(item);
        });
    }


}
