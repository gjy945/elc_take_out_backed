package com.example.entity.requset;

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
public class AddOrderRequest {
    private Integer restaurantId;
    private Integer addressId;
    private String remark;
    private String imageUrl;
    private String restaurantName;
    private BigDecimal totalPrice;
    private LocalDateTime orderTime;
    private LocalDateTime expectedDeliveryTime;
    private LocalDateTime actualDeliveryTime;
    private String status = "待支付";
    private List<Orderdetail> orderdetails;
}
