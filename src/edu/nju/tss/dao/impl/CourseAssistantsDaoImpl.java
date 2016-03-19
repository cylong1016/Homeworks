package edu.nju.tss.dao.impl;

import java.util.List;

import org.hibernate.Query;
import org.hibernate.Session;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import edu.nju.tss.dao.BaseDao;
import edu.nju.tss.dao.CourseAssistantsDao;
import edu.nju.tss.model.CourseAssistants;

@Repository
public class CourseAssistantsDaoImpl implements CourseAssistantsDao {

	@Autowired
	private BaseDao baseDao;

	@Override
	public void save(CourseAssistants ca) {
		baseDao.save(ca);
	}

	@Override
	public CourseAssistants findCourseAssistant(String assid, String courseid) {
		Session session = baseDao.getSession();
		String hql = "from CourseAssistants as ca where assistantid = '" + assid + "' and courseid = '" + courseid + "'";
		Query query = session.createQuery(hql);
		@SuppressWarnings("unchecked")
		List<CourseAssistants> list = query.list();
		if(list.size() == 0) {
			return null;
		}
		return list.get(0);
	}

	@Override
	public List<CourseAssistants> findAssistant(String cid) {
		Session session = baseDao.getSession();
		String hql = "from CourseAssistants as ca where courseid = '" + cid + "'";
		Query query = session.createQuery(hql);
		@SuppressWarnings("unchecked")
		List<CourseAssistants> list = query.list();
		return list;
	}

	@Override
	public void delete(String assid, String courseid) {
		Session session = baseDao.getSession();
		String hql = "delete CourseAssistants as ca where assistantid=? and courseid=?";
		Query query = session.createQuery(hql);
		query.setString(0, assid);
		query.setString(1, courseid);
		query.executeUpdate();
	}

}
