package com.lyy.controller;

import com.lyy.pojo.*;
import com.lyy.service.*;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.HashMap;
import java.util.List;

/**
 * @program: ssword04
 * @description
 * @author: lyy
 * @create: 2020-08-04 14:55
 **/
@Controller
@RequestMapping("sc")
public class StoreController {
    @Autowired
    StoreService storeService;
    @Autowired
    GoodsTypeService goodsTypeService;
    @Autowired
    ProducerService producerService;
    @Autowired
    GoodsService goodsService;
    @Autowired
    InStoreService inStoreService;
    @RequestMapping("quickInStore.do")
    public String quickInStore(){
        return "quickInStore";
    }
    @RequestMapping("addStore.do")
    public String addStore(){
        return "addStore";
    }
    @RequestMapping("addGoods.do")
    public String addGoods(){
        return "addGoods";
    }
    @RequestMapping("selectAllStore.ajax")
    @ResponseBody
    public HashMap selectAllStore(){
        List<Store> list=storeService.selectAllStore();
        HashMap<String,Object> map=new HashMap<>();
        map.put("list",list);
        List<GoodsType> goodsTypeList = goodsTypeService.selectAllGoodsType();
        List<Producer> producerList = producerService.selectAllProducer();
        map.put("goodsTypeList",goodsTypeList);
        map.put("producerList",producerList);
        return map;
    }
    @RequestMapping("addInStore.ajax")
    public String addInStore(Store store){
        Store store1 = storeService.selectByPrimaryKey(store.getStoreId());
        store.setNum(store1.getNum()+store.getNum());
        storeService.updateByPrimaryKeySelective(store);
        return "quickInStore";
    }
    @RequestMapping("addInGoods.ajax")
    public void selectGoodsTypeAndProducer(Goods goods) throws ParseException {
        //自动增加入库信息
        //n代表empId,通过session拿
        System.err.println("====================="+goods);
        goodsService.insert(goods);

        long n=1;
        InStore inStore=new InStore();
        inStore.setEmpId(n);
        inStore.setGoodsId(goods.getGoodsId());
        inStore.setGoodsName(goods.getName());
        inStore.setInDate(getDate(new Date()));
        inStore.setInNum(goods.getgNum().longValue());
        inStoreService.insert(inStore);

    }
    public String getDate(Date date){
        SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd");
        String time=sdf.format(date);
        return time;
    }
}
