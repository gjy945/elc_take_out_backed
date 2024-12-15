package com.example.service;

import com.example.pojo.Restaurant;
import com.baomidou.mybatisplus.extension.service.IService;
import com.example.utils.Result;

/**
 * @author 郭继业
 * @description 针对表【restaurant】的数据库操作Service
 * @createDate 2024-05-29 13:49:46
 */
public interface RestaurantService extends IService<Restaurant> {

    /**
     * 获取分页商家列表数据
     * @param pageNum   当前页码
     * @param pageSize   页码大小(页容量)
     */
    Result<?> getRestaurantPageList(int pageNum, int pageSize);

    /**
     * 根据id获取商家信息
     * @param restaurantId 商家id
     * @return 结果
     */
    Result<?> getRestaurantById(Integer restaurantId);


    /**
     * 模糊搜索商家和商品
     * @param search 搜索关键字
     * @return 结果
     */
    Result<?> getRestaurantSearch(String search);
}