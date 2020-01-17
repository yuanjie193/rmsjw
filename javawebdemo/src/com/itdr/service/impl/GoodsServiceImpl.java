package com.itdr.service.impl;

import com.itdr.common.ResponseCode;
import com.itdr.dao.GoodsDao;
import com.itdr.pojo.Goods;
import com.itdr.service.GoodsService;

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
         int a =  goodsDao.updateById(i);
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


}
