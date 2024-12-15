package com.example.mapper;

import com.example.pojo.Dish;
import com.baomidou.mybatisplus.core.mapper.BaseMapper;

import java.util.List;

/**
* @author 郭继业
* @description 针对表【dish】的数据库操作Mapper
* @createDate 2024-05-29 13:49:46
* @Entity com.example.pojo.Dish
*/
public interface DishMapper extends BaseMapper<Dish> {

    /**
     * 根据 restaurantId 查询菜品列表
     * @param id 商家id
     * @return 结果
     */
    List<Dish> selectByRestaurantId(Integer id);
}




