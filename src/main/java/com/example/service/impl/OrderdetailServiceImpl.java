package com.example.service.impl;

import com.baomidou.mybatisplus.extension.service.impl.ServiceImpl;
import com.example.pojo.Orderdetail;
import com.example.service.OrderdetailService;
import com.example.mapper.OrderdetailMapper;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

/**
* @author 郭继业
* @description 针对表【orderdetail】的数据库操作Service实现
* @createDate 2024-06-27 17:06:19
*/
@Service
@Transactional
public class OrderdetailServiceImpl extends ServiceImpl<OrderdetailMapper, Orderdetail>
    implements OrderdetailService{

}




