package com.annotation.dao;

import com.annotation.model.User;
import org.apache.ibatis.annotations.Mapper;
import org.springframework.stereotype.Repository;

@Mapper
@Repository
public interface UserMapper {

    /**
     * 根据用户ID获取用户信息
     * @param id 用户ID
     * @return
     */
    User selectUserByUserId(Integer id);


    /**
     * 新建用户
     * @param record 用户信息
     * @return
     */
    int insert(User record);

    /**
     * 根据用户名查找用户
     * @param username 用户名
     * @return
     */
    User selectUserByUsername(String username);

    /**
     * 修改用户信息
     * @param record 用户信息
     * @return
     */
    int updateByPrimaryKey(User record);

    /**
     * 根据用户email查询是否已经存在
     * do:新建用户账户时先查询，一个邮箱只对应一个账号
     * @param email 用户邮箱账号
     * @return
     */
    User selectUserByEmail(String email);
}