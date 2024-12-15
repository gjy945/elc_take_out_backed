package com.example.mapper;

import com.example.pojo.Category;
import com.baomidou.mybatisplus.core.mapper.BaseMapper;

import java.util.List;

/**
* @author 郭继业
* @description 针对表【category(商品分类表)】的数据库操作Mapper
* @createDate 2024-06-06 03:00:32
* @Entity com.example.pojo.Category
*/
public interface CategoryMapper extends BaseMapper<Category> {

    List<Category> getCategoryListByRestaurantId(Integer restaurantId);
}




