package edu.nju.tss.action;

import org.springframework.stereotype.Controller;

import edu.nju.tss.model.Admin;

@Controller
public class CourseListAction extends BaseAction {

	/** serialVersionUID */
	private static final long serialVersionUID = -5631473478930386952L;

	private Admin admin;

	public String execute() {
		
		return SUCCESS;
	}

	public Admin getAdmin() {
		return admin;
	}

	public void setAdmin(Admin admin) {
		this.admin = admin;
	}

}
