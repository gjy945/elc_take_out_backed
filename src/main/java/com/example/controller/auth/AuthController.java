package com.example.controller.auth;

import cn.binarywang.wx.miniapp.api.WxMaService;
import cn.binarywang.wx.miniapp.bean.WxMaJscode2SessionResult;
import com.baomidou.mybatisplus.core.conditions.query.LambdaQueryWrapper;
import com.example.entity.requset.DeleteUserRequest;
import com.example.entity.requset.LoginRequest;
import com.example.entity.requset.RegisterRequest;
import com.example.pojo.User;
import com.example.service.UserService;
import com.example.utils.MD5Util;
import com.example.utils.Result;
import com.example.utils.ResultCodeEnum;
import jakarta.annotation.Resource;
import jakarta.servlet.http.HttpServletResponse;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.*;

/**
 * 用户相关
 */
@RestController
@CrossOrigin
@RequestMapping("auth")
public class AuthController {

    @Resource
    UserService userService;

    /**
     * 登录
     */
    @Resource
    private WxMaService wxMaService;

    @PostMapping("wLogin")
    public Result<?> login(@RequestParam(name = "code", required = true) String code,
                                HttpServletResponse response) {
        try {
            WxMaJscode2SessionResult sessionInfo = wxMaService.getUserService().getSessionInfo(code);

            //其他逻辑：判断用户是否存在，添加或修改
            String openid = sessionInfo.getOpenid();
            String sessionKey = sessionInfo.getSessionKey();
            return userService.login(openid,response);
        } catch (Exception ex) {
            ex.printStackTrace();
            return Result.build(null,400,"登录失败");
        }
    }

}
