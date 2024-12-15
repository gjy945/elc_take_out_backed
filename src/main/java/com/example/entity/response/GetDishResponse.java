package com.example.entity.response;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

import java.math.BigDecimal;

/**
 * 根据商家id和菜品分类菜品列表
 */
@Data
@AllArgsConstructor
@NoArgsConstructor
public class GetDishResponse {
    private Integer id;
    private Integer restaurantId;
    private Integer categoryId;
    private String name;
    private BigDecimal price;
    private String unit;
    private String description;
    private String imageUrl;
    private Integer isAvailable;
    private Integer quantity;
}
