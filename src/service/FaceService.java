package service;

import java.util.List;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import dao.FaceDao;
import entity.Face;
import entity.Notice;

@Service
public class FaceService {
	
	@Autowired
	private FaceDao dao;
	
	public List<Face> query(Face face) {
		return this.dao.query(face);
	}
	
	public List<Face> queryOne(Integer id){
		return this.dao.queryOne(id);
	}
	
	public int insert(Face face) {
		return this.dao.insert(face);
	}
	
	public int delete(Integer faceID) {
		return this.dao.delete(faceID);
	}
}
