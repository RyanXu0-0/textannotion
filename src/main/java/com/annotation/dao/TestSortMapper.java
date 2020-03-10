package com.annotation.dao;

import com.annotation.model.TestPairing;
import com.annotation.model.TestSort;
import org.apache.ibatis.annotations.Mapper;
import org.springframework.stereotype.Repository;

import java.util.List;

/**
 * Created by Ryan on 2019/12/9.
 */
@Mapper
@Repository
public interface TestSortMapper {

    int insertAllSort(List<TestSort> list);

    int alterSortTable();
}
