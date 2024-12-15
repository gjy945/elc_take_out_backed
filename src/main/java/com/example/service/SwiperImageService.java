package com.example.service;

import com.example.pojo.SwiperImage;
import com.baomidou.mybatisplus.extension.service.IService;
import com.example.utils.Result;

/**
* @author 郭继业
* @description 针对表【swiper_image(存储轮播图表信息的表，用于网站或应用首页的动态展示)】的数据库操作Service
* @createDate 2024-05-31 23:49:32
*/
public interface SwiperImageService extends IService<SwiperImage> {

    /**
     * 获取轮播图列表
     * @return 返回结果
     */
    Result<?> getSwiperList();
}
