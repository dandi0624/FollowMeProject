package com.fz.followme.dao;

import java.util.List;

import org.apache.ibatis.session.RowBounds;
import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.stereotype.Repository;

import com.fz.followme.dto.AttachmentDto;
import com.fz.followme.dto.EmailDto;
import com.fz.followme.dto.PageInfoDto;

import lombok.RequiredArgsConstructor;

@RequiredArgsConstructor
@Repository
public class EmailDao {
	
	private final SqlSessionTemplate sqlSessionTemplate;
	
	
	
	public List<EmailDto> selectMemberList(){
		return sqlSessionTemplate.selectList("emailMapper.selectMemberList");
	}
	
	
	public void insertEmail(EmailDto ed) {
		sqlSessionTemplate.insert("emailMapper.insertEmail", ed);
	}
	
	public void insertAttachment(AttachmentDto at) {
		sqlSessionTemplate.insert("emailMapper.insertAttachment", at);
	}
	
	public int selectOutBoxListCount() {
		return sqlSessionTemplate.selectOne("emailMapper.selectOutBoxListCount");
	}
	
	public List<EmailDto> selectOutBoxList(PageInfoDto pi){
		
		int limit = pi.getBoardLimit();
		int offset = (pi.getCurrentPage() - 1) * limit;
		
		RowBounds rowBounds = new RowBounds(offset, limit);
		
		return sqlSessionTemplate.selectList("emailMapper.selectOutBoxList", null, rowBounds);
	}
	
	public int updateMailStatusTrash(int[] checkMail) {
		return sqlSessionTemplate.update("emailMapper.updateMailStatusTrash", checkMail);
	}
	
	public EmailDto selectSendMail(int no) {
		return sqlSessionTemplate.selectOne("emailMapper.selectSendMail", no);
	}

}
