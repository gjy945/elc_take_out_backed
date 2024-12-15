package com.example.service;

import com.example.entity.requset.AddOrderRequest;
import com.example.entity.requset.UpdateOrderStatus;
import com.example.pojo.Orders;
import com.baomidou.mybatisplus.extension.service.IService;
import com.example.utils.Result;

/**
* @author 郭继业
* @description 针对表【order】的数据库操作Service
* @createDate 2024-06-27 17:06:19
*/
public interface OrdersService extends IService<Orders> {


    /**
     * 根据用户id获取订单
     * @param userId 用户id
     * @return 结果
     */
    Result<?> getOrder(Integer userId);


    /**
     * 根据订单id获取订单详情
     * @param orderId 订单id
     * @return 结果
     */
    Result<?> getOrderDetailById(Integer orderId);


    /**
     * 添加订单
     * @param userId 用户id
     * @param addOrderRequest 添加订单请求
     * @return 结果
     */
    Result<?> addOrder(Integer userId, AddOrderRequest addOrderRequest);


    /**
     * 删除/取消订单
     * @param orderId 订单id
     * @param userId 用户id
     * @return 结果
     */
    Result<?> deleteOrder(Integer orderId, Integer userId);


    /**
     * 修改订单状态
     * @param userId 用户id
     * @param updateOrderStatus 修改订单状态
     * @return 结果
     */
    Result<?> updateOrder(Integer userId, UpdateOrderStatus updateOrderStatus);
}
