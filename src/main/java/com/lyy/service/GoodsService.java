package com.lyy.service;

import com.lyy.pojo.Goods;

import java.util.List;

/**
 * @program: ssword04
 * @description
 * @author: lyy
 * @create: 2020-08-03 14:59
 **/
public interface GoodsService {
    List<Goods> selectAllGoods();
    int insert(Goods record);
}
