package edu.nju.tss.service;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.transaction.annotation.Propagation;
import org.springframework.transaction.annotation.Transactional;

import edu.nju.tss.model.User;

public interface UserManageService {

	public User validateUser(String userid, String password);

	//	public String validateRegister(User user,String message) throws PasswordNotMatchException ,UsernameExistException;

	//	public String validateUpdateUser(User user,String message) throws PasswordNotMatchException;

	public Integer validateNumber(String number);

	public void sentErrorMessage(String message, HttpServletRequest req) throws ServletException, IOException;

	public void sentMessage(String message, HttpServletRequest req) throws ServletException, IOException;

	public void forwardPage(String page, HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException;

	@Transactional(propagation = Propagation.REQUIRED, readOnly = false)
	public String registerUser(User user);

	public String test();

}
