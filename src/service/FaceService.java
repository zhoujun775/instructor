package service;

import java.util.List;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import dao.FaceDao;
import entity.Face;

@Service
public class FaceService {
	
	@Autowired
	private FaceDao dao;
	
	public List<Face> query(Face face) {
		return this.dao.query(face);
	}
}