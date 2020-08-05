package com.lyy.dao;

import com.lyy.pojo.InStore;

import java.util.List;

public interface InStoreMapper {
    int deleteByPrimaryKey(Long inId);

    int insert(InStore record);

    int insertSelective(InStore record);

    InStore selectByPrimaryKey(Long inId);

    List<InStore> selectByEmpIdInStore(int n);
    int updateByPrimaryKeySelective(InStore record);

    int updateByPrimaryKey(InStore record);
}