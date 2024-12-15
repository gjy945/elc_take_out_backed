package com.example.controller.dish;

import com.example.service.DishService;
import com.example.utils.Result;
import jakarta.annotation.Resource;
import org.springframework.web.bind.annotation.*;

/**
 * 餐品相关
 */
@RestController
@CrossOrigin
@RequestMapping("dish")
public class DishController {
    @Resource
    private DishService dishService;


    /**
     * 根据分类获取餐品
     * @param restaurantId 商家id
     * @param categoryId 分类id
     * @return 结果
     */
    @PostMapping("getDish/{restaurantId}/{categoryId}")
    public Result<?> getDish(@PathVariable(value = "restaurantId") Integer restaurantId,
                             @PathVariable(value = "categoryId") Integer categoryId) {
        return dishService.getDish(restaurantId, categoryId);
    }
}
