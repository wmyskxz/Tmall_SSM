package cn.wmyskxz.controller;

import cn.wmyskxz.pojo.Order;
import cn.wmyskxz.service.OrderService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import java.util.Date;
import java.util.List;

/**
 * Order 控制器
 *
 * @author: @我没有三颗心脏
 * @create: 2018-04-29-上午 10:22
 */
@Controller
@RequestMapping("/admin")
public class OrderController {

	@Autowired
	OrderService orderService;

	@RequestMapping("/listOrder")
	public String list(Model model) {
		List<Order> orders = orderService.listAll();
		model.addAttribute("orders", orders);
		return "admin/listOrder";
	}

	@RequestMapping("updateOrder")
	public String update(Order order) {
		orderService.update(order);
		return "redirect:listOrder";
	}

	@RequestMapping("orderDelivery")
	public String delivery(Integer order_id) {
		Order order = orderService.get(order_id);
		order.setDelivery_date(new Date());
		order.setStatus(OrderService.waitConfirm);
		orderService.update(order);
		return "redirect:listOrder";
	}
}
