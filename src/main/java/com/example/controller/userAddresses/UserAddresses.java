package com.example.controller.userAddresses;

import com.example.pojo.Useraddresses;
import com.example.service.UseraddressesService;
import com.example.utils.JwtHelper;
import com.example.utils.Result;
import jakarta.annotation.Resource;
import org.springframework.web.bind.annotation.*;

@RestController
@CrossOrigin
@RequestMapping("userAddresses")
public class UserAddresses {

    @Resource
    private UseraddressesService useraddressesService;

    @Resource
    JwtHelper jwtHelper;


    /**
     * 获取用户地址
     * @param token token
     * @return 结果
     */
    @PostMapping("getAddress")
    public Result<?> getAddress(@RequestHeader("token") String token) {
        Integer userId = Math.toIntExact(jwtHelper.getUserId(token));
        return useraddressesService.getAddress(userId);
    }

    /**
     * 新增地址
     * @param token token
     * @param useraddresses 添加地址请求
     * @return 结果
     */
    @PostMapping("addAddress")
    public Result<?> addAddress(@RequestHeader("token") String token,
                                @RequestBody Useraddresses useraddresses) {
        Integer userId = Math.toIntExact(jwtHelper.getUserId(token));
        return useraddressesService.addAddress(useraddresses, userId);
    }

    /**
     * 删除地址
     * @param addressId 地址id
     * @param token token
     * @return 结果
     */
    @DeleteMapping("deleteAddress")
    public Result<?> deleteAddress(@RequestParam Integer addressId,
                                  @RequestHeader("token") String token) {
        Integer userId = Math.toIntExact(jwtHelper.getUserId(token));
        return useraddressesService.deleteAddress(addressId, userId);
    }


    /**
     * 修改地址
     * @param token token
     * @param useraddresses 修改地址请求
     * @return 结果
     */
    @PostMapping("updateAddress")
    public Result<?> updateAddress(@RequestHeader("token") String token,
                                  @RequestBody Useraddresses useraddresses) {
        Integer userId = Math.toIntExact(jwtHelper.getUserId(token));
        return useraddressesService.updateAddress(useraddresses, userId);
    }


    /**
     * 根据地址id获取地址
     * @param addressId 地址id
     * @return 结果
     */
    @PostMapping("getAddressById")
    public Result<?> getAddressById(@RequestParam Integer addressId) {
        return useraddressesService.getAddressById(addressId);
    }
}
