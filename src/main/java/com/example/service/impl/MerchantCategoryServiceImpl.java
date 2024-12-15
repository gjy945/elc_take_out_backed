package com.example.service.impl;

import com.baomidou.mybatisplus.extension.service.impl.ServiceImpl;
import com.example.pojo.MerchantCategory;
import com.example.service.MerchantCategoryService;
import com.example.mapper.MerchantCategoryMapper;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

/**
* @author 郭继业
* @description 针对表【merchant_category(商家专属分类表)】的数据库操作Service实现
* @createDate 2024-06-06 03:00:32
*/
@Service
@Transactional
public class MerchantCategoryServiceImpl extends ServiceImpl<MerchantCategoryMapper, MerchantCategory>
    implements MerchantCategoryService{

}




