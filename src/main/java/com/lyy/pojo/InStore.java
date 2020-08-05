package com.lyy.pojo;

import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.Date;

public class InStore {
    private Long inId;

    private String goodsId;

    private Long empId;
    private String goodsName;

    private Date inDate;

    private Long inNum;
    @Override
    public String toString() {
        return "InStore{" +
                "inId=" + inId +
                ", goodsId='" + goodsId + '\'' +
                ", empId=" + empId +
                ", goodsName='" + goodsName + '\'' +
                ", inDate=" + inDate +
                ", inNum=" + inNum +
                '}';
    }

    public String getGoodsName() {
        return goodsName;
    }

    public void setGoodsName(String goodsName) {
        this.goodsName = goodsName;
    }

    public Long getInId() {
        return inId;
    }

    public void setInId(Long inId) {
        this.inId = inId;
    }

    public String getGoodsId() {
        return goodsId;
    }

    public void setGoodsId(String goodsId) {
        this.goodsId = goodsId;
    }

    public Long getEmpId() {
        return empId;
    }

    public void setEmpId(Long empId) {
        this.empId = empId;
    }

    public String getInDate() {
        SimpleDateFormat sdf=new SimpleDateFormat("yyyy-MM-dd");

        return sdf.format(this.inDate);
    }

    public void setInDate(String inDate) throws ParseException {
        if(inDate!=null) {
            SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd");
            this.inDate = sdf.parse(inDate);
        }else {
            this.inDate = new Date();

        }
    }

    public Long getInNum() {
        return inNum;
    }

    public void setInNum(Long inNum) {
        this.inNum = inNum;
    }
}