package edu.nju.tss.action;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;

import edu.nju.tss.model.User;
import edu.nju.tss.service.UserManageService;

@Controller
public class RegisterAction extends BaseAction {

	/** serialVersionUID */
	private static final long serialVersionUID = 6459576051412823750L;
	@Autowired
	private UserManageService userService;
	private User user;
	private String message = "";

	public String register() {
		if(session.get("admin") == null) {
			return ERROR;
		}
		if (request.getParameter("user.password").equals(request.getParameter("password_2"))) {
			user.setPassword(request.getParameter("user.password"));
		} else {
			message = "两次输入密码不同";
			return INPUT;
		}
		message = userService.registerUser(user);
		if (message != null) {
			System.out.println(message);
			return INPUT;
		} else {
			session.put("user", user);
			message = "用户" + user.getUserid() + "注册成功";
			return SUCCESS;
		}

	}

	public User getUser() {
		return user;
	}

	public void setUser(User user) {
		this.user = user;
	}

	public String getMessage() {
		return message;
	}

}
