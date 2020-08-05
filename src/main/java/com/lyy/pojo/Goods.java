package com.lyy.pojo;

import java.math.BigDecimal;
import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.Date;

public class Goods {
    private String goodsId;

    private String name;

    private Integer typeId;
    private Integer gNum;

    public Integer getgNum() {
        return gNum;
    }

    public void setgNum(Integer gNum) {
        this.gNum = gNum;
    }

    private Integer producerId;

    private BigDecimal cost;

    private Integer storeId;

    private Date produceDate;

    private Date expireDate;


    private Integer state;

    public String getGoodsId() {
        return goodsId;
    }

    public void setGoodsId(String goodsId) {
        this.goodsId = goodsId;
    }

    public String getName() {
        return name;
    }

    public void setName(String name) {
        this.name = name;
    }

    public Integer getTypeId() {
        return typeId;
    }

    public void setTypeId(Integer typeId) {
        this.typeId = typeId;
    }

    public Integer getProducerId() {
        return producerId;
    }

    public void setProducerId(Integer producerId) {
        this.producerId = producerId;
    }

    public BigDecimal getCost() {
        return cost;
    }

    public void setCost(BigDecimal cost) {
        this.cost = cost;
    }

    public Integer getStoreId() {
        return storeId;
    }

    public void setStoreId(Integer storeId) {
        this.storeId = storeId;
    }

    public String getProduceDate() {

        SimpleDateFormat sdf=new SimpleDateFormat("yyyy-MM-dd");

        return sdf.format(this.produceDate);
    }

    public void setProduceDate(String produceDate) throws ParseException {

        if(produceDate!=null) {
            SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd");
            this.produceDate = sdf.parse(produceDate);
        }else {
            this.produceDate = new Date();

        }
    }

    public String getExpireDate() {
        SimpleDateFormat sdf=new SimpleDateFormat("yyyy-MM-dd");

        return sdf.format(this.expireDate);
    }

    public void setExpireDate(String expireDate) throws ParseException {

        if(expireDate!=null) {
            SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd");
            this.expireDate = sdf.parse(expireDate);
        }else {
            this.expireDate = new Date();

        }
    }

    public Integer getState() {
        return state;
    }

    public void setState(Integer state) {
        this.state = state;
    }

    @Override
    public String toString() {
        return "Goods{" +
                "goodsId='" + goodsId + '\'' +
                ", name='" + name + '\'' +
                ", typeId=" + typeId +
                ", producerId=" + producerId +
                ", cost=" + cost +
                ", storeId=" + storeId +
                ", produceDate=" + produceDate +
                ", expireDate=" + expireDate +
                ", state=" + state +
                '}';
    }
}