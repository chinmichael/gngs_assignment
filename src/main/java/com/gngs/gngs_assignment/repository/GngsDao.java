package com.gngs.gngs_assignment.repository;

import com.gngs.gngs_assignment.model.SampleAccountVO;
import org.apache.ibatis.annotations.Mapper;

import java.util.List;

@Mapper
public interface GngsDao {
    List<SampleAccountVO> selectAccount();
}
