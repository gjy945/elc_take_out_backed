package com.example.service;

import com.example.entity.requset.AddReviewCommentsRequest;
import com.example.pojo.Reviewcomments;
import com.baomidou.mybatisplus.extension.service.IService;
import com.example.utils.Result;

/**
* @author 郭继业
* @description 针对表【reviewcomments】的数据库操作Service
* @createDate 2024-07-02 01:10:53
*/
public interface ReviewcommentsService extends IService<Reviewcomments> {

    /**
     * 添加评论
     * @param addReviewCommentsRequest 评论实体
     * @return 结果
     */
    Result<?> addReview(AddReviewCommentsRequest addReviewCommentsRequest);


    /**
     * 获取评论
     * @param restaurantId 餐馆id
     * @return 结果
     */
    Result<?> getReview(Integer restaurantId);
}
