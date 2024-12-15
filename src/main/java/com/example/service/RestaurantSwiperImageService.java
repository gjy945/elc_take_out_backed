package com.example.service;

import com.example.pojo.RestaurantSwiperImage;
import com.baomidou.mybatisplus.extension.service.IService;
import com.example.utils.Result;

/**
* @author 郭继业
* @description 针对表【restaurant_swiper_image(存储每一个商家的轮播图表信息的表，用于网站或应用首页的动态展示)】的数据库操作Service
* @createDate 2024-06-11 22:47:05
*/
public interface RestaurantSwiperImageService extends IService<RestaurantSwiperImage> {

    /**
     * 根据商家id获取轮播图列表
     * @return 结果
     */
    Result<?> getSwiperList(Integer restaurantId);
}
