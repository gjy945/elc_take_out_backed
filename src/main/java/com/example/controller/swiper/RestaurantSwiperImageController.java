package com.example.controller.swiper;

import com.example.service.RestaurantSwiperImageService;
import com.example.utils.Result;
import jakarta.annotation.Resource;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.RestController;

/**
 * 商家轮播图
 */
@RestController
@RequestMapping("/restaurantSwiper")
public class RestaurantSwiperImageController {
    @Resource
    private RestaurantSwiperImageService restaurantSwiperImageService;

    /**
     * 根据商家id获取轮播图
     * @param restaurantId 商家id
     * @return 结果
     */
    @PostMapping("getSwiperList")
    public Result<?> getSwiperList(@RequestParam Integer restaurantId){
        return restaurantSwiperImageService.getSwiperList(restaurantId);
    }
}
