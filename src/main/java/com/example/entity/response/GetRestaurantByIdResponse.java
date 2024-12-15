package com.example.entity.response;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@AllArgsConstructor
@NoArgsConstructor
public class GetRestaurantByIdResponse {
    private String name;
    private String address;
    private String contactName;
    private String contactPhone;
    private String description;
    private String openingHours;
    private Integer status;
    private String website;
    private String imageUrl;
    private String email;
    private Double rating;
    private Double deliveryFees;
}
