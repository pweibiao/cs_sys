package org.peng.cs.util;

import org.aspectj.lang.annotation.*;
import org.springframework.stereotype.Component;

@Aspect
@Component  //切面类
public class LogUtil {
    @Before("execution(* * ..*.*(..))")
    public static void logStart(){
        System.out.println("执行之前。。。。");
    }
    @AfterReturning("execution(* * ..*.*(..))")
    public static void logReturn(){
        System.out.println("执行之后");

    }
    @AfterThrowing("execution(* * ..*.*(..))")
    public static void logExcept(){
        System.out.println("执行异常");
    }
    @After("execution(* * ..*.*(..))")
    public static void logEnd(){
        System.out.println("执行结束");
    }

}
