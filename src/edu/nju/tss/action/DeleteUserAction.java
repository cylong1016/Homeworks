package edu.nju.tss.action;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;

import edu.nju.tss.model.User;
import edu.nju.tss.service.UserManageService;

@Controller
public class DeleteUserAction extends BaseAction {

	/** serialVersionUID */
	private static final long serialVersionUID = -7483163132247280750L;

	@Autowired
	private UserManageService userService;
	private User user;
	private String message;

	public String deleteUser() {
		String id = request.getParameter("id");
		user = new User();
		user.setId(id);
		userService.delete(user);
		message = "{'message': '删除成功 '}";
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
