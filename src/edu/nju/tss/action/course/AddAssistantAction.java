package edu.nju.tss.action.course;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;

import edu.nju.tss.action.BaseAction;
import edu.nju.tss.model.CourseAssistants;
import edu.nju.tss.model.CourseStudent;
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
	private CourseStudent cs;

	public String addAssistant() {
		String assid = request.getParameter("uid");
		String courseid = request.getParameter("courseid");
		ca = courseService.findCourseAssistant(assid, courseid);
		if (ca != null) {
			message = "{'message': '该用户已经成为助教！'}";
			return SUCCESS;
		}
		// 判断是否成为这个课的学生
		cs = courseService.findCourseStudent(assid, courseid);
		if(cs != null) {
			message = "{'message': '选课学生不能成为助教！'}";
			return SUCCESS;
		}
		assistant = userService.find("userid", assid);
		if (assistant != null && assistant.getIden().equals(User.STUDENT)) {
			courseService.addCourseAssistant(courseid, assid);
			message = "{'message': '添加成功 ！'}";
		} else {
			message = "{'message': '添加失败！'}";
		}
		return SUCCESS;
	}

	public CourseStudent getCs() {
		return cs;
	}

	public void setCs(CourseStudent cs) {
		this.cs = cs;
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
