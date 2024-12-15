package com.example.service.impl;

import com.baomidou.mybatisplus.core.conditions.query.LambdaQueryWrapper;
import com.baomidou.mybatisplus.extension.service.impl.ServiceImpl;
import com.example.entity.requset.AddReviewCommentsRequest;
import com.example.entity.response.GetReviewComments;
import com.example.entity.response.UserLoginAndRegisterResponse;
import com.example.mapper.UserMapper;
import com.example.pojo.Reviewcomments;
import com.example.pojo.User;
import com.example.service.ReviewcommentsService;
import com.example.mapper.ReviewcommentsMapper;
import com.example.utils.Result;
import jakarta.annotation.Resource;
import org.springframework.stereotype.Service;

import java.time.LocalDateTime;
import java.util.List;

/**
 * @author 郭继业
 * @description 针对表【reviewcomments】的数据库操作Service实现
 * @createDate 2024-07-02 01:10:53
 */
@Service
public class ReviewcommentsServiceImpl extends ServiceImpl<ReviewcommentsMapper, Reviewcomments>
        implements ReviewcommentsService {

    @Resource
    private ReviewcommentsMapper reviewcommentsMapper;

    @Resource
    private UserMapper userMapper;

    @Override
    public Result<?> addReview(AddReviewCommentsRequest addReviewCommentsRequest) {
        Reviewcomments reviewcomments = new Reviewcomments();
        reviewcomments.setUserid(addReviewCommentsRequest.getUserId());
        reviewcomments.setRestaurantid(addReviewCommentsRequest.getRestaurantId());
        reviewcomments.setRating(addReviewCommentsRequest.getRating());
        reviewcomments.setCommentcontent(addReviewCommentsRequest.getCommentcontent());
        reviewcomments.setCommenttime(LocalDateTime.now());
        if (reviewcommentsMapper.insert(reviewcomments) > 0) {
            return Result.ok(null);
        }
        return null;
    }

    @Override
    public Result<?> getReview(Integer restaurantId) {
        List<Reviewcomments> reviewcomments = reviewcommentsMapper.selectList(new LambdaQueryWrapper<Reviewcomments>().eq(Reviewcomments::getRestaurantid, restaurantId));
        List<GetReviewComments> list = reviewcomments.stream().map(reviewcomment -> {
            GetReviewComments getReviewComments = new GetReviewComments();
            getReviewComments.setId(reviewcomment.getId());
            getReviewComments.setUserid(reviewcomment.getUserid());
            getReviewComments.setRestaurantid(reviewcomment.getRestaurantid());
            getReviewComments.setCommentcontent(reviewcomment.getCommentcontent());
            getReviewComments.setCommenttime(reviewcomment.getCommenttime());
            getReviewComments.setRating(reviewcomment.getRating());

            User user = userMapper.selectById(reviewcomment.getUserid());
            UserLoginAndRegisterResponse userLoginAndRegisterResponse = new UserLoginAndRegisterResponse();
            userLoginAndRegisterResponse.setId(user.getId());
            userLoginAndRegisterResponse.setUsername(user.getUsername());
            userLoginAndRegisterResponse.setNickname(user.getNickname());
            userLoginAndRegisterResponse.setGender(user.getGender());
            userLoginAndRegisterResponse.setEmail(user.getEmail());
            userLoginAndRegisterResponse.setPhone(user.getPhone());
            userLoginAndRegisterResponse.setAddress(user.getAddress());
            userLoginAndRegisterResponse.setAvatar(user.getAvatar());
            userLoginAndRegisterResponse.setBackImg(user.getBackImg());

            getReviewComments.setUser(userLoginAndRegisterResponse);
            return getReviewComments;
        }).toList();
        if (!list.isEmpty()) {
            return Result.ok(list);
        }
        return null;
    }
}




