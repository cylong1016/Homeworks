package edu.nju.tss.action;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;

import edu.nju.tss.model.Course;
import edu.nju.tss.service.CourseManageService;

@Controller
public class SetCourseAction extends BaseAction {

	/** serialVersionUID */
	private static final long serialVersionUID = -5631473478930386952L;
	@Autowired
	private CourseManageService courseService;
	private Course course;
	private String message;

	public String setCourse() {
		if(session.get("admin") == null) {
			return ERROR;
		}
		String semester = request.getParameter("course.semester");
		course.setSemester(semester);
		courseService.setCourse(course);
		message = course.getCname() + "课程已添加！";
		return SUCCESS;
	}

	public Course getCourse() {
		return course;
	}

	public void setCourse(Course course) {
		this.course = course;
	}

	public String getMessage() {
		return message;
	}

	public void setMessage(String message) {
		this.message = message;
	}

}
