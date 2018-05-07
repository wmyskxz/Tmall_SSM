package cn.wmyskxz.service;

import cn.wmyskxz.pojo.Category;

import java.util.List;

public interface CategoryService {

	/**
	 * 返回分类列表
	 * @return
	 */
	List<Category> list();

	/**
	 * 通过id获取对应的数据
	 * @param id
	 * @return
	 */
	Category get(Integer id);

	/**
	 * 更新分类
	 * @param category
	 * @return
	 */
	void update(Category category);
}
