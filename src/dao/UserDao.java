package dao;

import java.util.List;

import org.springframework.stereotype.Repository;

import entity.User;

@Repository
public interface UserDao{
		
	List<User> query(User user);
	
	List<User> query2(User user);
	
	List<User> queryAllUser();
	
	User queryByName(String name);
	
	int insert(User user);//插入一个实体
	
	int update(User user);
	
	int delete(Integer userID);
}

