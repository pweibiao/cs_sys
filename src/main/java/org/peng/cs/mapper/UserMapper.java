package org.peng.cs.mapper;

import org.peng.cs.domain.User;

import java.util.List;

public interface UserMapper {

    public void insertUser(User user);

    public void deleteUserByName(Integer id);

    public void updateUserById(User user);

    public User findUserById(Integer id);

    public List<User> selectAllUser();

    public User findUserByName(String name);

    public Integer selectAllCount();

}