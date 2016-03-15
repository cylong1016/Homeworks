package edu.nju.tss.action;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;

import edu.nju.tss.model.Admin;
import edu.nju.tss.service.UserManageService;

@Controller
public class LoginAction extends BaseAction {

	/** serialVersionUID */
	private static final long serialVersionUID = 6706991257331408930L;
	@Autowired
	private UserManageService userService;
	private Admin admin;

	public String execute() {
		String userid = request.getParameter("admin.userid");
		String password = request.getParameter("admin.password");
		admin = userService.validateAdmin(userid, password);
		if (admin != null) {
			session.put("admin", admin);
			return SUCCESS;
		}
		return ERROR;
	}

	public Admin getAdmin() {
		return admin;
	}

	public void setAdmin(Admin admin) {
		this.admin = admin;
	}

}
