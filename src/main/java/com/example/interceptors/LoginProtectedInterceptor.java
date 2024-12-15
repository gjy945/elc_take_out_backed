package com.example.interceptors;

import com.example.utils.JwtHelper;
import com.example.utils.Result;
import com.example.utils.ResultCodeEnum;
import com.fasterxml.jackson.databind.ObjectMapper;
import com.fasterxml.jackson.databind.json.JsonMapper;
import jakarta.annotation.Resource;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import org.aspectj.weaver.ast.Var;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Component;
import org.springframework.web.servlet.HandlerInterceptor;

@Component
public class LoginProtectedInterceptor implements HandlerInterceptor {

    @Resource
    private JwtHelper jwtHelper;

    @Override
    public boolean preHandle(HttpServletRequest request, HttpServletResponse response, Object handler) throws Exception {
        //请求头获取token
        String token = request.getHeader("token");
        //检查是否有效
        boolean expiration = jwtHelper.isExpiration(token);
        //有效放行
        if (!expiration) {
            return true;
        }
        //无效返回未登录 转json
        Result<?> result = Result.build(null, ResultCodeEnum.NOTLOGIN);
        ObjectMapper objectMapper = new ObjectMapper();
        String json = objectMapper.writeValueAsString(result);
        response.getWriter().print(json);
        System.out.println("拦截器拦截");
        return false;
    }
}
