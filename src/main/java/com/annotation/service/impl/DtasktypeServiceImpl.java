package com.annotation.service.impl;

import com.annotation.dao.DInstanceMapper;
import com.annotation.dao.DTaskMapper;
import com.annotation.dao.DtasktypeMapper;
import com.annotation.dao.InstanceMapper;
import com.annotation.model.DInstance;
import com.annotation.model.DTask;
import com.annotation.model.Dtasktype;
import com.annotation.service.IDtasktypeService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

/**
 * Created by kongmin on 2019/2/8.
 */
@Repository
public class DtasktypeServiceImpl implements IDtasktypeService {

    @Autowired
    DtasktypeMapper dtasktypeMapper;

    public int insert(int userId){
        for(int i=1;i<=6;i++){
            Dtasktype dtasktype = new Dtasktype();
            dtasktypeMapper.alterDtasktypeTable();
            dtasktype.setTasktype(i);
            //信息抽取初始可以做任务的值为0
            if(i==1){
                dtasktype.setTypevalue(1);
            }else{
                dtasktype.setTypevalue(1);
            }
            dtasktype.setuId(userId);
            int res = dtasktypeMapper.insert(dtasktype);
            if(res<0){
                return -1;
            }
        }
        return 0;
    }

    public int updateByUserId(int userId,int typeId){
        Dtasktype dtasktype = dtasktypeMapper.selectBytasktype(userId,typeId);
        if(dtasktype!=null){
            int res = dtasktypeMapper.updateByPrimaryKey(dtasktype);
            return res;
        }
        return -1;
    }

}
