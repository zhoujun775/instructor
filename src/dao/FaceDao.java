package dao;

import java.util.List;
import org.springframework.stereotype.Repository;
import entity.Face;
import entity.Notice;

@Repository
public interface FaceDao {
	
	List<Face> query(Face face);
	
	List<Face> queryOne(Integer id);
	
	int insert(Face face);
	
	int delete(Integer faceID);
}
