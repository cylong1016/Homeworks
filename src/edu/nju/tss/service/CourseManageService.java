package edu.nju.tss.service;

import java.util.List;

import edu.nju.tss.model.Course;

public interface CourseManageService {

	public String setCourse(Course course);

	public List<Course> courseList();

	public void delete(Course course);

	public void update(Course course);

	public Course findCourse(String cid);

}
