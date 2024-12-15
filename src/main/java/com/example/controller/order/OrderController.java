package com.example.controller.order;

import com.example.entity.requset.AddOrderRequest;
import com.example.entity.requset.UpdateOrderStatus;
import com.example.service.OrdersService;
import com.example.service.OrderdetailService;
import com.example.utils.JwtHelper;
import com.example.utils.Result;
import jakarta.annotation.Resource;
import org.springframework.web.bind.annotation.*;

@RestController
@CrossOrigin
@RequestMapping("order")
public class OrderController {

    @Resource
    private OrdersService ordersService;

    @Resource
    private OrderdetailService orderdetailService;

    @Resource
    private JwtHelper jwtHelper;


    /**
     * 根据用户id获取订单
     * @param token 用户token
     * @return 结果
     */
    @PostMapping("getOrder")
    public Result<?> getOrder(@RequestHeader("token") String token) {
        Integer userId = Math.toIntExact(jwtHelper.getUserId(token));
        return ordersService.getOrder(userId);
    }


    /**
     * 根据订单id获取订单详情
     * @param orderId 订单id
     * @return 结果
     */
    @PostMapping("getOrderDetailById")
    public Result<?> getOrderDetailById(@RequestParam Integer orderId) {
        return ordersService.getOrderDetailById(orderId);
    }


    /**
     * 添加订单
     * @param token 用户token
     * @param addOrderRequest 添加订单请求
     * @return 结果
     */
    @PostMapping("addOrder")
    public Result<?> addOrder(@RequestHeader("token") String token,
                              @RequestBody AddOrderRequest addOrderRequest) {
        Integer userId = Math.toIntExact(jwtHelper.getUserId(token));
        return ordersService.addOrder(userId, addOrderRequest);
    }

    /**
     * 删除/取消订单
     * @param orderId 订单id
     * @return 结果
     */
    @DeleteMapping("deleteOrder")
    public Result<?> deleteOrder(@RequestParam Integer orderId,
                                 @RequestHeader("token") String token) {
        Integer userId = Math.toIntExact(jwtHelper.getUserId(token));
        return ordersService.deleteOrder(orderId, userId);
    }

    /**
     * 更新订单状态
     * @param token 用户token
     * @param updateOrderStatus 更新订单状态
     * @return 结果
     */
    @PutMapping("updateOrder")
    public Result<?> updateOrder(@RequestHeader("token") String token,
                                 @RequestBody UpdateOrderStatus updateOrderStatus) {
        Integer userId = Math.toIntExact(jwtHelper.getUserId(token));
        return ordersService.updateOrder(userId, updateOrderStatus);
    }
}
