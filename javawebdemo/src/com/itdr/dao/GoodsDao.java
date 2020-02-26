package com.itdr.dao;

import com.itdr.pojo.Goods;
import com.itdr.utils.C3p0Util;
import org.apache.commons.dbutils.QueryRunner;
import org.apache.commons.dbutils.handlers.BeanHandler;
import org.apache.commons.dbutils.handlers.BeanListHandler;

import java.sql.SQLException;
import java.util.List;

public class GoodsDao {
    public List<Goods> selectALLGoods(){
        QueryRunner queryRunner =new QueryRunner(C3p0Util.getCom());
        List<Goods> query = null;
        String sql = "select goods_id,goods_type,goods_name,goods_price," +
                "goods_description,goods_discount,goods_number,goods_color,creat_time,update_time from goods ";
        try {
           query = queryRunner.query(sql, new BeanListHandler<Goods>(Goods.class));
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return query;
    }
    public Goods selectById(int i ){
        QueryRunner queryRunner =new QueryRunner(C3p0Util.getCom());
         Goods query = null;
        String sql = "select goods_id,goods_type,goods_name,goods_price," +
                "goods_description,goods_discount,goods_number,goods_color,creat_time,update_time from goods " +
                "where goods_id = ?";
        try {
            query = queryRunner.query(sql, new BeanHandler<Goods>(Goods.class),i);
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return query;
    }
    //商品下架
    public int  updateById(int i,int update ){
        QueryRunner queryRunner =new QueryRunner(C3p0Util.getCom());
        int a = 0;
        String sql = "update goods set goods_type=? where goods_id = ? ";
        try {
            a = queryRunner.update(sql,update,i);
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return a;
    }

//    模糊查询
    public List<Goods>  selectByName(String i ){
        QueryRunner queryRunner =new QueryRunner(C3p0Util.getCom());
        List<Goods> query = null;
        String sql = "select goods_id,goods_type,goods_name,goods_price," +
                "goods_description,goods_discount,goods_number,goods_color,creat_time,update_time from goods " +
                "where goods_name like ?";
        try {
            String s = "%"+i+"%";
             query = queryRunner.query(sql, new BeanListHandler<Goods>(Goods.class), s);
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return query;
    }

    public int deleteGoods(int i) {
        QueryRunner queryRunner =new QueryRunner(C3p0Util.getCom());
        int a = 0;
        String sql = "delete from goods where goods_id = ?";
        try {
            a = queryRunner.update(sql,i);
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return a;
    }
}
