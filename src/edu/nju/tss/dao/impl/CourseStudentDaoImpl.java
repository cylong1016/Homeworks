package edu.nju.tss.dao.impl;

import java.util.List;

import org.hibernate.Query;
import org.hibernate.Session;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import edu.nju.tss.dao.BaseDao;
import edu.nju.tss.dao.CourseStudentDao;
import edu.nju.tss.model.CourseStudent;

@Repository
public class CourseStudentDaoImpl implements CourseStudentDao {

	@Autowired
	private BaseDao baseDao;

	@Override
	public void save(CourseStudent cs) {
		baseDao.save(cs);
	}

	@Override
	public CourseStudent findCourseStudent(String stuid, String courseid) {
		Session session = baseDao.getSession();
		String hql = "from CourseStudent as cs where studentid = '" + stuid + "' and courseid = '" + courseid + "'";
		Query query = session.createQuery(hql);
		@SuppressWarnings("unchecked")
		List<CourseStudent> list = query.list();
		if (list.size() == 0) {
			return null;
		}
		return list.get(0);
	}

	@Override
	public List<CourseStudent> findStudent(String cid) {
		Session session = baseDao.getSession();
		String hql = "from CourseStudent as cs where courseid = '" + cid + "'";
		Query query = session.createQuery(hql);
		@SuppressWarnings("unchecked")
		List<CourseStudent> list = query.list();
		return list;
	}

	@Override
	public void delete(String stuid, String courseid) {
		Session session = baseDao.getSession();
		String hql = "delete CourseStudent as cs where studentid=? and courseid=?";
		Query query = session.createQuery(hql);
		query.setString(0, stuid);
		query.setString(1, courseid);
		query.executeUpdate();
	}

}
