package com.example.service.impl;

import com.baomidou.mybatisplus.core.conditions.query.LambdaQueryWrapper;
import com.baomidou.mybatisplus.extension.plugins.pagination.Page;
import com.baomidou.mybatisplus.extension.service.impl.ServiceImpl;
import com.example.entity.response.GetRestaurantAndDishResponse;
import com.example.entity.response.GetRestaurantByIdResponse;
import com.example.mapper.DishMapper;
import com.example.mapper.ReviewcommentsMapper;
import com.example.pojo.Dish;
import com.example.pojo.Restaurant;
import com.example.pojo.Reviewcomments;
import com.example.service.RestaurantService;
import com.example.mapper.RestaurantMapper;
import com.example.utils.Result;
import com.example.utils.ResultCodeEnum;
import jakarta.annotation.Resource;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import java.util.ArrayList;
import java.util.HashSet;
import java.util.List;
import java.util.Set;
import java.util.stream.Collectors;

/**
 * @author 郭继业
 * @description 针对表【restaurant】的数据库操作Service实现
 * @createDate 2024-05-29 13:49:46
 */
@Service
@Transactional
public class RestaurantServiceImpl extends ServiceImpl<RestaurantMapper, Restaurant>
        implements RestaurantService {

    @Resource
    private RestaurantMapper restaurantMapper;
    @Resource
    private DishMapper dishMapper;
    @Resource
    private ReviewcommentsMapper reviewcommentsMapper;

    @Override
    public Result<?> getRestaurantPageList(int pageNum, int pageSize) {
        Page<Restaurant> page = new Page<>(pageNum, pageSize);
        Page<Restaurant> restaurantPage = restaurantMapper.selectPage(page, null);
        if (restaurantPage != null) {
            return Result.ok(restaurantPage);
        }
        return Result.build(null, ResultCodeEnum.FAIL);
    }

    @Override
    public Result<?> getRestaurantById(Integer restaurantId) {
       LambdaQueryWrapper<Restaurant> queryWrapper = new LambdaQueryWrapper<>();
        queryWrapper.eq(Restaurant::getId, restaurantId);
        Restaurant restaurant1 = restaurantMapper.selectOne(queryWrapper);

        // 获取该商家的所有评论 用来计算商家的评分
        List<Reviewcomments> reviewcomments = reviewcommentsMapper.selectList(new LambdaQueryWrapper<Reviewcomments>()
                .eq(Reviewcomments::getRestaurantid, restaurantId));

            // 计算商家的评分
            double rating = reviewcomments.stream()
                    .mapToDouble(Reviewcomments::getRating)
                    .average()
                    .orElse(0.0);
            // 设置商家的评分
            restaurant1.setRating(rating);
            restaurantMapper.updateById(restaurant1);



        Restaurant restaurant = restaurantMapper.selectOne(queryWrapper);
        if (restaurant != null) {
            GetRestaurantByIdResponse response = new GetRestaurantByIdResponse();
            response.setName(restaurant.getName());
            response.setAddress(restaurant.getAddress());
            response.setContactName(restaurant.getContactName());
            response.setContactPhone(restaurant.getContactPhone());
            response.setDescription(restaurant.getDescription());
            response.setOpeningHours(restaurant.getOpeningHours());
            response.setStatus(restaurant.getStatus());
            response.setWebsite(restaurant.getWebsite());
            response.setImageUrl(restaurant.getImageUrl());
            response.setEmail(restaurant.getEmail());
            response.setRating(restaurant.getRating());
            response.setDeliveryFees(restaurant.getDeliveryFees());
            return Result.ok(response);
        }
        return Result.build(null, 406, "没有该餐馆");
    }




    @Override
    public Result<?> getRestaurantSearch(String search) {
        // 查询商家名称 模糊查询
        LambdaQueryWrapper<Restaurant> restaurantLambdaQueryWrapper = new LambdaQueryWrapper<>();
        restaurantLambdaQueryWrapper.like(Restaurant::getName, search);
        List<Restaurant> restaurants = restaurantMapper.selectList(restaurantLambdaQueryWrapper);

        List<GetRestaurantAndDishResponse> list = new ArrayList<>(restaurants.stream().map(restaurant -> {
            GetRestaurantAndDishResponse response = new GetRestaurantAndDishResponse();
            response.setId(restaurant.getId());
            response.setName(restaurant.getName());
            response.setDescription(restaurant.getDescription());
            response.setOpeningHours(restaurant.getOpeningHours());
            response.setStatus(restaurant.getStatus());
            response.setImageUrl(restaurant.getImageUrl());
            response.setRating(restaurant.getRating());
            response.setDeliveryFees(restaurant.getDeliveryFees());
            response.setRestaurantCategoryId(restaurant.getRestaurantCategoryId());
            response.setDishList(dishMapper.selectByRestaurantId(restaurant.getId()));
            return response;
        }).collect(Collectors.toList()));

        // 查询商家的商品 模糊查询
        LambdaQueryWrapper<Dish> dishQueryWrapper = new LambdaQueryWrapper<>();
        dishQueryWrapper.like(Dish::getName, search);
        List<Dish> dishList = dishMapper.selectList(dishQueryWrapper);

        if (dishList != null) {
            // 创建HashSet用于存储list中已有的餐厅ID
            Set<Integer> existingRestaurantIds = list.stream().map(GetRestaurantAndDishResponse::getId).collect(Collectors.toSet());

            dishList.forEach(dish -> {
                List<Restaurant> selectByRestaurantId = restaurantMapper.selectByRestaurantId(dish.getRestaurantId());
                if (selectByRestaurantId != null) {
                    List<GetRestaurantAndDishResponse> uniqueResponses = selectByRestaurantId.stream()
                            .map(restaurant -> {
                                GetRestaurantAndDishResponse response = new GetRestaurantAndDishResponse();
                                response.setId(restaurant.getId());
                                response.setName(restaurant.getName());
                                response.setDescription(restaurant.getDescription());
                                response.setOpeningHours(restaurant.getOpeningHours());
                                response.setStatus(restaurant.getStatus());
                                response.setImageUrl(restaurant.getImageUrl());
                                response.setRating(restaurant.getRating());
                                response.setDeliveryFees(restaurant.getDeliveryFees());
                                response.setRestaurantCategoryId(restaurant.getRestaurantCategoryId());
                                response.setDishList(dishMapper.selectByRestaurantId(restaurant.getId()));
                                return response;
                            })
                            // 过滤掉与list中已存在ID重复的条目
                            .filter(response -> existingRestaurantIds.add(response.getId()))
                            .toList();

                    // 向list中添加去重后的数据
                    list.addAll(uniqueResponses);
                }
            });
        }

        return Result.ok(list);
    }
}








