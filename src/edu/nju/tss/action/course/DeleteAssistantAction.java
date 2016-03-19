package edu.nju.tss.action.course;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;

import edu.nju.tss.action.BaseAction;
import edu.nju.tss.service.CourseManageService;

@Controller
public class DeleteAssistantAction extends BaseAction {

	/** serialVersionUID */
	private static final long serialVersionUID = 6640493878957082912L;
	@Autowired
	private CourseManageService courseService;
	private String message;

	public String deleteAssistant() {
		String assid = request.getParameter("assid");
		String courseid = request.getParameter("courseid");
		courseService.deleteAssistant(assid, courseid);
		System.out.println(assid);
		System.out.println(courseid);
		message = "{'message': '删除成功 '}";
		return SUCCESS;
	}

	public String getMessage() {
		return message;
	}

	public void setMessage(String message) {
		this.message = message;
	}

}
