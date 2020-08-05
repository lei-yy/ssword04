package com.lyy.controller;

import com.lyy.pojo.Goods;
import com.lyy.service.GoodsService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.RequestMapping;

import java.util.List;

/**
 * @program: ssword04
 * @description
 * @author: lyy
 * @create: 2020-08-03 14:58
 **/
@Controller
@RequestMapping("gc")
public class GoodsController {
    @Autowired
    GoodsService service;

    @RequestMapping("selectAllGoods.ajax")
    public List<Goods> selectAllGoods(){
        List<Goods> goodsList = service.selectAllGoods();

        return goodsList;
    }
}
