package org.peng.cs;

import org.junit.jupiter.api.Test;
import org.peng.cs.service.GoodsService;

import org.springframework.context.ApplicationContext;
import org.springframework.context.support.ClassPathXmlApplicationContext;

public class test {

    ApplicationContext ioc = new ClassPathXmlApplicationContext("applicationContext.xml");

    @Test
    public void test(){

        GoodsService bean = ioc.getBean(GoodsService.class);
        System.out.println(bean.selectAllGoods());
    }
}
