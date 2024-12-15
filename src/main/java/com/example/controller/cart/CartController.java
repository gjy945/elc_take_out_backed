package com.example.controller.cart;

import com.example.entity.requset.AddCartRequest;
import com.example.service.CartService;
import com.example.utils.JwtHelper;
import com.example.utils.Result;
import jakarta.annotation.Resource;
import org.springframework.web.bind.annotation.*;

import java.util.List;

@RestController
@CrossOrigin
@RequestMapping("cart")
public class CartController {

    @Resource
    private CartService cartService;
    @Resource
    private JwtHelper jwtHelper;


    /**
     * 添加购物车
     * @param addCartRequests 添加购物车请求
     * @param token token
     * @return 结果
     */
    @PostMapping("add")
    public Result<?> add(@RequestBody List<AddCartRequest> addCartRequests,
                         @RequestHeader("token") String token) {
        Integer userId = Math.toIntExact(jwtHelper.getUserId(token));
        return cartService.add(addCartRequests, userId);
    }

    /**
     * 获取购物车,根据用户id
     * @param token token 提取用户id
     * @return 结果
     */
    @PostMapping("getCart")
    public Result<?> getCart(@RequestHeader("token") String token) {
        Integer userId = Math.toIntExact(jwtHelper.getUserId(token));
        return cartService.getCart(userId);
    }

    /**
     * 删除购物车
     * @param ids id集合
     * @param token token
     * @return 结果
     */
    @DeleteMapping("removeCart")
    public Result<?> removeCart(@RequestBody List<Integer> ids,
                              @RequestHeader("token") String token) {
        Integer userId = Math.toIntExact(jwtHelper.getUserId(token));
        return cartService.removeCart(ids, userId);
    }
}
