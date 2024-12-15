package com.example.pojo;

import com.baomidou.mybatisplus.annotation.*;

import java.io.Serial;
import java.io.Serializable;
import java.math.BigDecimal;
import java.util.Date;
import lombok.Data;

/**
 * @TableName dish
 */
@TableName(value ="dish")
@Data
public class Dish implements Serializable {
    @TableId(type = IdType.AUTO)
    private Integer id;

    private Integer restaurantId;

    private Integer categoryId;

    private String name;

    private BigDecimal price;

    private String unit;

    private String description;

    private String imageUrl;

    private Integer isAvailable;

    private Date createTime;

    private Date updateTime;

    @Version
    private Integer version;

    @TableLogic
    private Integer deleted;

    private Integer quantity;

    @Serial
    private static final long serialVersionUID = 1L;
}