package com.example.service.impl;

import cn.hutool.core.date.DateUtil;
import com.baomidou.mybatisplus.core.conditions.query.LambdaQueryWrapper;
import com.baomidou.mybatisplus.extension.service.impl.ServiceImpl;
import com.example.entity.response.UserLoginAndRegisterResponse;
import com.example.pojo.User;
import com.example.service.UserService;
import com.example.mapper.UserMapper;
import com.example.utils.*;
import jakarta.annotation.Resource;
import jakarta.servlet.http.HttpServletResponse;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import java.util.HashMap;
import java.util.Map;

/**
 * @author 郭继业
 * @description 针对表【user】的数据库操作Service实现
 * @createDate 2024-05-29 13:49:46
 */
@Transactional
@Service
public class UserServiceImpl extends ServiceImpl<UserMapper, User> implements UserService {

    @Resource
    UserMapper userMapper;
    @Resource
    JwtHelper jwtHelper;

    @Override
    public Result<?> login(String openid, HttpServletResponse response) {
        //根据用户openid查询用户,如果用户存在则登录,如果用户不存在则注册
        User user = userMapper.selectOne(new LambdaQueryWrapper<User>().eq(User::getOpenid, openid));
        //用户不存在则注册
        if (user == null) {
            user = new User();
            user.setOpenid(openid);
            user.setCreateTime(DateUtil.date());
            int rows = userMapper.insert(user);
            if (rows == 1) {
                String token = jwtHelper.createToken(user.getId().longValue());
                Map<String, Object> date = new HashMap<>();
                date.put("user", user.getId());
                date.put("token", token);
                return Result.ok(date);
            }

        }
        //用户存在则登录
        String token = jwtHelper.createToken(user.getId().longValue());
        response.setHeader("token", token);
        UserLoginAndRegisterResponse userLoginAndRegisterResponse
                = new UserLoginAndRegisterResponse(
                user.getId(),
                user.getUsername(),
                user.getNickname(),
                user.getGender(),
                user.getEmail(),
                user.getPhone(),
                user.getAddress(),
                user.getAvatar(),
                user.getBackImg());
        Map<String, Object> date = new HashMap<>();
        date.put("user", userLoginAndRegisterResponse);
        date.put("token", token);
        return Result.ok(date);
    }
}




