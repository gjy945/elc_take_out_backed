package com.example.pojo;

import com.baomidou.mybatisplus.annotation.IdType;
import com.baomidou.mybatisplus.annotation.TableField;
import com.baomidou.mybatisplus.annotation.TableId;
import com.baomidou.mybatisplus.annotation.TableName;

import java.io.Serial;
import java.io.Serializable;
import java.util.Date;
import lombok.Data;

/**
 * @TableName merchant_category
 */
@TableName(value ="merchant_category")
@Data
public class MerchantCategory implements Serializable {
    @TableId(type = IdType.AUTO)
    private Integer id;

    private Integer restaurantId;

    private String name;

    private String description;

    private Date createTime;

    private Date updateTime;

    private Integer version;

    private Integer deleted;

    @Serial
    private static final long serialVersionUID = 1L;
}