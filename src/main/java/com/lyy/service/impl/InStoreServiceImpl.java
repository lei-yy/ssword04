package com.lyy.service.impl;

import com.lyy.dao.InStoreMapper;
import com.lyy.pojo.InStore;
import com.lyy.service.InStoreService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

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
    public List<InStore> selectByEmpIdInStore(int n) {
        return dao.selectByEmpIdInStore(n);
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
