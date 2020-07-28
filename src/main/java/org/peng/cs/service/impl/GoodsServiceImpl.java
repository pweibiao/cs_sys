package org.peng.cs.service.impl;

import org.peng.cs.domain.Goods;

import org.peng.cs.mapper.GoodsMapper;

import org.peng.cs.service.GoodsService;

import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Propagation;
import org.springframework.transaction.annotation.Transactional;

import javax.annotation.Resource;
import java.util.List;

@Service("goodsService")
public class GoodsServiceImpl implements GoodsService {

    @Resource
    private GoodsMapper goodsMapper;

    @Override
    @Transactional(propagation = Propagation.REQUIRED,rollbackFor = Exception.class)
    public void insertGoods(Goods goods) {
        goodsMapper.insertGoods(goods);
    }

    @Override
    @Transactional(propagation = Propagation.REQUIRED,rollbackFor = Exception.class)
    public void deleteGoodsById(Integer id) {
        goodsMapper.deleteGoodsById(id);
    }

    @Override
    @Transactional(propagation = Propagation.REQUIRED,rollbackFor = Exception.class)
    public void updateGoodsById(Goods goods) {
        goodsMapper.updateGoodsById(goods);
    }

    @Override
    public Goods findGoodsById(Integer id) {
        return goodsMapper.findGoodsById(id);
    }

    @Override
    public List<Goods> selectAllGoods() {
        return goodsMapper.selectAllGoods();
    }

    @Override
    public Integer selectCountGoods() {
        return goodsMapper.selectCountGoods();
    }
}
