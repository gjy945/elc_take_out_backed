package com.example.service.impl;

import com.baomidou.mybatisplus.core.conditions.query.LambdaQueryWrapper;
import com.baomidou.mybatisplus.extension.service.impl.ServiceImpl;
import com.example.pojo.RestaurantSwiperImage;
import com.example.service.RestaurantSwiperImageService;
import com.example.mapper.RestaurantSwiperImageMapper;
import com.example.utils.Result;
import jakarta.annotation.Resource;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import java.util.List;

/**
* @author 郭继业
* @description 针对表【restaurant_swiper_image(存储每一个商家的轮播图表信息的表，用于网站或应用首页的动态展示)】的数据库操作Service实现
* @createDate 2024-06-11 22:47:05
*/
@Service
@Transactional
public class RestaurantSwiperImageServiceImpl extends ServiceImpl<RestaurantSwiperImageMapper, RestaurantSwiperImage>
    implements RestaurantSwiperImageService{

    @Resource
    private RestaurantSwiperImageMapper restaurantSwiperImageMapper;

    @Override
    public Result<?> getSwiperList(Integer restaurantId) {
        LambdaQueryWrapper<RestaurantSwiperImage> queryWrapper = new LambdaQueryWrapper<>();
        queryWrapper.eq(RestaurantSwiperImage::getRestaurantId,restaurantId);
        List<RestaurantSwiperImage> restaurantSwiperImages = restaurantSwiperImageMapper.selectList(queryWrapper);
        if (restaurantSwiperImages.isEmpty()){
            return Result.build(null,  400,"该商家还没有添加轮播图~");
        }
        return Result.ok(restaurantSwiperImages);
    }
}




