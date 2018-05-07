package cn.wmyskxz.service;

import cn.wmyskxz.pojo.Order;
import cn.wmyskxz.pojo.OrderItem;

import java.util.List;

public interface OrderItemService {

	/**
	 * 通过id返回OrderItem项
	 *
	 * @param id
	 * @return
	 */
	OrderItem getById(Integer id);

	/**
	 * 增加一条订单数据
	 *
	 * @param orderItem
	 */
	void add(OrderItem orderItem);

	/**
	 * 通过订单id查询到该订单下所有的Item
	 *
	 * @param order_id
	 * @return
	 */
	List<OrderItem> getByOrderId(Integer order_id);

	/**
	 * 更新OrderItem，也只是更新number属性
	 *
	 * @param orderItem
	 */
	void update(OrderItem orderItem);

	/**
	 * 根据user_id来该用户下对应的所有订单项
	 *
	 * @param user_id
	 * @return
	 */
	List<OrderItem> listByUserId(Integer user_id);

	/**
	 * 返回当前user_id下的购物车订单列表
	 *
	 * @param user_id
	 * @return
	 */
	List<OrderItem> listForCart(Integer user_id);

	/**
	 * 通过id删除订单项
	 *
	 * @param id
	 */
	void delete(Integer id);

	/**
	 * 为List<Order>填充订单项
	 *
	 * @param orders
	 */
	void fill(List<Order> orders);

	/**
	 * 为Order填充订单项
	 *
	 * @param o
	 */
	void fill(Order o);
}
