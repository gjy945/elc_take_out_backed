package com.example.entity.requset;

import com.fasterxml.jackson.annotation.JsonProperty;
import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@NoArgsConstructor
@AllArgsConstructor
public class AddCartRequest {
    @JsonProperty("id")
    private Integer dishId;

    private Integer restaurantId;

    private Integer quantity;

    private Double price;
}
