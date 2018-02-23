package service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import dao.UserDao;
import entity.User;

@Service
public class UserService {
	
	@Autowired
	private UserDao dao;
	
	public List<User> query(User user) {
		return this.dao.query(user);
	}
	
	public User queryByName(String name) {
		return this.dao.queryByName(name);
	}
}
