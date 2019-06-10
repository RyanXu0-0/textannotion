package com.annotation.dao;

import com.annotation.model.DtuComment;
import org.apache.ibatis.annotations.Param;
import org.springframework.stereotype.Repository;

import java.util.List;

@Repository
public interface DtuCommentMapper {
    int deleteByPrimaryKey(Integer dtuId);

    int deleteByDtdIdAndUId(@Param("dtdId")Integer dtdId,
                            @Param("uId")Integer uId);

    int insert(DtuComment record);

    DtuComment selectByPrimaryKey(Integer dtuId);

    List<DtuComment> selectAll();

    int updateByPrimaryKey(DtuComment record);
}