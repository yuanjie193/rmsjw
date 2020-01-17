package com.itdr.pojo;

import java.util.Date;

public class GoodsType {
   private Integer  goods_type_id;
   private String goods_type_name;
   private Integer goods_type_fid;
   private Date creat_time;
   private Date update_time;

    public Integer getGoods_type_id() {
        return goods_type_id;
    }

    public void setGoods_type_id(Integer goods_type_id) {
        this.goods_type_id = goods_type_id;
    }

    public String getGoods_type_name() {
        return goods_type_name;
    }

    public void setGoods_type_name(String goods_type_name) {
        this.goods_type_name = goods_type_name;
    }

    public Integer getGoods_type_fid() {
        return goods_type_fid;
    }

    public void setGoods_type_fid(Integer goods_type_fid) {
        this.goods_type_fid = goods_type_fid;
    }

    public Date getCreat_time() {
        return creat_time;
    }

    public void setCreat_time(Date creat_time) {
        this.creat_time = creat_time;
    }

    public Date getUpdate_time() {
        return update_time;
    }

    public void setUpdate_time(Date update_time) {
        this.update_time = update_time;
    }
}
