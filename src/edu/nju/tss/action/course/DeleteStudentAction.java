package edu.nju.tss.action.course;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;

import edu.nju.tss.action.BaseAction;
import edu.nju.tss.service.CourseManageService;

@Controller
public class DeleteStudentAction extends BaseAction {

	/** serialVersionUID */
	private static final long serialVersionUID = 6640493878957082912L;
	@Autowired
	private CourseManageService courseService;
	private String message;

	public String deleteStudent() {
		String uid = request.getParameter("uid");
		String courseid = request.getParameter("courseid");
		courseService.deleteStudent(uid, courseid);
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
