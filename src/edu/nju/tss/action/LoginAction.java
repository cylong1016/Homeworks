package edu.nju.tss.action;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;

import edu.nju.tss.model.Admin;
import edu.nju.tss.model.User;
import edu.nju.tss.service.UserManageService;

@Controller
public class LoginAction extends BaseAction {

	/** serialVersionUID */
	private static final long serialVersionUID = 6706991257331408930L;
	@Autowired
	private UserManageService userService;
	private Admin admin;
	private User user;

	public String execute() {
		session.clear();
		String userid = request.getParameter("user.userid");
		String password = request.getParameter("user.password");
		admin = userService.validateAdmin(userid, password);
		if (admin != null) {
			session.put("admin", admin);
			return SUCCESS;
		}
		user = userService.validateUser(userid, password);
		if(user != null) {
			session.put("user", user);
			System.out.println(user.getIden());
			if(user.getIden().equals(User.TEACHER)) {
				return TEACHER;
			}
		}
		return ERROR;
	}

	public User getUser() {
		return user;
	}

	public void setUser(User user) {
		this.user = user;
	}

	public Admin getAdmin() {
		return admin;
	}

	public void setAdmin(Admin admin) {
		this.admin = admin;
	}

}
