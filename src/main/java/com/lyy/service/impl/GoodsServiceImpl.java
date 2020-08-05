package com.lyy.service.impl;

import com.lyy.dao.GoodsMapper;
import com.lyy.pojo.Goods;
import com.lyy.service.GoodsService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;

/**
 * @program: ssword04
 * @description
 * @author: lyy
 * @create: 2020-08-03 14:59
 **/
@Service
public class GoodsServiceImpl implements GoodsService {
    @Autowired
    GoodsMapper dao;

    @Override
    public List<Goods> selectAllGoods() {

        return dao.selectAllGoods();
    }

    @Override
    public int insert(Goods record) {
        return dao.insert(record);
    }
}
