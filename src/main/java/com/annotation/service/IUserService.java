package com.annotation.service;

import com.annotation.model.User;

/**
 * Created by twinkleStar on 2018/12/4.
 */


public interface IUserService {

    /**
     * 根据用户ID获取用户信息
     * @param id 用户ID
     * @return
     */
    User queryUserByUserId(int id);

    /**
     * 根据用户名查询用户信息
     * do:用户登陆
     * @param username 用户名
     * @return
     */
    User queryUserByUsername(String username);


    /**
     * 根据用户email查询是否已经存在
     * do:新建用户账户时先查询，一个邮箱只对应一个账号
     * @param email 用户邮箱账号
     * @return
     */
    User queryUserByEmail(String email);


    /**
     * 新建用户
     * @param user 用户信息
     * @return
     */
    int insertNewUser(User user);

    /**
     * 修改用户信息
     * @param user 用户信息
     * @return
     */
    int updateUserInfo(User user);


}
