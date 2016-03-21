package edu.nju.tss.action;

import java.util.Collections;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;

import edu.nju.tss.model.Admin;
import edu.nju.tss.model.Course;
import edu.nju.tss.model.User;
import edu.nju.tss.service.CourseManageService;
import edu.nju.tss.service.UserManageService;

@Controller
public class CourseListAction extends BaseAction {

	/** serialVersionUID */
	private static final long serialVersionUID = -5631473478930386952L;
	@Autowired
	private CourseManageService courseService;
	@Autowired
	private UserManageService userService;
	private List<Course> courseList;
	private List<User> teacherList;
	private String message;

	public String execute() {
		courseList = courseService.courseList();
		teacherList = userService.teacherList();
		Collections.sort(courseList);
		List<?> userList = userService.userList();
		for(Course course : courseList) {
			for(Object o : userList) {
				User user = (User)o;
				if (user.getId().equals(course.getInstructor())) {
					course.setIname(user.getName());
				}
			}
		}
		session.put("courseList", courseList);
		Admin admin = (Admin)session.get("admin");
		User user = (User)session.get("user");
		if (admin != null) {
			return SUCCESS;	// 到管理员界面
		} else if(user != null) {
			if(user.getIden().equals(User.TEACHER)) {
				return TEACHER;	// 到老师界面
			} else if(user.getIden().equals(User.STUDENT)) {
				return STUDENT; // 到学生界面
			}
		}
		return ERROR;
	}

	public List<User> getTeacherList() {
		return teacherList;
	}

	public void setTeacherList(List<User> teacherList) {
		this.teacherList = teacherList;
	}

	public List<Course> getCourseList() {
		return courseList;
	}

	public void setCourseList(List<Course> courseList) {
		this.courseList = courseList;
	}

	public String getMessage() {
		return message;
	}

	public void setMessage(String message) {
		this.message = message;
	}

}
