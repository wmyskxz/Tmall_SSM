package cn.wmyskxz.service;

import cn.wmyskxz.pojo.Order;
import cn.wmyskxz.pojo.OrderItem;

import java.util.List;

public interface OrderService {

	String waitPay = "waitPay";
	String waitDelivery = "waitDelivery";
	String waitConfirm = "waitConfirm";
	String waitReview = "waitReview";
	String finish = "finish";
	String delete = "delete";

	/**
	 * 根据ID返回对应的Order
	 *
	 * @param id
	 * @return
	 */
	Order get(int id);

	/**
	 * 返回所有的订单
	 *
	 * @return
	 */
	List<Order> listAll();

	/**
	 * 按照用户、订单状态来查询
	 *
	 * @param user_id
	 * @param excludedStatus
	 * @return
	 */
	List<Order> list(Integer user_id, String excludedStatus);

	/**
	 * 返回user_id下的所有订单
	 *
	 * @param user_id
	 * @return
	 */
	List<Order> listByUserId(Integer user_id);

	/**
	 * 更新订单
	 *
	 * @param order
	 */
	void update(Order order);

	/**
	 * 增加订单
	 *
	 * @param order
	 */
	void add(Order order);

	/**
	 * 增加订单，返回一个float类型的数值用来表示该订单的总价
	 *
	 * @param order
	 * @param orderItems
	 * @return
	 */
	float add(Order order, List<OrderItem> orderItems);
}
