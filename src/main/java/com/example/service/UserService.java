package com.example.service;

import com.example.entity.requset.LoginRequest;
import com.example.entity.requset.RegisterRequest;
import com.example.pojo.User;
import com.baomidou.mybatisplus.extension.service.IService;
import com.example.utils.Result;
import jakarta.servlet.http.HttpServletResponse;

/**
* @author 郭继业
* @description 针对表【user】的数据库操作Service
* @createDate 2024-05-29 13:49:46
*/
public interface UserService extends IService<User> {
    /**
     * 登录注册
     * @param openid openid
     * @return 结果
     */
    Result<?> login(String openid , HttpServletResponse response);

}
