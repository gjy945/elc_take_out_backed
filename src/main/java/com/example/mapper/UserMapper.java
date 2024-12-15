package com.example.mapper;

import com.baomidou.mybatisplus.core.conditions.query.LambdaQueryWrapper;
import com.example.entity.requset.RegisterRequest;
import com.example.pojo.User;
import com.baomidou.mybatisplus.core.mapper.BaseMapper;

/**
* @author 郭继业
* @description 针对表【user】的数据库操作Mapper
* @createDate 2024-05-29 13:49:46
* @Entity com.example.pojo.User
*/
public interface UserMapper extends BaseMapper<User> {
//
//    /**
//     * 根据条件查询用户
//     * @param registerRequest 注册请求
//     * @return 返回用户
//     */
//    User selectUser(RegisterRequest registerRequest);
//
//    /**
//     * 更新用户 忽略逻辑删除
//     * @param user 用户
//     * @return 影响行数
//     */
//    int updateUser(User user);
}




