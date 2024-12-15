package com.example.entity.response;

import com.baomidou.mybatisplus.annotation.TableLogic;
import com.baomidou.mybatisplus.annotation.Version;
import com.example.pojo.Dish;
import com.example.pojo.Restaurant;
import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

import java.util.Date;
import java.util.List;

@Data
@AllArgsConstructor
@NoArgsConstructor
public class GetRestaurantAndDishResponse {
    private Integer id;

    private String name; // 餐馆名称

    private String description; // 餐馆描述

    private String openingHours; // 餐馆营业时间

    private Integer status; // 餐馆状态

    private String imageUrl;  // 餐馆图片

    private Double rating; // 餐馆评分

    private Double deliveryFees; // 餐馆配送费

    private Integer restaurantCategoryId; // 餐馆分类id

    private List<Dish> dishList;
}
