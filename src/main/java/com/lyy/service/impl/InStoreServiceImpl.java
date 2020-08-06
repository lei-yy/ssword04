package com.lyy.service.impl;

import com.github.pagehelper.PageHelper;
import com.github.pagehelper.PageInfo;
import com.lyy.dao.InStoreMapper;
import com.lyy.pojo.InStore;
import com.lyy.pojo.Store;
import com.lyy.service.InStoreService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.HashMap;
import java.util.List;

/**
 * @program: ssword04
 * @description
 * @author: lyy
 * @create: 2020-08-03 15:35
 **/
@Service
public class InStoreServiceImpl implements InStoreService {
    @Autowired
    InStoreMapper dao;

    @Override
    public HashMap selectByEmpIdInStore(InStore inStore,int n) {
        HashMap<String,Object> map=new HashMap<>();
        PageHelper.startPage(inStore.getPage(),inStore.getRow());
        List<InStore> instoreList=dao.selectByEmpIdInStore(n);
        PageInfo<InStore> pageInfo=new PageInfo<>(instoreList);
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
    public int deleteByPrimaryKey(Long inId) {
        return dao.deleteByPrimaryKey(inId);
    }

    @Override
    public InStore selectByPrimaryKey(Long inId) {
        return dao.selectByPrimaryKey(inId);
    }

    @Override
    public int updateByPrimaryKeySelective(InStore record) {
        return dao.updateByPrimaryKeySelective(record);
    }

    @Override
    public int insert(InStore record) {
        return dao.insert(record);
    }

}
