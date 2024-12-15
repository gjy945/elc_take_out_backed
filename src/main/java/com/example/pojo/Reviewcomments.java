package com.example.pojo;

import com.baomidou.mybatisplus.annotation.IdType;
import com.baomidou.mybatisplus.annotation.TableField;
import com.baomidou.mybatisplus.annotation.TableId;
import com.baomidou.mybatisplus.annotation.TableName;

import java.io.Serial;
import java.io.Serializable;
import java.time.LocalDateTime;
import java.util.Date;
import lombok.Data;

/**
 * @TableName reviewcomments
 */
@TableName(value ="reviewcomments")
@Data
public class Reviewcomments implements Serializable {

    @TableId(type = IdType.AUTO)
    private Integer id;

    private Integer userid;

    private Integer restaurantid;

    private Integer rating;

    private String commentcontent;

    private LocalDateTime commenttime;

    @Serial
    private static final long serialVersionUID = 1L;
}