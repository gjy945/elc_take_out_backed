package com.example.service.impl;

import com.baomidou.mybatisplus.core.conditions.query.LambdaQueryWrapper;
import com.baomidou.mybatisplus.extension.service.impl.ServiceImpl;
import com.example.controller.userAddresses.UserAddresses;
import com.example.pojo.Useraddresses;
import com.example.service.UseraddressesService;
import com.example.mapper.UseraddressesMapper;
import com.example.utils.Result;
import jakarta.annotation.Resource;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import java.util.List;

/**
 * @author 郭继业
 * @description 针对表【useraddresses】的数据库操作Service实现
 * @createDate 2024-06-27 17:06:19
 */
@Service
@Transactional
public class UseraddressesServiceImpl extends ServiceImpl<UseraddressesMapper, Useraddresses>
        implements UseraddressesService {

    @Resource
    private UseraddressesMapper useraddressesMapper;

    @Override
    public Result<?> getAddress(Integer userId) {
        List<Useraddresses> useraddressesList = useraddressesMapper.selectList(new LambdaQueryWrapper<Useraddresses>().eq(Useraddresses::getUserId, userId));
        if (useraddressesList.isEmpty()) {
            return Result.build(null, 400, "暂无地址");
        }
        return Result.ok(useraddressesList);
    }

    @Override
    public Result<?> addAddress(Useraddresses useraddresses, Integer userId) {
        useraddresses.setUserId(userId);
        useraddressesMapper.insert(useraddresses);
        return Result.ok(null);
    }

    @Override
    public Result<?> deleteAddress(Integer addressId, Integer userId) {
        int rows = useraddressesMapper.delete(new LambdaQueryWrapper<Useraddresses>().eq(Useraddresses::getId, addressId).eq(Useraddresses::getUserId, userId));
        if (rows == 0) {
            return Result.build(null, 400, "删除失败");
        }
        return Result.ok(null);
    }

    @Override
    public Result<?> updateAddress(Useraddresses useraddresses, Integer userId) {
        int rows = useraddressesMapper.update(useraddresses, new LambdaQueryWrapper<Useraddresses>().eq(Useraddresses::getId, useraddresses.getId()).eq(Useraddresses::getUserId, userId));
        if (rows == 0) {
            return Result.build(null, 400, "更新失败");
        }
        return Result.ok(null);
    }

    @Override
    public Result<?> getAddressById(Integer addressId) {
        Useraddresses useraddresses = useraddressesMapper.selectOne(new LambdaQueryWrapper<Useraddresses>().eq(Useraddresses::getId, addressId));
        return Result.ok(useraddresses);
    }
}




