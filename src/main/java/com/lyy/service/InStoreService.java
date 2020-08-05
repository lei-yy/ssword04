package com.lyy.service;

import com.lyy.pojo.InStore;

import java.util.List;

/**
 * @program: ssword04
 * @description
 * @author: lyy
 * @create: 2020-08-03 15:35
 **/
public interface InStoreService {
    List<InStore> selectByEmpIdInStore(int n);
    int deleteByPrimaryKey(Long inId);
    InStore selectByPrimaryKey(Long inId);
    int updateByPrimaryKeySelective(InStore record);
    int insert(InStore record);
}
