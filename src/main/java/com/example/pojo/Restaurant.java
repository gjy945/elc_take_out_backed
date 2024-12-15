package com.example.pojo;

import com.baomidou.mybatisplus.annotation.*;

import java.io.Serial;
import java.io.Serializable;
import java.util.Date;
import lombok.Data;

/**
 * @TableName restaurant
 */
@TableName(value ="restaurant")
@Data
public class Restaurant implements Serializable {
    @TableId(type = IdType.AUTO)
    private Integer id;


    private String name; // 餐馆名称

    private String address; // 餐馆地址

    private String contactPhone; // 餐馆联系电话

    private String description; // 餐馆描述

    private String openingHours; // 餐馆营业时间

    private Integer status; // 餐馆状态

    private Integer approvalStatus;  // 餐馆审核状态

    private String website; // 餐馆网站

    private Date createTime;  // 餐馆创建时间

    private Date updateTime;  // 餐馆更新时间

    @Version
    private Integer version;

    private String imageUrl;  // 餐馆图片

    @TableLogic
    private Integer deleted;

    private String contactName; // 餐馆联系人

    private String email; // 餐馆邮箱

    private Double rating; // 餐馆评分

    private Double deliveryFees; // 餐馆配送费

    private Integer restaurantCategoryId; // 餐馆分类id

    @Serial
    private static final long serialVersionUID = 1L;
}