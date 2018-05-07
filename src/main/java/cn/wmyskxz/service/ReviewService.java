package cn.wmyskxz.service;

import cn.wmyskxz.pojo.Review;

import java.util.List;

public interface ReviewService {

	/**
	 * 增加一条评论
	 *
	 * @param review
	 */
	void add(Review review);

	/**
	 * 删除一条评论
	 *
	 * @param id
	 */
	void delete(int id);

	/**
	 * 更新一条评论
	 *
	 * @param review
	 */
	void update(Review review);

	/**
	 * 通过id返回一条Review
	 *
	 * @param id
	 * @return
	 */
	Review get(int id);

	/**
	 * 根据product_id来返回当前产品下的所有评论
	 *
	 * @param product_id
	 * @return
	 */
	List<Review> listByProductId(Integer product_id);

	/**
	 * 返回当前产品下评论的数量
	 *
	 * @param product_id
	 * @return
	 */
	int getCount(int product_id);
}
