package edu.nju.tss.action.course;

import org.springframework.beans.factory.annotation.Autowired;

import edu.nju.tss.action.BaseAction;
import edu.nju.tss.model.CourseAssistants;
import edu.nju.tss.model.CourseStudent;
import edu.nju.tss.model.User;
import edu.nju.tss.service.CourseManageService;
import edu.nju.tss.service.UserManageService;

public class AddStudentAction extends BaseAction {

	/** serialVersionUID */
	private static final long serialVersionUID = -3546723535502913098L;

	@Autowired
	private UserManageService userService;
	@Autowired
	private CourseManageService courseService;
	private String message;
	private User student;
	private CourseAssistants ca;
	private CourseStudent cs;

	public String addStudent() {
		String stuid = request.getParameter("uid");
		String courseid = request.getParameter("courseid");
		ca = courseService.findCourseAssistant(stuid, courseid);
		if (ca != null) {
			message = "{'message': '该用户已经成为助教！'}";
			return SUCCESS;
		}
		cs = courseService.findCourseStudent(stuid, courseid);
		if(cs != null) {
			message = "{'message': '该用户已经添加'}";
			return SUCCESS;
		}
		student = userService.find("userid", stuid);
		if (student != null && student.getIden().equals(User.STUDENT)) {
			courseService.addCourseStudent(courseid, stuid);
			message = "{'message': '添加成功 ！'}";
		} else {
			message = "{'message': '添加失败！'}";
		}
		return SUCCESS;
	}

	public String getMessage() {
		return message;
	}

	public void setMessage(String message) {
		this.message = message;
	}

	public User getAssistant() {
		return student;
	}

	public void setAssistant(User assistant) {
		this.student = assistant;
	}

	public CourseAssistants getCa() {
		return ca;
	}

	public void setCa(CourseAssistants ca) {
		this.ca = ca;
	}

	public CourseStudent getCs() {
		return cs;
	}

	public void setCs(CourseStudent cs) {
		this.cs = cs;
	}

}
