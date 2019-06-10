package com.annotation.service.impl;

import com.annotation.dao.UserMapper;
import com.annotation.model.User;
import com.annotation.service.IUserService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import java.text.SimpleDateFormat;
import java.util.Date;

/**
 * Created by twinkleStar on 2018/12/4.
 */

@Repository
public class UserServiceImpl implements IUserService {

    @Autowired
    UserMapper userMapper;

    /**
     * 根据用户ID获取用户信息
     * @param id 用户ID
     * @return
     */
    public User queryUserByUserId(int id){
        User user =userMapper.selectUserByUserId(id);
        return user;
    }

    /**
     * 根据用户名查询用户信息
     * do:用户登陆
     * @param username 用户名
     * @return
     */
    public User queryUserByUsername(String username){
        User user =userMapper.selectUserByUsername(username);
        return user;
    }

    /**
     * 根据用户email查询是否已经存在
     * do:新建用户账户时先查询，一个邮箱只对应一个账号
     * @param email 用户邮箱账号
     * @return
     */
    public User queryUserByEmail(String email){
        User user=userMapper.selectUserByEmail(email);
        return user;
    }

    /**
     * 新建用户
     * @param user 用户信息
     * @return
     */
    public int insertNewUser(User user){
        SimpleDateFormat df = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");//设置日期格式
        user.setRegtime(df.format(new Date()));
        int res=userMapper.insert(user);
        return res;
    }

    /**
     * 修改用户信息
     * @param user 用户信息
     * @return
     */
    public int updateUserInfo(User user){
        int res=userMapper.updateByPrimaryKey(user);

       return res;

    }



}
