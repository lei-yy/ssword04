package com.lyy.dao;

import com.lyy.pojo.Goods;

import java.util.List;

public interface GoodsMapper {
    int deleteByPrimaryKey(String goodsId);

    int insert(Goods record);

    int insertSelective(Goods record);

    Goods selectByPrimaryKey(String goodsId);

    List<Goods> selectAllGoods();

    int updateByPrimaryKeySelective(Goods record);

    int updateByPrimaryKey(Goods record);
}