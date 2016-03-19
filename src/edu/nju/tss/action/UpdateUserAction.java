package edu.nju.tss.action;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;

import edu.nju.tss.model.User;
import edu.nju.tss.service.UserManageService;

@Controller
public class UpdateUserAction extends BaseAction {

	/** serialVersionUID */
	private static final long serialVersionUID = 6145236856437242832L;

	@Autowired
	private UserManageService userService;
	private User user;
	private String message;

	public String updateUser() {
		userService.update(user);
		if(session.get("user") != null) {
			session.put("user", user);
		}
		message = "{'message': '更新成功 '}";
		return SUCCESS;
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

	public void setMessage(String message) {
		this.message = message;
	}

}
