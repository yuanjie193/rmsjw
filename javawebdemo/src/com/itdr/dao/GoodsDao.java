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
        String sql = "select uid,goods_id,goods_type,goods_name,goods_price," +
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
        String sql = "select uid,goods_id,goods_type,goods_name,goods_price," +
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
        String sql = "select uid,goods_id,goods_type,goods_name,goods_price," +
                "goods_description,goods_discount,goods_number,goods_color,creat_time,update_time from goods " +
                "where goods_name like ? or goods_description like ?";
        try {
            String s = "%"+i+"%";
             query = queryRunner.query(sql, new BeanListHandler<Goods>(Goods.class),s,s);
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

    public int addGoods(Integer uid,String goodsname, String price, String number, String color, String discount, String description, Integer checked) {
        QueryRunner queryRunner =new QueryRunner(C3p0Util.getCom());
        int a = 0;
        String sql = "insert into goods values(?,null,?,?,null,?,?,?,?,?,now(),now())";
        try {
            a = queryRunner.update(sql,uid,checked,goodsname,price,description,discount,number,color);
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return a;
    }

    public int updateGoods(Integer uid, int goods_id, String goodsname, String price, String number, String color, String discount, String description, int checked) {
        QueryRunner queryRunner =new QueryRunner(C3p0Util.getCom());
        int a = 0;
        String sql = "update goods set uid= ?,goods_type=? ,goods_price=?,goods_description=?," +
                "goods_discount=?,goods_number=?,goods_color=?,update_time=now()"+
                " where goods_id = ? ";
        try {
            a = queryRunner.update(sql,uid,checked,price,description,discount,number,color,goods_id);
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return a;

    }

    /**
     * 对商品价格或库存进行排序
     * @param f
     * @param way
     * @return
     */

    public List<Goods> goodsSort(String f,String way) {
        QueryRunner queryRunner =new QueryRunner(C3p0Util.getCom());
        List<Goods> query = null;
        String sql = null;
        if(f.equals("goods_price")&& way.equals("asc")){
            sql = "select uid,goods_id,goods_type,goods_name,goods_price," +
                    "goods_description,goods_discount,goods_number,goods_color,creat_time," +
                    "update_time from goods order by goods_price";
        }
        if(f.equals("goods_price")&& way.equals("desc")){
             sql = "select uid,goods_id,goods_type,goods_name,goods_price," +
                    "goods_description,goods_discount,goods_number,goods_color,creat_time," +
                    "update_time from goods order by goods_price desc";
        }
        if(f.equals("goods_number")&& way.equals("asc")){
          sql = "select uid,goods_id,goods_type,goods_name,goods_price," +
                    "goods_description,goods_discount,goods_number,goods_color,creat_time," +
                    "update_time from goods order by goods_number ";
        }
        if(f.equals("goods_number")&& way.equals("desc")){
            sql = "select uid,goods_id,goods_type,goods_name,goods_price," +
                    "goods_description,goods_discount,goods_number,goods_color,creat_time," +
                    "update_time from goods order by goods_number desc";
        }
        try {
            query = queryRunner.query(sql, new BeanListHandler<Goods>(Goods.class));
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return query;
    }
}
