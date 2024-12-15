package com.example.service.impl;

import cn.hutool.core.date.DateUtil;
import com.baomidou.mybatisplus.core.conditions.query.LambdaQueryWrapper;
import com.baomidou.mybatisplus.extension.service.impl.ServiceImpl;
import com.example.entity.requset.AddCartRequest;
import com.example.entity.response.GetCartResponse;
import com.example.mapper.DishMapper;
import com.example.pojo.Cart;
import com.example.service.CartService;
import com.example.mapper.CartMapper;
import com.example.utils.DateUtils;
import com.example.utils.Result;
import com.example.utils.ResultCodeEnum;
import jakarta.annotation.Resource;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import java.time.LocalDateTime;
import java.util.List;

/**
 * @author 郭继业
 * @description 针对表【cart(用户购物车表)】的数据库操作Service实现
 * @createDate 2024-06-17 21:41:53
 */
@Transactional
@Service
public class CartServiceImpl extends ServiceImpl<CartMapper, Cart>
        implements CartService {

    @Resource
    private CartMapper cartMapper;
    @Resource
    private DishMapper dishMapper;

    @Override
    public Result<?> add(List<AddCartRequest> addCartRequests, Integer userId) {
        addCartRequests.forEach(addCartRequest -> {
            Cart cart = new Cart();
            cart.setUserId(userId);
            cart.setDishId(addCartRequest.getDishId());
            cart.setRestaurantId(addCartRequest.getRestaurantId());
            cart.setQuantity(addCartRequest.getQuantity());
            cart.setPrice(addCartRequest.getPrice());
            cart.setCreatedTime(LocalDateTime.now());
            cart.setUpdateTime(LocalDateTime.now());
            LambdaQueryWrapper<Cart> lambdaQueryWrapper = new LambdaQueryWrapper<>();
            lambdaQueryWrapper.eq(Cart::getUserId, userId)
                    .eq(Cart::getDishId, addCartRequest.getDishId())
                    .eq(Cart::getRestaurantId, addCartRequest.getRestaurantId());
            Cart selectOne = cartMapper.selectOne(lambdaQueryWrapper);
            if (selectOne != null) {
                selectOne.setQuantity(selectOne.getQuantity() + addCartRequest.getQuantity());
                cartMapper.updateById(selectOne);
            } else {
                cartMapper.insert(cart);
            }
        });
        return Result.ok(null);
    }

    @Override
    public Result<?> getCart(Integer userId) {
        LambdaQueryWrapper<Cart> lambdaQueryWrapper = new LambdaQueryWrapper<>();
        lambdaQueryWrapper.eq(Cart::getUserId, userId);
        List<Cart> cartList = cartMapper.selectList(lambdaQueryWrapper);
        List<GetCartResponse> list = cartList.stream().map(cart -> {
            GetCartResponse getCartResponse = new GetCartResponse();
            getCartResponse.setId(cart.getId());
            getCartResponse.setDishId(cart.getDishId());
            getCartResponse.setRestaurantId(cart.getRestaurantId());
            getCartResponse.setQuantity(cart.getQuantity());
            getCartResponse.setPrice(cart.getPrice());
            getCartResponse.setChecked(cart.getChecked());
            getCartResponse.setName(dishMapper.selectById(cart.getDishId()).getName());
            getCartResponse.setImageUrl(dishMapper.selectById(cart.getDishId()).getImageUrl());
            getCartResponse.setDescription(dishMapper.selectById(cart.getDishId()).getDescription());
            getCartResponse.setUnit(dishMapper.selectById(cart.getDishId()).getUnit());
            return getCartResponse;
        }).toList();
        return list.isEmpty() ? Result.build(null, ResultCodeEnum.FAIL) : Result.ok(list);
    }

    @Override
    public Result<?> removeCart(List<Integer> ids, Integer userId) {
        LambdaQueryWrapper<Cart> lambdaQueryWrapper = new LambdaQueryWrapper<>();
        lambdaQueryWrapper.eq(Cart::getUserId, userId);
        List<Cart> cartList = cartMapper.selectList(lambdaQueryWrapper);
        if (cartList.isEmpty()){
            return Result.build(null, 400, "购物车为空");
        }
        for (Cart cart : cartList) {
            if (!cart.getUserId().equals(userId))
                return Result.build(null, 400, "非法操作");
        }
        cartMapper.deleteBatchIds(ids);
        return Result.ok(null);
    }
}




