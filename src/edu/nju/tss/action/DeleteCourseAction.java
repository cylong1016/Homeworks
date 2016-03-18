package edu.nju.tss.action;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;

import edu.nju.tss.model.Course;
import edu.nju.tss.service.CourseManageService;

@Controller
public class DeleteCourseAction extends BaseAction {

	/** serialVersionUID */
	private static final long serialVersionUID = -7535940909001650186L;

	@Autowired
	private CourseManageService courseService;
	private Course course;
	private String message;

	public String deleteCourse() {
		if(session.get("admin") == null) {
			return ERROR;
		}
		String id = request.getParameter("id");
		course = new Course();
		course.setId(id);
		courseService.delete(course);
		message = "{'message': '删除成功 '}";
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
