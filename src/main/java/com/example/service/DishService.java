package com.example.service;

import com.example.pojo.Dish;
import com.baomidou.mybatisplus.extension.service.IService;
import com.example.utils.Result;

/**
* @author 郭继业
* @description 针对表【dish】的数据库操作Service
* @createDate 2024-05-29 13:49:46
*/
public interface DishService extends IService<Dish> {

    /**
     * 根据商家id和商家分类id获取菜品列表
     * @param restaurantId 商家id
     * @param categoryId 商家菜品分类id
     * @return 结果
     */
    Result<?> getDish(Integer restaurantId, Integer categoryId);
}
