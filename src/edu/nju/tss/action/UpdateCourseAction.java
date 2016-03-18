package edu.nju.tss.action;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;

import edu.nju.tss.model.Course;
import edu.nju.tss.service.CourseManageService;

@Controller
public class UpdateCourseAction extends BaseAction {

	/** serialVersionUID */
	private static final long serialVersionUID = 1895855289895658605L;
	@Autowired
	private CourseManageService courseService;
	private Course course;
	private String message;

	public String updateCourse() {
		courseService.update(course);
		message = "{'message': '更新成功 '}";
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
