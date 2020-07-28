package org.peng.cs.mapper;

import org.peng.cs.domain.Goods;


import java.util.List;

public interface GoodsMapper {

    public void insertGoods(Goods goods);

    public void deleteGoodsById(Integer id) ;

    public void updateGoodsById(Goods goods);

    public Goods findGoodsById(Integer id);

    public List<Goods> selectAllGoods();

    public Integer selectCountGoods();

}
