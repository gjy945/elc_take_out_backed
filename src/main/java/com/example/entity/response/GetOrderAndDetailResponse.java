package com.example.entity.response;

import com.example.pojo.Orderdetail;
import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

import java.math.BigDecimal;
import java.time.LocalDateTime;
import java.util.List;
@Data
@AllArgsConstructor
@NoArgsConstructor
public class GetOrderAndDetailResponse {
    private Integer id;

    private Integer userId;

    private Integer restaurantId;

    private Integer addressId;

    private BigDecimal totalPrice;

    private LocalDateTime orderTime;

    private String status;

    private String remark;

    private String imageUrl;

    private String restaurantName;

    private LocalDateTime expectedDeliveryTime;

    private LocalDateTime actualDeliveryTime;

    private List<Orderdetail> orderdetails;
}
