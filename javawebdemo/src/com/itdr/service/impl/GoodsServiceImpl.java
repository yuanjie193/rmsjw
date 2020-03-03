package com.itdr.service.impl;

import com.itdr.common.ResponseCode;
import com.itdr.dao.GoodsDao;
import com.itdr.dao.UserDao;
import com.itdr.pojo.Goods;
import com.itdr.pojo.Users;
import com.itdr.pojo.VO.GoodsVO;
import com.itdr.service.GoodsService;
import com.itdr.utils.toObjectUtil;
import com.mysql.jdbc.StringUtils;

import java.util.ArrayList;
import java.util.List;

public class GoodsServiceImpl implements GoodsService {
    private GoodsDao goodsDao = new GoodsDao();
    private UserDao userDao = new UserDao();
    @Override
    public ResponseCode getAllGoods(){
        List<Goods> goods = goodsDao.selectALLGoods();
        List<GoodsVO> goodsList = new ArrayList<GoodsVO>();
        for (Goods good : goods) {
          Users u =  userDao.selectByUserId(good.getUid());
          if(u!=null){
              GoodsVO goodsVO = toObjectUtil.getGoodsVO(u.getUsername(), good);
              goodsList.add(goodsVO);
          }
        }
        return ResponseCode.toSuccess(goodsList);
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
        List<GoodsVO> goodsList = new ArrayList<GoodsVO>();
        for (Goods good : goods) {
            Users u =  userDao.selectByUserId(good.getUid());
            if(u!=null){
                GoodsVO goodsVO = toObjectUtil.getGoodsVO(u.getUsername(), good);
                goodsList.add(goodsVO);
            }
        }
        return ResponseCode.toSuccess(goodsList);
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

    @Override
    public ResponseCode addGoods(Integer uid,String goodsname, String price, String number, String color, String discount, String description, String checked) {
        if(goodsname == null || "".equals(goodsname)){
            return ResponseCode.toDefeated("输入有误！");
        }
        if(price == null || "".equals(price)){
            return ResponseCode.toDefeated("输入有误！");
        }
        if(number == null || "".equals(number)){
            return ResponseCode.toDefeated("输入有误！");
        }
        int check = 0;
        if(checked == null){
            check =1;
        }

        int i = goodsDao.addGoods(uid,goodsname,price,number,color,discount,description,check);
        if(i<=0){
            return ResponseCode.toDefeated("添加失败！");
        }
        return ResponseCode.toSuccess(i);
    }

    @Override
    public ResponseCode updateGoods(Integer uid, String goods_id, String goodsname, String price, String number, String color, String discount, String description, String checked) {
        int check = 0;
        if(checked == null){
            check =1;
        }
        int goodsID = Integer.parseInt(goods_id);
        int i = goodsDao.updateGoods(uid,goodsID,goodsname,price,number,color,discount,description,check);
        if(i<=0){
            return ResponseCode.toDefeated("更新失败！");
        }
        return ResponseCode.toSuccess(i);
    }

    @Override
    public ResponseCode selectOneGoods(String goodsId) {
        if(goodsId == null || "".equals(goodsId)){
            return ResponseCode.toDefeated("输入有误！");
        }
        int i = Integer.parseInt(goodsId);
        Goods goods = goodsDao.selectById(i);
        if(goods == null){
            return ResponseCode.toDefeated("没有该商品");
        }
        return ResponseCode.toSuccess(goods);
    }

    @Override
    public ResponseCode goodsSort(String field,String way) {
        if(field == null || "".equals(field)){
            return ResponseCode.toDefeated("输入有误！");
        }
        List<Goods> goods = goodsDao.goodsSort(field,way);
        if(goods == null){
            return ResponseCode.toDefeated("搜索商品不存在！");
        }
        List<GoodsVO> goodsList = new ArrayList<GoodsVO>();
        for (Goods good : goods) {
            Users u =  userDao.selectByUserId(good.getUid());
            if(u!=null){
                GoodsVO goodsVO = toObjectUtil.getGoodsVO(u.getUsername(), good);
                goodsList.add(goodsVO);
            }
        }
        return ResponseCode.toSuccess(goodsList);

    }
}
