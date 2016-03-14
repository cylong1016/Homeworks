package edu.nju.tss.service.impl;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import edu.nju.tss.dao.UserDao;
import edu.nju.tss.model.User;
import edu.nju.tss.service.UserManageService;

/**
 * Session Bean implementation class UserManageServiceBean
 */
@Service
public class UserManageServiceImpl implements UserManageService {

	/**
	 * Default constructor.
	 */
	@Autowired
	private UserDao userDao;
	/*
	 * private static UserManageServiceBean userService=new UserManageServiceBean();
	 * private UserManageServiceBean()
	 * {
	 * }
	 * public static UserManageService getInstance()
	 * {
	 * return userService;
	 * }
	 */

	//@EJB UserDao userDao;
	//UserDao userDao = (UserDao) EJBFactory.getEJB("ejb:/onlinestockEJB//UserDaoImpl!edu.nju.onlinestock.dao.UserDao");

	public User validateUser(String userid, String password) {
		User user = userDao.find("userid", userid);
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

	public void sentErrorMessage(String message, HttpServletRequest req) throws ServletException, IOException {
		req.setAttribute("message", message);
		//		RequestDispatcher dispater=req.getRequestDispatcher(resp.encodeURL("/error/error.jsp"));
		//		dispater.forward(req,resp);
	}

	public void sentMessage(String message, HttpServletRequest req) throws ServletException, IOException {
		req.setAttribute("message", message);
		//		RequestDispatcher dispater=req.getRequestDispatcher(resp.encodeURL("/message/message.jsp"));
		//		dispater.forward(req,resp);
	}

	public void forwardPage(String page, HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		RequestDispatcher dispater = req.getRequestDispatcher(resp.encodeURL(page));
		dispater.forward(req, resp);
	}

	public String registerUser(User user) {
		String message = null;
		/*
		 * if(validateUser(user.getUserid(), user.getPasswordOne())!=null ){
		 * message="username exist";
		 * return message;
		 * }
		 * /* else if(validateUpdateUser(user, message)!=null){
		 * message="All the content must be filled!";
		 * return message;
		 * }
		 */
		//	else{
		System.out.println(" Ready to save user");
		if (userDao == null)
			System.out.println(" userDao is null");
		userDao.save(user);

		return message;
		//	}
	}

	public String test() {
		System.out.println(" test");
		return "test";

	}

}
