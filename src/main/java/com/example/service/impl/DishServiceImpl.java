package com.example.service.impl;

import com.baomidou.mybatisplus.core.conditions.query.LambdaQueryWrapper;
import com.baomidou.mybatisplus.extension.service.impl.ServiceImpl;
import com.example.entity.response.GetDishResponse;
import com.example.pojo.Dish;
import com.example.service.DishService;
import com.example.mapper.DishMapper;
import com.example.utils.Result;
import com.example.utils.ResultCodeEnum;
import jakarta.annotation.Resource;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import java.util.List;

/**
 * @author 郭继业
 * @description 针对表【dish】的数据库操作Service实现
 * @createDate 2024-05-29 13:49:46
 */
@Service
@Transactional
public class DishServiceImpl extends ServiceImpl<DishMapper, Dish>
        implements DishService {
    @Resource
    private DishMapper dishMapper;

    @Override
    public Result<?> getDish(Integer restaurantId, Integer categoryId) {
        LambdaQueryWrapper<Dish> queryWrapper = new LambdaQueryWrapper<>();
        queryWrapper.eq(Dish::getRestaurantId, restaurantId)
                .eq(Dish::getCategoryId, categoryId);
        List<Dish> dishList = dishMapper.selectList(queryWrapper);
        List<GetDishResponse> list = dishList.stream().map(dish -> {
            GetDishResponse getDishResponse = new GetDishResponse();
            getDishResponse.setId(dish.getId());
            getDishResponse.setRestaurantId(dish.getRestaurantId());
            getDishResponse.setCategoryId(dish.getCategoryId());
            getDishResponse.setName(dish.getName());
            getDishResponse.setPrice(dish.getPrice());
            getDishResponse.setUnit(dish.getUnit());
            getDishResponse.setDescription(dish.getDescription());
            getDishResponse.setImageUrl(dish.getImageUrl());
            getDishResponse.setIsAvailable(dish.getIsAvailable());
            getDishResponse.setQuantity(dish.getQuantity());
            return getDishResponse;
        }).toList();
        if (list.isEmpty()) {
            return Result.build(list, 401, "没有该分类的菜品");
        }
        return Result.ok(list);
    }
}




