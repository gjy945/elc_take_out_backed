package com.example.pojo;

import com.baomidou.mybatisplus.annotation.*;

import java.io.Serial;
import java.io.Serializable;
import java.util.Date;
import lombok.Data;

/**
 * @TableName restaurant_swiper_image
 */
@TableName(value ="restaurant_swiper_image")
@Data
public class RestaurantSwiperImage implements Serializable {
    @TableId(type = IdType.AUTO)
    private Integer id;

    private String imageUrl;

    private String title;

    private String description;

    private Integer displayOrder;

    private Integer isEnabled;

    private Date createTime;

    private Date updateTime;

    @Version
    private Integer version;

    @TableLogic
    private Integer deleted;

    private Integer restaurantId;

    @Serial
    private static final long serialVersionUID = 1L;
}