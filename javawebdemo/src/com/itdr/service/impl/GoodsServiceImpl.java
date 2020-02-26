package com.itdr.service.impl;

import com.itdr.common.ResponseCode;
import com.itdr.dao.GoodsDao;
import com.itdr.pojo.Goods;
import com.itdr.service.GoodsService;
import com.mysql.jdbc.StringUtils;

import java.util.List;

public class GoodsServiceImpl implements GoodsService {
    private GoodsDao goodsDao = new GoodsDao();
    @Override
    public ResponseCode getAllGoods() {
        List<Goods> goods = goodsDao.selectALLGoods();
        return ResponseCode.toSuccess(goods);
    }
    //商品下架
    @Override
    public ResponseCode toType(String id) {
        //参数非空判断
        if(id == null || "".equals(id)){
            return ResponseCode.toDefeated("非法参数");
        }
        int i = Integer.parseInt(id);
        //查询是否有此商品
        Goods goods = goodsDao.selectById(i);
        if(goods == null){
            return ResponseCode.toDefeated("商品不存在！");
        }
        //修改商品信息
        //        下架
        int a =0;
        if(goods.getGoods_type() == 0){
            int update = 1;
             a =  goodsDao.updateById(i,update);
        }
        //上架
        if(goods.getGoods_type() == 1){
            int update = 0;
            a =  goodsDao.updateById(i,update);
        }

        if(a < 0){
            return ResponseCode.toDefeated("下架失败");
        }
        return ResponseCode.toSuccess(a);
    }

    @Override
    public ResponseCode selectGoods(String sg) {
        if(sg == null || "".equals(sg)){
            return ResponseCode.toDefeated("输入有误！");
        }
        List<Goods> goods = goodsDao.selectByName(sg);
        if(goods == null){
            return ResponseCode.toDefeated("搜索商品不存在！");
        }
        for (Goods good : goods) {
            System.out.println(good.getGoods_name().toString());
        }
        return ResponseCode.toSuccess(goods);
    }

    /**
     * 删除商品
     * @param id
     * @return
     */
    @Override
    public ResponseCode toDelete(String id) {
        if(id == null || "".equals(id)){
            return ResponseCode.toDefeated("输入有误！");
        }
        int i = Integer.parseInt(id);
        //查询是否有此商品
        Goods goods = goodsDao.selectById(i);
        if(goods == null){
            return ResponseCode.toDefeated("商品不存在！");
        }
        //删除商品
        int deleteGoods = goodsDao.deleteGoods(i);
        if(deleteGoods <= 0){
            return ResponseCode.toDefeated("删除失败！");
        }
        return ResponseCode.toSuccess(deleteGoods);
    }


}
