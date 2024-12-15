package com.example.pojo;

import com.baomidou.mybatisplus.annotation.*;

import java.io.Serial;
import java.io.Serializable;
import java.math.BigDecimal;
import java.time.LocalDateTime;
import java.util.Date;
import lombok.Data;

/**
 * @TableName orderdetail
 */
@TableName(value ="orderdetail")
@Data
public class Orderdetail implements Serializable {
    @TableId(type = IdType.AUTO)
    private Integer id;

    private Integer orderId;

    private Integer dishId;

    private String dishName;

    private Integer restaurantId;

    private Integer quantity;

    private BigDecimal unitPrice;

    private BigDecimal subTotal;

    private String imageUrl;

    private LocalDateTime createTime;

    private LocalDateTime updateTime;

    @Version
    private Integer version;

    private Integer deleted;

    @Serial
    private static final long serialVersionUID = 1L;
}