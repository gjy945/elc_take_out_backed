package com.example.config;

import com.example.interceptors.LoginProtectedInterceptor;
import jakarta.annotation.Resource;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.context.annotation.Configuration;
import org.springframework.web.servlet.config.annotation.InterceptorRegistry;
import org.springframework.web.servlet.config.annotation.WebMvcConfigurer;

@Configuration
public class WebMVCConfig implements WebMvcConfigurer {

    @Resource
    private LoginProtectedInterceptor loginProtectedInterceptor;

    //添加拦截器 登录拦截
    @Override
    public void addInterceptors(InterceptorRegistry registry) {
        registry.addInterceptor(loginProtectedInterceptor)
                .addPathPatterns("/**")
                .excludePathPatterns("/auth/*");
    }
}
