package dao;

import java.util.List;

import org.springframework.stereotype.Repository;

import entity.User;

@Repository
public interface UserDao{
		
	List<User> query(User user);
	
	User queryByName(String name);
}

