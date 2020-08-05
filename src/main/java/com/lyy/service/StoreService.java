package com.lyy.service;

import com.lyy.pojo.Store;

import java.util.List;

/**
 * @program: ssword04
 * @description
 * @author: lyy
 * @create: 2020-08-03 20:02
 **/
public interface StoreService {
    int updateByPrimaryKeySelective(Store record);
    Store selectByInId(int inId);;
    List<Store> selectAllStore();
    Store selectByPrimaryKey(Integer storeId);
}
