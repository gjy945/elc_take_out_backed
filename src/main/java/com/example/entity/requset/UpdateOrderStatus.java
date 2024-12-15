package com.example.entity.requset;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

@AllArgsConstructor
@NoArgsConstructor
@Data
public class UpdateOrderStatus {
    private Integer orderId;
    private String status;
}
