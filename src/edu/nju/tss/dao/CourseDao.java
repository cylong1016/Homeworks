package edu.nju.tss.dao;

import java.util.List;

import edu.nju.tss.model.Course;

public interface CourseDao {

	/**
	 * 像数据库中添加课程
	 * @param course
	 * @author cylong
	 * @version 2016年3月18日 下午6:38:20
	 */
	public void save(Course course);

	/**
	 * 全部的课程
	 * @return
	 * @author cylong
	 * @version 2016年3月18日 下午8:40:33
	 */
	public List<Course> list();

	/**
	 * 删除课程
	 * @param course
	 * @author cylong
	 * @version 2016年3月19日  上午12:28:51
	 */
	public void delete(Course course);

	/**
	 * 更新课程信息
	 * @param course
	 * @author cylong
	 * @version 2016年3月19日  上午12:42:39
	 */
	public void update(Course course);
}
