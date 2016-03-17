package edu.nju.tss.dao;

import java.util.List;

import edu.nju.tss.model.User;

public interface UserDao {

	/**
	 * 像数据库中插入一条user记录
	 * @param user
	 * @author cylong
	 * @version 2016年3月16日 上午1:52:03
	 */
	public void save(User user);

	/**
	 * 根据参数列名和这个列上的值查找数据库表对象,如果找到则返回这个对象,否则返回null
	 * @param column 列名
	 * @param value 列值
	 * @param c 类型
	 * @return
	 * @author cylong
	 * @version 2016年3月16日 上午1:54:20
	 */
	public Object find(String column, String value, Class<?> c);

	/**
	 * 根据id更新user表的一条记录
	 * @param user
	 * @author cylong
	 * @version 2016年3月16日 上午1:52:27
	 */
	public void updateByUserid(User user);
	
	/**
	 * 返回全部的用户列表
	 * @return
	 * @author cylong
	 * @version 2016年3月16日  下午4:24:53
	 */
	public List<?> list();
	
	/**
	 * 删除用户
	 * @param user
	 * @author cylong
	 * @version 2016年3月16日  下午5:59:57
	 */
	public void delete(User user);

}
