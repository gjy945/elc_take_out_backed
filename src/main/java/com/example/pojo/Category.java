package com.example.pojo;

import com.baomidou.mybatisplus.annotation.*;

import java.io.Serial;
import java.io.Serializable;
import java.util.Date;
import lombok.Data;

/**
 * @TableName category
 */
@TableName(value ="category")
@Data
public class Category implements Serializable {
    @TableId(type = IdType.AUTO)
    private Integer id;

    private String name;

    private String description;

    private Integer categoryId;

    private Integer restaurantId;

    private Date createTime;

    private Date updateTime;

    @Version
    private Integer version;

    @TableLogic
    private Integer deleted;

    @Serial
    private static final long serialVersionUID = 1L;
}