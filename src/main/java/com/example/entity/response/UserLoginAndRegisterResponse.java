package com.example.entity.response;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

/**
 * 用于用户登录注册返回的数据封装
 */
@Data
@AllArgsConstructor
@NoArgsConstructor
public class UserLoginAndRegisterResponse {
    private Integer id;
    private String username;
    private String nickname;
    private String gender;
    private String email;
    private String phone;
    private String address;
    private String avatar;
    private String backImg;
}
