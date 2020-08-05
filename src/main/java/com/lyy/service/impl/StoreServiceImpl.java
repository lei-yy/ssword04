package com.lyy.service.impl;

import com.lyy.dao.StoreMapper;
import com.lyy.pojo.Store;
import com.lyy.service.StoreService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

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
    public List<Store> selectAllStore() {
        return dao.selectAllStore();
    }

    @Override
    public Store selectByPrimaryKey(Integer storeId) {
        return dao.selectByPrimaryKey(storeId);
    }
}
