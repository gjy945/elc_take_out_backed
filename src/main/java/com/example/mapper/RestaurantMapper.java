package com.example.mapper;

import com.example.pojo.Restaurant;
import com.baomidou.mybatisplus.core.mapper.BaseMapper;

import java.util.List;

/**
* @author 郭继业
* @description 针对表【restaurant】的数据库操作Mapper
* @createDate 2024-06-03 20:20:48
* @Entity com.example.pojo.Restaurant
*/
public interface RestaurantMapper extends BaseMapper<Restaurant> {

    List<Restaurant> selectByRestaurantId(Integer restaurantId);
}




