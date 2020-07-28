package org.peng.cs.domain;

import java.io.Serializable;

public class User implements Serializable {

    private Integer id;
    private String name;
    private String password;
    private String dept;



    public User() {
    }

    /**
     * 用户
     * @param id 用户id
     * @param name 用户名
     * @param password 密码
     * @param dept 部门
     */
    public User(Integer id, String name, String password, String dept) {
        this.id = id;
        this.name = name;
        this.password = password;
        this.dept = dept;
    }

    public User(String name, String password, String dept) {
        this.name = name;
        this.password = password;
        this.dept = dept;
    }

    @Override
    public String toString() {
        return "User{" +
                "id=" + id +
                ", name='" + name + '\'' +
                ", password='" + password + '\'' +
                ", dept='" + dept + '\'' +
                '}';
    }

    public Integer getId() {
        return id;
    }

    public void setId(Integer id) {
        this.id = id;
    }

    public String getName() {
        return name;
    }

    public void setName(String name) {
        this.name = name;
    }

    public String getPassword() {
        return password;
    }

    public void setPassword(String password) {
        this.password = password;
    }

    public String getDept() {
        return dept;
    }

    public void setDept(String dept) {
        this.dept = dept;
    }
}
