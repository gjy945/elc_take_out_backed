package com.example.service.impl;

import com.baomidou.mybatisplus.core.conditions.query.LambdaQueryWrapper;
import com.baomidou.mybatisplus.extension.service.impl.ServiceImpl;
import com.example.entity.requset.AddOrderRequest;
import com.example.entity.requset.UpdateOrderStatus;
import com.example.entity.response.GetOrderAndDetailResponse;
import com.example.mapper.CartMapper;
import com.example.mapper.DishMapper;
import com.example.mapper.OrderdetailMapper;
import com.example.pojo.Dish;
import com.example.pojo.Orderdetail;
import com.example.pojo.Orders;
import com.example.service.OrdersService;
import com.example.mapper.OrderMapper;
import com.example.utils.Result;
import jakarta.annotation.Resource;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import java.time.Duration;
import java.time.LocalDateTime;
import java.time.temporal.ChronoUnit;
import java.util.HashMap;
import java.util.List;
import java.util.Map;
import java.util.stream.Collectors;

/**
 * @author 郭继业
 * @description 针对表【order】的数据库操作Service实现
 * @createDate 2024-06-27 17:06:19
 */
@Service
@Transactional
public class OrdersServiceImpl extends ServiceImpl<OrderMapper, Orders>
        implements OrdersService {

    @Resource
    private OrderMapper orderMapper;

    @Resource
    private OrderdetailMapper orderdetailMapper;

    @Resource
    private CartMapper cartMapper;

    @Resource
    private DishMapper dishMapper;


    @Override
    public Result<?> getOrder(Integer userId) {
        LambdaQueryWrapper<Orders> queryWrapper = new LambdaQueryWrapper<>();
        queryWrapper.eq(Orders::getUserId, userId)
                .eq(Orders::getStatus, "待支付");

        // 查询所有该用户的待支付订单
        List<Orders> allOrders = orderMapper.selectList(queryWrapper);

        // 定义过期时间阈值，例如 15 分钟转换为秒
        long expireThresholdSeconds = 15 * 60;

        // 使用流初步筛选出15分钟(900秒)内的有效订单
        List<Orders> validOrders = allOrders.stream()
                .filter(order -> Duration.between(order.getCreateTime(), LocalDateTime.now()).getSeconds() <= expireThresholdSeconds)
                .toList();

        // 删除无效（过期）订单 id
        List<Integer> expiredOrderIds = allOrders.stream()
                .filter(order -> !validOrders.contains(order))
                .map(Orders::getId)
                .collect(Collectors.toList());
        if (!expiredOrderIds.isEmpty()) {
            orderMapper.deleteBatchIds(expiredOrderIds);
        }

        // 再次查询所有该用户的订单，包括已更新的状态
        List<Orders> orders = orderMapper.selectList(new LambdaQueryWrapper<Orders>().eq(Orders::getUserId, userId));

        // 映射订单为GetOrderAndDetailResponse对象列表
        List<GetOrderAndDetailResponse> responses = orders.stream().map(order -> {
            GetOrderAndDetailResponse response = new GetOrderAndDetailResponse();
            response.setId(order.getId());
            response.setUserId(order.getUserId());
            response.setRestaurantId(order.getRestaurantId());
            response.setAddressId(order.getAddressId());
            response.setTotalPrice(order.getTotalPrice());
            response.setOrderTime(order.getOrderTime());
            response.setStatus(order.getStatus());
            response.setRemark(order.getRemark());
            response.setImageUrl(order.getImageUrl());
            response.setRestaurantName(order.getRestaurantName());
            response.setExpectedDeliveryTime(order.getExpectedDeliveryTime());
            response.setActualDeliveryTime(order.getActualDeliveryTime());

            List<Orderdetail> details = orderdetailMapper.selectList(new LambdaQueryWrapper<Orderdetail>()
                    .eq(Orderdetail::getOrderId, order.getId()));
            response.setOrderdetails(details);

            return response;
        }).collect(Collectors.toList());

        return Result.ok(responses);
    }


    @Override
    public Result<?> getOrderDetailById(Integer orderId) {
        Orders orders = orderMapper.selectById(orderId);
        if (orders != null) {
            List<Orderdetail> orderdetails = orderdetailMapper.selectList(new LambdaQueryWrapper<Orderdetail>().eq(Orderdetail::getOrderId, orderId));

            // 计算剩余有效时间（单位：秒）
            LocalDateTime createTime = orders.getCreateTime();
            LocalDateTime now = LocalDateTime.now().truncatedTo(ChronoUnit.SECONDS);
            System.out.println(createTime + " " + now);
            long remainingSeconds = calculateRemainingSeconds(createTime, now, 15); // 有效期为15分钟

            if (remainingSeconds <= 0){
                return Result.build(null,400,"订单已过期");
            }

            GetOrderAndDetailResponse getOrderAndDetailResponse = new GetOrderAndDetailResponse();
            getOrderAndDetailResponse.setId(orders.getId());
            getOrderAndDetailResponse.setUserId(orders.getUserId());
            getOrderAndDetailResponse.setRestaurantId(orders.getRestaurantId());
            getOrderAndDetailResponse.setAddressId(orders.getAddressId());
            getOrderAndDetailResponse.setTotalPrice(orders.getTotalPrice());
            getOrderAndDetailResponse.setOrderTime(orders.getOrderTime());
            getOrderAndDetailResponse.setStatus(orders.getStatus());
            getOrderAndDetailResponse.setRemark(orders.getRemark());
            getOrderAndDetailResponse.setImageUrl(orders.getImageUrl());
            getOrderAndDetailResponse.setRestaurantName(orders.getRestaurantName());
            getOrderAndDetailResponse.setExpectedDeliveryTime(orders.getExpectedDeliveryTime());
            getOrderAndDetailResponse.setActualDeliveryTime(orders.getActualDeliveryTime());
            getOrderAndDetailResponse.setOrderdetails(orderdetails);

            Map<String, Object> map = new HashMap<>();
            map.put("order", getOrderAndDetailResponse);
            map.put("remainingSecondsUntilExpiration", remainingSeconds);
            System.out.println(remainingSeconds);
            return Result.ok(map);
        }
        return Result.build(null, 400, "订单不存在");
    }

    // 计算剩余有效时间
    private long calculateRemainingSeconds(LocalDateTime createTime, LocalDateTime now, long expirationMinutes) {
        // 计算从创建时间到现在的总秒数
        long secondsBetween = Duration.between(createTime, now).getSeconds();

        // 计算有效期的总秒数
        long totalExpirationSeconds = expirationMinutes * 60;

        // 计算剩余有效秒数
        long remainingSeconds = totalExpirationSeconds - secondsBetween;

        // 如果剩余秒数小于0，说明订单已过期
        return remainingSeconds <= 0 ? 0 : remainingSeconds;
    }

    @Override
    public Result<?> addOrder(Integer userId, AddOrderRequest addOrderRequest) {
        // 插入订单数据
        Orders orders = new Orders();
        orders.setUserId(userId);
        orders.setRestaurantId(addOrderRequest.getRestaurantId());
        orders.setAddressId(addOrderRequest.getAddressId());
        orders.setTotalPrice(addOrderRequest.getTotalPrice());
        orders.setOrderTime(addOrderRequest.getOrderTime());
        orders.setStatus(addOrderRequest.getStatus());
        orders.setRemark(addOrderRequest.getRemark());
        orders.setImageUrl(addOrderRequest.getImageUrl());
        orders.setRestaurantName(addOrderRequest.getRestaurantName());
        orders.setExpectedDeliveryTime(addOrderRequest.getExpectedDeliveryTime());
        orders.setActualDeliveryTime(addOrderRequest.getActualDeliveryTime());
        orders.setCreateTime(LocalDateTime.now());
        int insert = orderMapper.insert(orders);
        if (insert > 0) {
            // 插入订单详情数据
            addOrderRequest.getOrderdetails().forEach(orderdetail -> {
                orderdetail.setOrderId(orders.getId());
                orderdetail.setDishId(orderdetail.getDishId());
                orderdetail.setDishName(dishMapper.selectById(orderdetail.getDishId()).getName());
                orderdetail.setRestaurantId(orderdetail.getRestaurantId());
                orderdetail.setQuantity(orderdetail.getQuantity());
                orderdetail.setUnitPrice(orderdetail.getUnitPrice());
                orderdetail.setSubTotal(orderdetail.getSubTotal());
                orderdetail.setImageUrl(orderdetail.getImageUrl());
                orderdetail.setCreateTime(LocalDateTime.now());
                orderdetailMapper.insert(orderdetail);
            });
            //生成订单之后自动删除购物车数据
            addOrderRequest.getOrderdetails().forEach(orderdetail -> {
                System.out.println(orderdetail.getId());
                int i = cartMapper.deleteById(orderdetail.getId());
                if (i > 0) {
                    System.out.println("删除成功");
                }
            });
            return Result.ok(orders.getId());
        }
        return Result.build(null, 401, "添加订单失败");
    }

    @Override
    public Result<?> deleteOrder(Integer orderId, Integer userId) {
        if (!orderMapper.selectById(orderId).getUserId().equals(userId)) {
            return Result.build(null, 401, "订单不属于该用户,无法操作");
        }
        int rows = orderMapper.deleteById(orderId);
        if (rows > 0) {
            System.out.println(orderId);
            return Result.build(null, 200, "订单取消成功");
        }
        return Result.build(null, 401, "删除订单失败");
    }

    @Override
    public Result<?> updateOrder(Integer userId, UpdateOrderStatus updateOrderStatus) {
        Orders orders = orderMapper.selectOne(new LambdaQueryWrapper<Orders>().eq(Orders::getId, updateOrderStatus.getOrderId()).eq(Orders::getUserId, userId));
        if (orders != null) {
            orders.setStatus(updateOrderStatus.getStatus());
            int rows = orderMapper.updateById(orders);
            if (rows > 0) {
                return Result.ok(orders.getStatus());
            }
        }
        return null;
    }
}




