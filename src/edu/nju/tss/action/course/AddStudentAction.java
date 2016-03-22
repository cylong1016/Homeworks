package edu.nju.tss.action.course;

import java.util.HashMap;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;

import edu.nju.tss.action.BaseAction;
import edu.nju.tss.model.CourseAssistants;
import edu.nju.tss.model.CourseStudent;
import edu.nju.tss.model.User;
import edu.nju.tss.service.CourseManageService;
import edu.nju.tss.service.UserManageService;
import net.sf.json.JSONObject;

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
		//将数据存储在map里，再转换成json类型数据，也可以自己手动构造json类型数据 
		Map<String,Object> map = new HashMap<String,Object>(); 
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
			map.put("message", "添加成功！"); 
			map.put("tableID", "student_list_table");
			map.put("user", student);
			JSONObject json = JSONObject.fromObject(map); //将map对象转换成json类型数据 
			message = json.toString();
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
