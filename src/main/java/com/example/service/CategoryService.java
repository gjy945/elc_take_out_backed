package com.example.service;

import com.example.pojo.Category;
import com.baomidou.mybatisplus.extension.service.IService;
import com.example.utils.Result;

/**
* @author 郭继业
* @description 针对表【category(商品分类表)】的数据库操作Service
* @createDate 2024-06-06 03:00:32
*/
public interface CategoryService extends IService<Category> {

    /**
     * 根据restaurantId获取分类列表
     * @param restaurantId 商家id
     * @return 结果
     */
    Result<?> getCategoryListByRestaurantId(Integer restaurantId);
}
