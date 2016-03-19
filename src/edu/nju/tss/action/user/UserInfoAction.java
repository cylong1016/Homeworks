package edu.nju.tss.action.user;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;

import edu.nju.tss.action.BaseAction;
import edu.nju.tss.model.User;
import edu.nju.tss.service.UserManageService;

@Controller
public class UserInfoAction extends BaseAction {

	/** serialVersionUID */
	private static final long serialVersionUID = 5600426354085901876L;
	@Autowired
	private UserManageService userService;
	private User user;

	public String findUser() {
		if(session.get("user") == null) {
			return ERROR;
		}
		String uid = request.getParameter("uid");
		user = userService.findUser(uid);
		return SUCCESS;
	}

	public User getUser() {
		return user;
	}

	public void setUser(User user) {
		this.user = user;
	}

}
