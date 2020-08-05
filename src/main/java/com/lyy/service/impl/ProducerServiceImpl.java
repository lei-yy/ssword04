package com.lyy.service.impl;

import com.lyy.dao.ProducerMapper;
import com.lyy.pojo.Producer;
import com.lyy.service.ProducerService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;

/**
 * @program: ssword04
 * @description
 * @author: lyy
 * @create: 2020-08-05 13:27
 **/
@Service
public class ProducerServiceImpl implements ProducerService {
    @Autowired
    ProducerMapper dao;
    @Override
    public List<Producer> selectAllProducer() {
        return dao.selectAllProducer();
    }
}
