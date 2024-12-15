package com.example.controller.category;

import com.example.service.CategoryService;
import com.example.utils.Result;
import jakarta.annotation.Resource;
import org.springframework.web.bind.annotation.*;

@RestController
@CrossOrigin
@RequestMapping("category")
public class CategoryController {
    @Resource
    private CategoryService categoryService;

    /**
     * 根据商家id,获取对应的餐品分类列表
     * @param restaurantId 商家id
     * @return 餐品分类列表
     */
    @PostMapping("getCategoryListByRestaurantId")
    public Result<?> getCategoryListByRestaurantId(Integer restaurantId) {
        return categoryService.getCategoryListByRestaurantId(restaurantId);
    }
}
