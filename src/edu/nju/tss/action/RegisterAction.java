package edu.nju.tss.action;

import java.io.IOException;
import java.util.UUID;

import javax.servlet.ServletException;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;

import edu.nju.tss.model.User;
import edu.nju.tss.service.UserManageService;

@Controller
public class RegisterAction extends BaseAction {

	private static final long serialVersionUID = 1L;
	@Autowired
	private UserManageService userService;

	private User user;

	public String execute() throws ServletException, IOException {
		if (userService == null) {
			System.out.println("user service null");
		}

		user.setPassword(request.getParameter("password"));
		user.setUserid(request.getParameter("userid"));
		user.setId(UUID.randomUUID().toString());
		userService.registerUser(user);
		/*
		 * if((message=userService.registerUser(user))!= null){
		 * userService.sentErrorMessage(message, request);
		 * return INPUT;
		 * }
		 * else{
		 */
		session.put("user", user);
		return SUCCESS;
		//}

	}

	/*
	 * public void setUserService(UserManageService userService) {
	 * this.userService = userService;
	 * if (userService==null )System.out.println("user service null");
	 * }
	 * public UserManageService getUserService() {
	 * return userService;
	 * }
	 */

	public void setUser(User user) {
		this.user = user;
		System.out.println(user.getUserid() + "user");
	}

	public User getUser() {
		if (user == null)
			System.out.println("user null\n");
		return user;
	}

}
