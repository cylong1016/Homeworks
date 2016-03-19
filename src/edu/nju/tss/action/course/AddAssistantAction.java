package edu.nju.tss.action.course;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;

import edu.nju.tss.action.BaseAction;
import edu.nju.tss.model.CourseAssistants;
import edu.nju.tss.model.User;
import edu.nju.tss.service.CourseManageService;
import edu.nju.tss.service.UserManageService;

@Controller
public class AddAssistantAction extends BaseAction {

	/** serialVersionUID */
	private static final long serialVersionUID = 1L;

	@Autowired
	private UserManageService userService;
	@Autowired
	private CourseManageService courseService;
	private String message;
	private User assistant;
	private CourseAssistants ca;

	public String addAssistant() {
		String assid = request.getParameter("assid");
		String courseid = request.getParameter("courseid");
		ca = courseService.findCourseAssistant(assid, courseid);
		if(ca != null) {
			message = "{'message': '该用户已经成为助教！'}";
			return SUCCESS;
		}
		assistant = userService.find("userid", assid);
		if (assistant != null) {
			System.out.println(assistant.getUserid());
			courseService.addCourseAssistant(courseid, assid);
			message = "{'message': '添加成功 ！'}";
		} else {
			message = "{'message': '用户不存在，添加失败！'}";
		}
		return SUCCESS;
	}

	public CourseAssistants getCa() {
		return ca;
	}

	public void setCa(CourseAssistants ca) {
		this.ca = ca;
	}

	public User getAssistant() {
		return assistant;
	}

	public void setAssistant(User assistant) {
		this.assistant = assistant;
	}

	public String getMessage() {
		return message;
	}

	public void setMessage(String message) {
		this.message = message;
	}

}
