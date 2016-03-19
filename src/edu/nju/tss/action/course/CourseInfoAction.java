package edu.nju.tss.action.course;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;

import edu.nju.tss.action.BaseAction;
import edu.nju.tss.model.Course;
import edu.nju.tss.model.User;
import edu.nju.tss.service.CourseManageService;
import edu.nju.tss.service.UserManageService;

@Controller
public class CourseInfoAction extends BaseAction {

	/** serialVersionUID */
	private static final long serialVersionUID = 5600426354085901876L;
	@Autowired
	private CourseManageService courseService;
	@Autowired
	private UserManageService userService;
	private Course course;
	private User user;	// 任课教师
	private List<User> studentList;
	private List<User> assistantList;

	public String findCourse() {
		if (session.get("user") == null) {
			return ERROR;
		}
		String cid = request.getParameter("cid");
		studentList = userService.studentList();
		course = courseService.findCourse(cid);
		user = userService.findUser(course.getInstructor());
		course.setIname(user.getName());
		assistantList = courseService.findAssistant(cid);
		return SUCCESS;
	}

	public List<User> getAssistantList() {
		return assistantList;
	}

	public void setAssistantList(List<User> assistantList) {
		this.assistantList = assistantList;
	}

	public List<User> getStudentList() {
		return studentList;
	}

	public void setStudentList(List<User> studentList) {
		this.studentList = studentList;
	}

	public User getUser() {
		return user;
	}

	public void setUser(User user) {
		this.user = user;
	}

	public Course getCourse() {
		return course;
	}

	public void setCourse(Course course) {
		this.course = course;
	}

}
