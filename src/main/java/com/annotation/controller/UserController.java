package com.annotation.controller;

import com.annotation.model.User;
import com.annotation.model.entity.ResponseEntity;
import com.annotation.service.IDtasktypeService;
import com.annotation.service.IPointService;
import com.annotation.service.IUserService;
import com.annotation.util.ResponseUtil;
import org.apache.ibatis.annotations.Delete;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.transaction.annotation.Transactional;
import org.springframework.transaction.interceptor.TransactionAspectSupport;
import org.springframework.web.bind.annotation.*;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.HashMap;
import java.util.Map;

/**
 * Created by twinkleStar on 2018/12/4.
 */

@RestController
@RequestMapping("/user")
public class UserController {

    @Autowired
    IUserService iUserService;
    @Autowired
    ResponseUtil responseUtil;

    @Autowired
    IDtasktypeService iDtasktypeService;
    @Autowired
    IPointService iPointService;

    /**
     * 用户登陆，新建session
     * @param request
     * @param httpResponse
     * @param username
     * @param password
     * @return
     */
    @PostMapping(value = "/session")
    public ResponseEntity userLogin(HttpServletRequest request, HttpServletResponse httpResponse,
                                    String username,String password) {

        User user =iUserService.queryUserByUsername(username);//查找用户

        if(user ==null){
            ResponseEntity responseEntity=responseUtil.judgeResult(1001);
            return responseEntity;
        }else{
            //如果用户名密码正确
            if (user.getPassword().equals(password)){
                HttpSession session=request.getSession(true);//session的创建
                session.setAttribute("currentUser",user);//给session添加属性
                ResponseEntity responseEntity = new ResponseEntity();//设置返回值
                responseEntity.setStatus(200);
                responseEntity.setMsg("登陆成功");
                Map<String, Object> data = new HashMap<>();
                data.put("username", user.getUsername());
                data.put("userId", user.getId());
                responseEntity.setData(data);
                return responseEntity;
            }else{
                //密码错误的返回
                ResponseEntity responseEntity=responseUtil.judgeResult(1002);
                return responseEntity;
            }
        }
    }


    /**
     * 用户退出登录，移除session
     * @param request
     * @param httpServletResponse
     * @param httpSession
     * @return
     */
    @DeleteMapping(value = "/session")
    public ResponseEntity userLogout(HttpServletRequest request,HttpServletResponse httpServletResponse,HttpSession httpSession){
        httpSession.removeAttribute("currentUser");
        ResponseEntity responseEntity = new ResponseEntity();//设置返回值
        responseEntity.setStatus(200);
        responseEntity.setMsg("退出登录成功");
        return responseEntity;
    }


    /**
     * 根据用户ID获取用户信息
     * @param request
     * @param httpServletResponse
     * @param httpSession
     * @return
     */
    @GetMapping
    public ResponseEntity getUserInfo(HttpServletRequest request, HttpServletResponse httpServletResponse,
                                      HttpSession httpSession){

        User user =(User)httpSession.getAttribute("currentUser");
        User userInfo =iUserService.queryUserByUserId(user.getId());
        //设置返回值
        ResponseEntity responseEntity=new ResponseEntity();
        responseEntity.setStatus(200);
        responseEntity.setMsg("登陆成功");
        responseEntity.setData(userInfo);
        //设置返回值，用户名、用户ID
//        Map<String, Object> data = new HashMap<>();
//        data.put("userInfo",userInfo);
//        responseEntity.setData(data);
        return responseEntity;
    }


    /**
     * 新用户注册
     * @param request
     * @param httpServletResponse
     * @param user
     * @return
     */
    @Transactional
    @PostMapping
    public ResponseEntity userRegister(HttpServletRequest request, HttpServletResponse httpServletResponse,
                                      User user){

        User userInfo=iUserService.queryUserByEmail(user.getEmail());
        if(userInfo ==null){

            int res =iUserService.insertNewUser(user);
            if(res > 0){
                ResponseEntity responseEntity = new ResponseEntity();
                responseEntity.setStatus(200);
                responseEntity.setMsg("注册成功，请重新登陆");

                int userId = user.getId();
                int upRes = iDtasktypeService.insert(userId);
                if(upRes<0){
                    TransactionAspectSupport.currentTransactionStatus().setRollbackOnly();
                    ResponseEntity responseEntity2=new ResponseEntity();
                    responseEntity2.setMsg("新建是否做任务表失败");
                    responseEntity2.setStatus(-1);
                    return responseEntity2;
                }
                int pointres = iPointService.insert(userId);
                if(upRes<0){
                    ResponseEntity responseEntity3=new ResponseEntity();
                    responseEntity3.setMsg("新建积分表失败");
                    responseEntity3.setStatus(-1);
                    return responseEntity3;
                }

                return responseEntity;
            }else{
                ResponseEntity responseEntity=responseUtil.judgeResult(1004);
                return responseEntity;
            }
        }else{
            ResponseEntity responseEntity=responseUtil.judgeResult(1003);
            return responseEntity;
        }

    }


    /**
     * 更新用户信息
     * todo:暂时没用没检查
     * @param request
     * @param httpServletResponse
     * @param httpSession
     * @param user
     * @return
     */
    @PutMapping
    public ResponseEntity updateUser(HttpServletRequest request, HttpServletResponse httpServletResponse,
                                      HttpSession httpSession, User user){
        User userInfo =(User)httpSession.getAttribute("currentUser");

        user.setId(userInfo.getId());

        int res=iUserService.updateUserInfo(user);
        if(res==1){
            User returnUser=iUserService.queryUserByUserId(userInfo.getId());
            ResponseEntity responseEntity = new ResponseEntity();
            responseEntity.setData(returnUser);
            responseEntity.setStatus(200);
            responseEntity.setMsg("修改成功");
            return responseEntity;
        }else{
            ResponseEntity responseEntity=responseUtil.judgeResult(1005);
            return responseEntity;
        }

    }

}
