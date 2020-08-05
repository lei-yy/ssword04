package com.lyy.dao;

import com.lyy.pojo.Producer;

import java.util.List;

public interface ProducerMapper {
    int deleteByPrimaryKey(Integer producerId);

    int insert(Producer record);

    int insertSelective(Producer record);

    Producer selectByPrimaryKey(Integer producerId);

    int updateByPrimaryKeySelective(Producer record);

    int updateByPrimaryKey(Producer record);
    List<Producer> selectAllProducer();
}