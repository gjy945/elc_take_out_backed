package com.example.pojo;

import com.baomidou.mybatisplus.annotation.*;

import java.io.Serial;
import java.io.Serializable;
import java.time.LocalDateTime;
import java.util.Date;
import lombok.Data;

/**
 * @TableName cart
 */
@TableName(value ="cart")
@Data
public class Cart implements Serializable {
    @TableId(type = IdType.AUTO)
    private Integer id;

    private Integer userId;

    private Integer dishId;

    private Integer restaurantId;

    private Double price;

    private Integer quantity;

    private Boolean checked;

    private LocalDateTime createdTime;

    private LocalDateTime updateTime;

    @Version
    private Integer version;


    private Integer deleted;

    @Serial
    private static final long serialVersionUID = 1L;
}