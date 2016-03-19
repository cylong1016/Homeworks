package edu.nju.tss.service.impl;

import java.util.ArrayList;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import edu.nju.tss.dao.UserDao;
import edu.nju.tss.model.Admin;
import edu.nju.tss.model.User;
import edu.nju.tss.service.UserManageService;

/**
 * Session Bean implementation class UserManageServiceBean
 */
@Service
public class UserManageServiceImpl implements UserManageService {

	@Autowired
	private UserDao userDao;

	@Override
	public Admin validateAdmin(String userid, String password) {
		Admin admin = (Admin)userDao.find("userid", userid, Admin.class);
		if (admin == null) {
			return null;
		} else if (!admin.getPassword().equals(password)) {
			return null;
		}
		return admin;
	}

	@Override
	public User validateUser(String userid, String password) {
		User user = (User)userDao.find("userid", userid, User.class);
		if (user == null) {
			return null;
		} else if (!user.getPassword().equals(password)) {
			return null;
		}
		return user;
	}

	public Integer validateNumber(String number) {
		Integer num = null;
		try {
			num = Integer.valueOf(number);
		} catch (Exception e) {
			return null;
		}

		if (num.intValue() <= 0) {
			return null;
		}

		return num;
	}

	public String registerUser(User user) {
		String message = null;
		if (validateUser(user.getUserid(), user.getPassword()) != null) {
			message = "用户名" + user.getUserid() + "存在!注册失败!";
			return message;
		} else {
			userDao.save(user);
			return message;
		}
	}

	@Override
	public List<?> userList() {
		return userDao.list();
	}

	@Override
	public void delete(User user) {
		userDao.delete(user);
	}

	@Override
	public void update(User user) {
		userDao.update(user);
	}

	@Override
	public List<User> teacherList() {
		@SuppressWarnings("unchecked")
		List<User> userList = (List<User>)userDao.list();
		List<User> teacherList = new ArrayList<User>();
		for(User user : userList) {
			if(user.getIden().equals(User.TEACHER)) {
				teacherList.add(user);
			}
		}
		return teacherList;
	}

	@Override
	public User findUser(String id) {
		return (User)userDao.find("id", id, User.class);
	}

}
