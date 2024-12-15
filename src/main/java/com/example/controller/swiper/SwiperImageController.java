package com.example.controller.swiper;

import com.example.service.SwiperImageService;
import com.example.utils.Result;
import jakarta.annotation.Resource;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

/**
 * 轮播图相关
 */
@RestController
@RequestMapping("/swiper")
public class SwiperImageController {

    @Resource
    private SwiperImageService swiperImageService;

    /**
     * 获取轮播图
     * @return 返回轮播图
     */
    @GetMapping("getSwiperList")
    public Result<?> getSwiperList() {
        return swiperImageService.getSwiperList();
    }
}
