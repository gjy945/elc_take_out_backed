package com.example.entity.requset;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

@AllArgsConstructor
@NoArgsConstructor
@Data
public class AddReviewCommentsRequest {
    private Integer userId;
    private Integer restaurantId;
    private Integer rating;
    private String commentcontent;
}
