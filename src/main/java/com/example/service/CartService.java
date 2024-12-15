package com.example.service;

import com.example.entity.requset.AddCartRequest;
import com.example.pojo.Cart;
import com.baomidou.mybatisplus.extension.service.IService;
import com.example.utils.Result;

import java.util.List;

/**
* @author 郭继业
* @description 针对表【cart(用户购物车表)】的数据库操作Service
* @createDate 2024-06-17 21:41:53
*/
public interface CartService extends IService<Cart> {

    /**
     * 添加购物车
     * @param addCartRequests 添加购物车请求
     * @param userId 用户id
     * @return 结果
     */
    Result<?> add(List<AddCartRequest> addCartRequests, Integer userId);

    /**
     * 获取购物车
     * @param userId 用户id
     * @return 结果
     */
    Result<?> getCart(Integer userId);


    /**
     * 删除购物车
     * @param ids id集合
     * @param userId 用户id
     * @return 结果
     */
    Result<?> removeCart(List<Integer> ids, Integer userId);
}
