package com.fz.followme.service;

import org.springframework.stereotype.Service;

import com.fz.followme.dao.AttendanceDao;
import com.fz.followme.dao.CalendarDao;
import com.fz.followme.dto.AttendanceDto;

import lombok.RequiredArgsConstructor;

@RequiredArgsConstructor
@Service
public class AttendanceServiceImpl implements AttendanceService {
	
	private final AttendanceDao attendanceDao;

	@Override
	public int insertWorktime(String memNo) {
		return attendanceDao.insertWorktime(memNo);
	}

	@Override
	public int updateWorktime(String memNo) {
		
		return attendanceDao.updateWorktime(memNo);
	}

	@Override
	public AttendanceDto selectStatus(String memNo) {
		return attendanceDao.selectStatus(memNo);
	}
	
}