package edu.nju.tss.action;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;

import edu.nju.tss.service.UserManageService;

@Controller
public class UserListAction extends BaseAction {

	/** serialVersionUID */
	private static final long serialVersionUID = -744744496976142936L;
	@Autowired
	private UserManageService userService;
	private List<?> userList;

	private String message;

	public String execute() {
		if(session.get("admin") == null) {
			return ERROR;
		}
		userList = userService.userList();
		return SUCCESS;
	}

	public List<?> getUserList() {
		return userList;
	}

	public void setUserList(List<?> userList) {
		this.userList = userList;
	}

	public String getMessage() {
		return message;
	}

	public void setMessage(String message) {
		this.message = message;
	}

}
