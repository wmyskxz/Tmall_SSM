package cn.wmyskxz.service;

import cn.wmyskxz.pojo.PropertyValue;

import java.util.List;

public interface PropertyValueService {

	/**
	 * 增加一条属性
	 *
	 * @param propertyValue
	 */
	void add(PropertyValue propertyValue);

	/**
	 * 根据id删除一条数据
	 *
	 * @param id
	 */
	void delete(Integer id);

	/**
	 * 根据 product_id 来删除对应的数据
	 *
	 * @param product_id
	 */
	void deleteByProductId(Integer product_id);

	/**
	 * 更新一条数据
	 *
	 * @param propertyValue
	 */
	void update(PropertyValue propertyValue);

	/**
	 * PropertyValue 表有两个外键，需要根据这两个外键进行匹配
	 * 返回对应的所有 PropertyValue 值
	 *
	 * @return
	 */
	List<PropertyValue> list(Integer product_id, Integer category_id);

	/**
	 * 根据id返回一条数据
	 *
	 * @param id
	 */
	PropertyValue get(Integer id);

	/**
	 * 根据product_id返回PropertyValue，
	 * 并设置好自身的Property
	 *
	 * @param product_id
	 * @return
	 */
	List<PropertyValue> listByProductId(Integer product_id);
}
