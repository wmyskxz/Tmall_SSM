package cn.wmyskxz.service;

import cn.wmyskxz.pojo.Category;
import cn.wmyskxz.pojo.Product;

import java.util.List;

public interface ProductService {

	/**
	 * 增加一条数据
	 *
	 * @param product
	 */
	void add(Product product);

	/**
	 * 通过id删除一条数据
	 *
	 * @param id
	 */
	void delete(Integer id);

	/**
	 * 更新一条数据
	 *
	 * @param product
	 */
	void update(Product product);

	/**
	 * 根据id获取一条数据
	 *
	 * @param id
	 * @return
	 */
	Product get(Integer id);

	/**
	 * 根据category_id返回所有对应的Product数据
	 *
	 * @param category_id
	 * @return
	 */
	List<Product> list(Integer category_id);

	/**
	 * 为多个分类填充产品集合
	 *
	 * @param categories
	 */
	void fill(List<Category> categories);

	/**
	 * 为一个分类填充产品集合
	 *
	 * @param category
	 */
	void fill(Category category);

	/**
	 * 为多个分类填充产品集合
	 *
	 * @param categories
	 */
	void fillByRow(List<Category> categories);

	/**
	 * 为产品填充ReviewCount字段
	 *
	 * @param product
	 */
	void setReviewCount(Product product);

	/**
	 * 根据keyword返回相应的产品集合
	 *
	 * @param keyword
	 * @return
	 */
	List<Product> search(String keyword);
}
