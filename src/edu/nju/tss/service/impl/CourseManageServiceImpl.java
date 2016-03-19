package edu.nju.tss.service.impl;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import edu.nju.tss.dao.CourseDao;
import edu.nju.tss.model.Course;
import edu.nju.tss.service.CourseManageService;

@Service
public class CourseManageServiceImpl implements CourseManageService {

	@Autowired
	private CourseDao courseDao;

	@Override
	public String setCourse(Course course) {
		courseDao.save(course);
		return null;
	}

	@Override
	public List<Course> courseList() {
		return courseDao.list();
	}

	@Override
	public void delete(Course course) {
		courseDao.delete(course);
	}

	@Override
	public void update(Course course) {
		courseDao.update(course);
	}

	@Override
	public Course findCourse(String cid) {
		return courseDao.find(cid);
	}

}
