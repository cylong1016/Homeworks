package edu.nju.tss.dao.impl;

import java.util.List;

import org.hibernate.Criteria;
import org.hibernate.Session;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import edu.nju.tss.dao.BaseDao;
import edu.nju.tss.dao.CourseDao;
import edu.nju.tss.model.Course;

@Repository
public class CourseDaoImpl implements CourseDao {

	@Autowired
	private BaseDao baseDao;

	@Override
	public void save(Course course) {
		baseDao.save(course);
	}

	@SuppressWarnings("unchecked")
	@Override
	public List<Course> list() {
		Session session = baseDao.getSession();
//		String hql = "select c.id as id, c.cname as cname, u.name as instructor, c.semester as semester, c.description as description"
//				+ "from User as u, Course as c where c.instructor = u.userid";
//		Query query = session.createQuery(hql);
		Criteria criteria = session.createCriteria(Course.class);
		List<Course> list = criteria.list();
		return list;
	}

	@Override
	public void delete(Course course) {
		baseDao.delete(course);
	}

	@Override
	public void update(Course course) {
		baseDao.update(course);
	}

}
