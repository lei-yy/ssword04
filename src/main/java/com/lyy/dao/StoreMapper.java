package com.lyy.dao;

import com.lyy.pojo.Goods;
import com.lyy.pojo.Store;
import org.apache.ibatis.annotations.Param;

import java.util.List;

public interface StoreMapper {
    int deleteByPrimaryKey(Integer storeId);

    int insert(Store record);

    int insertSelective(Store record);

    Store selectByPrimaryKey(Integer storeId);

    int updateByPrimaryKeySelective(Store record);

    int updateByPrimaryKey(Store record);

    Store selectByInId(@Param("inId") int inId);
    List<Store> selectAllStore();
}