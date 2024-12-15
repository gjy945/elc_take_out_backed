package com.example.controller.restaurant;

import com.example.service.RestaurantService;
import com.example.utils.Result;
import jakarta.annotation.Resource;
import org.springframework.web.bind.annotation.*;

/**
 * 餐馆相关
 */
@RestController
@CrossOrigin
@RequestMapping("restaurant")
public class RestaurantController {

    @Resource
    private RestaurantService restaurantService;

    /**
     * 获取餐馆列表 - 分页
     * @param pageNum 当前页码
     * @param pageSize 页容量
     * @return 餐馆列表
     */
    @PostMapping("getRestaurantPageList")
    public Result<?> getRestaurantPageList(
            @RequestParam(name = "pageNum", defaultValue = "1") int pageNum,
            @RequestParam(name = "pageSize", defaultValue = "10") int pageSize
    ) {
        System.out.println("pageNum: " + pageNum);
        System.out.println("pageSize: " + pageSize);
        return restaurantService.getRestaurantPageList(pageNum, pageSize);
    }

    /**
     * 模糊搜索餐馆和商品
     * @param search 搜索关键字
     * @return 结果
     */
    @PostMapping("getRestaurantSearch")
    public Result<?> getRestaurantSearch(String search) {
        return restaurantService.getRestaurantSearch(search);
    }


    /**
     * 根据id获取餐馆详情
     * @param restaurantId 商家id
     * @return 结果
     */
    @PostMapping("getRestaurantInfoById")
    public Result<?> getRestaurantById(Integer restaurantId) {
        return restaurantService.getRestaurantById(restaurantId);
    }
}
