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
 * @TableName useraddresses
 */
@TableName(value ="useraddresses")
@Data
public class Useraddresses implements Serializable {
    @TableId(type = IdType.AUTO)
    private Integer id;

    private Integer userId;

    private String contactName;

    private String phoneNumber;

    private String address;

    private String addressDetail;

    private Boolean isDefault;

    private Date createdTime;

    private Date updatedTime;

    @Serial
    private static final long serialVersionUID = 1L;
}