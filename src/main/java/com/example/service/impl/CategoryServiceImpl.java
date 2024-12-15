package com.example.service.impl;

import com.baomidou.mybatisplus.extension.service.impl.ServiceImpl;
import com.example.entity.response.GetCategoryListResponse;
import com.example.pojo.Category;
import com.example.service.CategoryService;
import com.example.mapper.CategoryMapper;
import com.example.utils.Result;
import jakarta.annotation.Resource;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import java.util.List;

/**
 * @author 郭继业
 * @description 针对表【category(商品分类表)】的数据库操作Service实现
 * @createDate 2024-06-06 03:00:32
 */
@Service
@Transactional
public class CategoryServiceImpl extends ServiceImpl<CategoryMapper, Category>
        implements CategoryService {
    @Resource
    private CategoryMapper categoryMapper;

    @Override
    public Result<?> getCategoryListByRestaurantId(Integer restaurantId) {
        List<Category> categoryListByRestaurantId = categoryMapper.getCategoryListByRestaurantId(restaurantId);
        List<GetCategoryListResponse> list = categoryListByRestaurantId.stream().map(category -> {
            GetCategoryListResponse getCategoryListResponse = new GetCategoryListResponse();
            getCategoryListResponse.setName(category.getName());
            getCategoryListResponse.setDescription(category.getDescription());
            getCategoryListResponse.setCategoryId(category.getCategoryId());
            getCategoryListResponse.setRestaurantId(category.getRestaurantId());
            return getCategoryListResponse;
        }).toList();
        if (list.isEmpty()){
            return Result.build(null, 400, "该商家没有分类");
        }
        return Result.ok(list);
    }
}




