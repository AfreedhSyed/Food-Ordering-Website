package com.quickbite.dao;

import java.util.List;

import com.quickbite.model.User;

public interface UserDAO {
	void addUser(User user);
	void updateUser(User user);
	void deleteUser(int userid);
	User getUserById(int userid);
	User getUserByEmailId(String emailid);
	List<User> getAllUsers();
}
