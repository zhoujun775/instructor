package service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import dao.UserDao;
import entity.User;

@Service
public class UserService {
	
	@Autowired
	private UserDao dao;
	
	public List<User> query(User user) {
		return this.dao.query(user);
	}
	
	public List<User> query2(User user) {
		return this.dao.query2(user);
	}
	
	public User queryByName(String name) {
		return this.dao.queryByName(name);
	}
	
	public List<User> queryAllUser() {
		return this.dao.queryAllUser();
	}
	
	@Transactional
	public int insert(User user) {
		return this.dao.insert(user);
	}
	
	@Transactional
	public int update(User user) {
		return this.dao.update(user);
	}
	
	@Transactional
	public int delete(Integer userID) {
		return this.dao.delete(userID);
	}
	
}
