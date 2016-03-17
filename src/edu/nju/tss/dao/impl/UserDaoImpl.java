package edu.nju.tss.dao.impl;

import java.util.List;

import org.hibernate.Criteria;
import org.hibernate.Session;
import org.hibernate.criterion.Restrictions;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import edu.nju.tss.dao.BaseDao;
import edu.nju.tss.dao.UserDao;
import edu.nju.tss.model.User;

@Repository
public class UserDaoImpl implements UserDao {

	@Autowired
	private BaseDao baseDao;

	/**
	 * @see edu.nju.tss.dao.UserDao#save(edu.nju.tss.model.User)
	 */
	public void save(User user) {
		baseDao.save(user);
	}

	/**
	 * @see edu.nju.tss.dao.UserDao#find(java.lang.String, java.lang.String, java.lang.Class)
	 */
	public Object find(String column, String value, Class<?> c) {
		Session session = baseDao.getSession();
		Criteria criteria = session.createCriteria(c);
		criteria.add(Restrictions.eq(column, value));
		List<?> list = criteria.list();
		if (list.isEmpty()) {
			return null;
		}
		return list.get(0);
	}

	/**
	 * @see edu.nju.tss.dao.UserDao#updateByUserid(edu.nju.tss.model.User)
	 */
	public void updateByUserid(User user) {

	}

	@Override
	public List<?> list() {
		Session session = baseDao.getSession();
		Criteria criteria = session.createCriteria(User.class);
		List<?> list = criteria.list();
		return list;
	}

	@Override
	public void delete(User user) {
		baseDao.delete(user);
	}

}
