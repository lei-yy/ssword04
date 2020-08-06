package com.lyy.service.impl;

import com.github.pagehelper.PageHelper;
import com.github.pagehelper.PageInfo;
import com.lyy.dao.StoreMapper;
import com.lyy.pojo.Store;
import com.lyy.service.StoreService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import java.util.HashMap;
import java.util.List;

/**
 * @program: ssword04
 * @description
 * @author: lyy
 * @create: 2020-08-03 20:02
 **/
@Service
public class StoreServiceImpl implements StoreService {
    @Autowired
    StoreMapper dao;
    @Override
    public int updateByPrimaryKeySelective(Store record) {
        return dao.updateByPrimaryKeySelective(record);
    }

    @Override
    public Store selectByInId(int inId) {
        return dao.selectByInId(inId);
    }

    @Override
    public HashMap selectAllStore(Store store) {

        HashMap<String,Object> map=new HashMap<>();
        PageHelper.startPage(store.getPage(),store.getRow());
        List<Store> storeList=dao.selectAllStore();
        PageInfo<Store> pageInfo=new PageInfo<>(storeList);
        map.put("list",pageInfo.getList());
        map.put("nowPage",pageInfo.getPageNum());
        map.put("total",pageInfo.getTotal());
        map.put("pageSize",pageInfo.getPages());
        map.put("prePage",pageInfo.getPrePage());
        map.put("nextPage",pageInfo.getNextPage());
        map.put("firstPage",pageInfo.getFirstPage());
        map.put("endPage",pageInfo.getLastPage());
        return map;
    }

    @Override
    public Store selectByPrimaryKey(Integer storeId) {
        return dao.selectByPrimaryKey(storeId);
    }
}
