package com.example.entity.response;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@AllArgsConstructor
@NoArgsConstructor
public class GetCartResponse {
    private Integer id;
    private Integer dishId;
    private Integer restaurantId;
    private Integer quantity;
    private Double price;
    private Boolean checked;
    private String name;
    private String imageUrl;
    private String description;
    private String unit;
}
