package org.peng.cs.domain;

import java.io.Serializable;

public class User implements Serializable {
    /**
     * 用户唯一ID
     */
    private Integer id;
    /**
     * 用户名
     */
    private String name;
    /**
     * 密码
     */
    private String password;
    /**
     * 部门（用户权限）
     */
    private String dept;
    public User() {
    }

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
