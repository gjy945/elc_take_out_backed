package com.example.pojo;

import com.baomidou.mybatisplus.annotation.*;

import java.io.Serial;
import java.io.Serializable;
import java.util.Date;
import lombok.Data;

/**
 * @TableName user
 */
@TableName(value ="user")
@Data
public class User implements Serializable {
    @TableId(type = IdType.AUTO)
    private Integer id;

    private String username;

    private String password;

    private String nickname;

    private String openid;

    private String gender;

    private String email;

    private String phone;

    private String address;

    private Date createTime;

    private Date updateTime;

    @Version
    private Integer version;

    private String avatar;

    private String backImg;

    @TableLogic(value = "0",delval = "1")
    private Integer deleted;

    @Serial
    private static final long serialVersionUID = 1L;
}