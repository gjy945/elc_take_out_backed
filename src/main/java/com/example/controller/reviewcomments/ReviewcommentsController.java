package com.example.controller.reviewcomments;


import com.example.entity.requset.AddReviewCommentsRequest;
import com.example.service.ReviewcommentsService;
import com.example.utils.Result;
import jakarta.annotation.Resource;
import org.springframework.web.bind.annotation.*;

//评价相关
@RestController
@CrossOrigin
@RequestMapping("reviewcomments")
public class ReviewcommentsController {
    @Resource
    private ReviewcommentsService reviewcommentsService;


    /**
     * 添加评价
     * @param addReviewCommentsRequest 评价实体
     * @return 结果
     */
    @PostMapping("addReview")
    public Result<?> addReview(@RequestBody AddReviewCommentsRequest addReviewCommentsRequest) {
        return reviewcommentsService.addReview(addReviewCommentsRequest);
    }


    /**
     * 获取评价
     * @param restaurantId 餐馆id
     * @return 结果
     */
    @PostMapping("getReview")
    public Result<?> getReview(@RequestParam Integer restaurantId) {
        return reviewcommentsService.getReview(restaurantId);
    }
}
