package edu.nju.tss.action;

import org.springframework.stereotype.Controller;

@Controller
public class LogoutAction extends BaseAction {

	/** serialVersionUID */
	private static final long serialVersionUID = 4529054089921070737L;
	
	public String execute() {
		session.clear();
		return SUCCESS;
	}

}
