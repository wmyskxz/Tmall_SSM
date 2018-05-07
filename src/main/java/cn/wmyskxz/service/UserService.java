package cn.wmyskxz.service;

import cn.wmyskxz.pojo.User;

import java.util.List;

public interface UserService {

	/**
	 * 返回所有的用户
	 *
	 * @return
	 */
	List<User> list();

	/**
	 * 更改用户密码
	 *
	 * @param id
	 * @param password
	 */
	void updatePassword(int id, String password);

	/**
	 * 根据id获取用户
	 *
	 * @param id
	 * @return
	 */
	User get(Integer id);

	/**
	 * 根据用户名和密码来查询用户
	 *
	 * @param name
	 * @param password
	 * @return
	 */
	User get(String name, String password);

	/**
	 * 根据用户名判断用户是否存在
	 *
	 * @param name
	 * @return
	 */
	boolean isExist(String name);

	/**
	 * 增加一条用户数据
	 *
	 * @param user
	 */
	void add(User user);
}
