package com.fz.followme.dao;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.stereotype.Repository;

import com.fz.followme.dto.AttendanceDto;

import lombok.RequiredArgsConstructor;

@RequiredArgsConstructor
@Repository
public class AttendanceDao {
	
	private final SqlSessionTemplate sqlSessionTemplate;

	public int insertWorktime(String memNo) {
		return sqlSessionTemplate.insert("attendanceMapper.insertWorktime", memNo);
	}

	public int updateWorktime(String memNo) {
		return sqlSessionTemplate.update("attendanceMapper.updateWorktime", memNo);
	}

	public AttendanceDto selectStatus(String memNo) {
		return sqlSessionTemplate.selectOne("attendanceMapper.selectStatus", memNo);
	}
	
	
}