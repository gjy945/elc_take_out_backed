package com.example.config;

import cn.binarywang.wx.miniapp.api.WxMaService;
import cn.binarywang.wx.miniapp.api.impl.WxMaServiceImpl;
import cn.binarywang.wx.miniapp.config.WxMaConfig;
import cn.binarywang.wx.miniapp.config.impl.WxMaDefaultConfigImpl;
import org.springframework.context.annotation.Bean;
import org.springframework.context.annotation.Configuration;

@Configuration
public class WeixinMiniAppConfig {

    @Bean
    public WxMaConfig wxMaConfig() {
        WxMaDefaultConfigImpl config = new WxMaDefaultConfigImpl();
        // 配置你的微信小程序的AppID和AppSecret
        config.setAppid("wx07ad709d4f63759d");
        config.setSecret("fce28d40ae8e36069501286825089d8b");
        return config;
    }

    @Bean
    public WxMaService wxMaService(WxMaConfig wxMaConfig) {
        WxMaService service = new WxMaServiceImpl();
        service.setWxMaConfig(wxMaConfig);
        return service;
    }
}