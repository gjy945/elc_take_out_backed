package com.example.service.impl;

import com.baomidou.mybatisplus.extension.service.impl.ServiceImpl;
import com.example.pojo.SwiperImage;
import com.example.service.SwiperImageService;
import com.example.mapper.SwiperImageMapper;
import com.example.utils.Result;
import com.example.utils.ResultCodeEnum;
import jakarta.annotation.Resource;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

/**
 * @author 郭继业
 * @description 针对表【swiper_image(存储轮播图表信息的表，用于网站或应用首页的动态展示)】的数据库操作Service实现
 * @createDate 2024-05-31 23:49:32
 */
@Service
@Transactional
public class SwiperImageServiceImpl extends ServiceImpl<SwiperImageMapper, SwiperImage>
        implements SwiperImageService {

    @Resource
    private SwiperImageMapper swiperImageMapper;

    @Override
    public Result<?> getSwiperList() {
        List<SwiperImage> swiperImageList = swiperImageMapper.selectList(null);
        if (swiperImageList != null) {
            Map<String, Object> data = new HashMap<>();
            data.put("swiperImageList", swiperImageList);
            return Result.ok(data);
        }
        return Result.build(null, ResultCodeEnum.FAIL);
    }
}




