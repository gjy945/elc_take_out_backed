package com.example.entity.response;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

/**
 * 获取分类列表响应
 */
@Data
@AllArgsConstructor
@NoArgsConstructor
public class GetCategoryListResponse {
    private String name;
    private String description;
    private Integer categoryId;
    private Integer restaurantId;
}
