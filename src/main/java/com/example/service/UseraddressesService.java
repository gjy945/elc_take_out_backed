package com.example.service;

import com.example.pojo.Useraddresses;
import com.baomidou.mybatisplus.extension.service.IService;
import com.example.utils.Result;

/**
* @author 郭继业
* @description 针对表【useraddresses】的数据库操作Service
* @createDate 2024-06-27 17:06:19
*/
public interface UseraddressesService extends IService<Useraddresses> {

    /**
     * 获取用户地址
     * @param userId 用户id
     * @return 结果
     */
    Result<?> getAddress(Integer userId);


    /**
     * 添加地址
     * @param useraddresses 地址
     * @param userId 用户id
     * @return 结果
     */
    Result<?> addAddress(Useraddresses useraddresses, Integer userId);


    /**
     * 删除地址
     * @param addressId 地址id
     * @param userId 用户id
     * @return 结果
     */
    Result<?> deleteAddress(Integer addressId, Integer userId);


    /**
     * 修改地址
     * @param useraddresses 地址
     * @param userId 用户id
     * @return 结果
     */
    Result<?> updateAddress(Useraddresses useraddresses, Integer userId);


    /**
     * 根据地址id获取地址
     * @param addressId 地址id
     * @return 结果
     */
    Result<?> getAddressById(Integer addressId);
}
