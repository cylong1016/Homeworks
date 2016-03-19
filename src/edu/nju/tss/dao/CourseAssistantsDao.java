package edu.nju.tss.dao;

import java.util.List;

import edu.nju.tss.model.CourseAssistants;

public interface CourseAssistantsDao {

	/**
	 * 像数据库中添加课程助教信息
	 * @param ca
	 * @author cylong
	 * @version 2016年3月20日 上午3:58:47
	 */
	public void save(CourseAssistants ca);

	public CourseAssistants findCourseAssistant(String assid, String courseid);

	public List<CourseAssistants> findAssistant(String cid);

	public void delete(String assid, String courseid);
}
