package cn.wmyskxz.service;

import cn.wmyskxz.pojo.Property;

import java.util.List;

public interface PropertyService {

	/**
	 * 增加一条属性
	 * @param property
	 */
	void add(Property property);

	/**
	 * 根据id删除一条数据
	 * @param id
	 */
	void delete(Integer id);

	/**
	 * 更新一条数据
	 * @param property
	 */
	void update(Property property);

	/**
	 * 返回所有的category_id下的Property列表
	 * @return
	 */
	List<Property> list(Integer category_id);

	/**
	 * 根据id返回一条数据
	 * @param id
	 */
	Property get(Integer id);
}
