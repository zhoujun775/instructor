package service;

import java.util.List;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import dao.NoticeDao;
import entity.Notice;

@Service
public class NoticeService {
	
	@Autowired
	private NoticeDao dao;
	
	
	
	public int insert(Notice notice) {
		return this.dao.insert(notice);
	}
	
	public List<Notice> query(Notice notice){
		return this.dao.query(notice);
	}
	
	public List<Notice> queryAll(){
		return this.dao.queryAll();
	}
	
	public int update(Notice notice) {
		return this.dao.update(notice);
	}
	
	public int delete(Integer noticeID) {
		return this.dao.delete(noticeID);
	}
}
