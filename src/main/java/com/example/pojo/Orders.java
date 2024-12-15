package com.example.pojo;

import com.baomidou.mybatisplus.annotation.*;

import java.io.Serial;
import java.io.Serializable;
import java.math.BigDecimal;
import java.time.LocalDateTime;

import lombok.Data;

/**
 * @TableName order
 */
@TableName(value ="orders")
@Data
public class Orders implements Serializable {
    @TableId(type = IdType.AUTO)
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

    private LocalDateTime createTime;

    private LocalDateTime updateTime;

    @Version
    private Integer version;

    private Integer deleted;

    @Serial
    private static final long serialVersionUID = 1L;
}