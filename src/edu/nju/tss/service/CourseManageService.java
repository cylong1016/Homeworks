package edu.nju.tss.service;

import java.util.List;

import edu.nju.tss.model.Course;
import edu.nju.tss.model.CourseAssistants;
import edu.nju.tss.model.User;

public interface CourseManageService {

	public String setCourse(Course course);

	public List<Course> courseList();

	public void delete(Course course);

	public void update(Course course);

	public Course findCourse(String cid);

	public void addCourseAssistant(String courseid, String assid);

	public CourseAssistants findCourseAssistant(String assid, String courseid);

	public List<User> findAssistant(String cid);

	public void deleteAssistant(String assid, String courseid);

}
