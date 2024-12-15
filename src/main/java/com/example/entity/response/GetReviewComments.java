package com.example.entity.response;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

import java.time.LocalDateTime;

@Data
@AllArgsConstructor
@NoArgsConstructor
public class GetReviewComments {
    private Integer id;

    private Integer userid;

    private Integer restaurantid;

    private Integer rating;

    private String commentcontent;

    private LocalDateTime commenttime;

    private UserLoginAndRegisterResponse user;
}
