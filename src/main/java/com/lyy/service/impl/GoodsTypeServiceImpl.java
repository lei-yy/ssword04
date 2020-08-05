package com.lyy.service.impl;

import com.lyy.dao.GoodsTypeMapper;
import com.lyy.pojo.GoodsType;
import com.lyy.service.GoodsTypeService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;

/**
 * @program: ssword04
 * @description
 * @author: lyy
 * @create: 2020-08-05 11:28
 **/
@Service
public class GoodsTypeServiceImpl implements GoodsTypeService {

    @Autowired
    GoodsTypeMapper dao;


    @Override
    public List<GoodsType> selectAllGoodsType() {
        return dao.selectAllGoodsType();
    }
}
