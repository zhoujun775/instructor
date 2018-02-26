package dao;

import java.util.List;
import org.springframework.stereotype.Repository;
import entity.Notice;

@Repository
public interface NoticeDao {
	
	List<Notice> query(Notice notice);
	
	List<Notice> queryAll();
	
	int insert(Notice notice);
	
	int update(Notice notice);
	
	int delete(Integer noticeID);
}
