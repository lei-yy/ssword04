package com.lyy.controller;

import com.lyy.pojo.InStore;
import com.lyy.pojo.Store;
import com.lyy.service.InStoreService;
import com.lyy.service.StoreService;
import org.apache.ibatis.annotations.Param;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import java.util.List;

/**
 * @program: ssword04
 * @description
 * @author: lyy
 * @create: 2020-08-03 15:37
 **/
@Controller
@RequestMapping("isc")
public class InStoreController {
    @Autowired
    InStoreService service;
    @Autowired
    StoreService storeService;

    @RequestMapping("inStore.do")
    public String inStore() {
        return "in_store";
    }

    @RequestMapping(value = "selectByEmpIdInStore.ajax")
    @ResponseBody
    public List selectAllInStore() {
        int n=1;
        List<InStore> list = service.selectByEmpIdInStore(n);
        System.err.println("++++++++++"+list);
        return list;
    }
    @RequestMapping(value = "selectAllStore.ajax")
    @ResponseBody
    public List selectAllStore() {
        List<Store> list = storeService.selectAllStore();
        System.err.println("++++++++++"+list);
        return list;
    }
    @RequestMapping("deleteInStoreByInid.ajax")
    @ResponseBody
    public int deleteInStoreByInid(String inId, String inNum) {
        Store store = storeService.selectByInId(Integer.parseInt(inId));
        int n = service.deleteByPrimaryKey(Long.parseLong(inId));
        if (n > 0) {
            if (store != null) {
                Store store1 = new Store();
                store1.setStoreName(store.getStoreName());
                store1.setNum(store.getNum() - Integer.parseInt(inNum));
                System.err.println("++++++++++++++++++" + store1);
                storeService.updateByPrimaryKeySelective(store1);
            }
        }

        return n;
    }

    @RequestMapping("updateInstore.ajax")
    @ResponseBody
    public int updateInstore(InStore inStore) {

        //查询入库表
        InStore inStore1 = service.selectByPrimaryKey(inStore.getInId());
        //得到修改前后的数量差
        Long m = inStore.getInNum() - inStore1.getInNum();

        System.err.println("================"+m);
        //修改入库
        int n = service.updateByPrimaryKeySelective(inStore);
        if (n > 0) {
            Long inId = inStore.getInId();
            Store store = storeService.selectByInId(Integer.parseInt(String.valueOf(inId)));
            store.setNum(store.getNum() + m);
            storeService.updateByPrimaryKeySelective(store);
        }
        return n;
    }
}
