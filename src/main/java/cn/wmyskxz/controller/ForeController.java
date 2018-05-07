package cn.wmyskxz.controller;

import cn.wmyskxz.pojo.*;
import cn.wmyskxz.service.*;
import com.github.pagehelper.PageHelper;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import javax.servlet.http.HttpSession;
import java.text.SimpleDateFormat;
import java.util.*;

/**
 * 前台控制器
 *
 * @author: @我没有三颗心脏
 * @create: 2018-04-29-下午 14:45
 */
@Controller
public class ForeController {

	@Autowired
	CategoryService categoryService;

	@Autowired
	ReferalLinkService referalLinkService;

	@Autowired
	ProductService productService;

	@Autowired
	PropertyValueService propertyValueService;

	@Autowired
	ReviewService reviewService;

	@Autowired
	UserService userService;

	@Autowired
	OrderItemService orderItemService;

	@Autowired
	OrderService orderService;


	/**
	 * 首页访问方法，给首页的JSP页面添加以下数据：
	 *
	 * @param model
	 * @return
	 */
	@RequestMapping("/home")
	public String home(Model model) {
		List<Category> categories = categoryService.list();
		productService.fill(categories);
		productService.fillByRow(categories);
		List<ReferalLink> links = referalLinkService.listAll();

		model.addAttribute("categories", categories);
		model.addAttribute("links", links);

		return "index";
	}

	@RequestMapping("/showProduct")
	public String showProduct(Model model, Integer product_id) {
		Product product = productService.get(product_id);
		productService.setReviewCount(product);
		model.addAttribute("product", product);
		List<PropertyValue> propertyValues = propertyValueService.listByProductId(product_id);
		model.addAttribute("propertyValues", propertyValues);
		List<Review> reviews = reviewService.listByProductId(product_id);
		model.addAttribute("reviews", reviews);
		return "product";
	}

	@RequestMapping("/searchProduct")
	public String searchProduct(Model model, String keyword) {

		PageHelper.offsetPage(0, 20);
		List<Product> products = productService.search(keyword);
		for (Product product : products) {
			product.setReviewCount(reviewService.getCount(product.getId()));
		}
		model.addAttribute("products", products);
		return "searchResult";
	}

	@RequestMapping("sortProduct")
	public String sortProduct(Model model, String sort, String keyword) {
		List<Product> products = productService.search(keyword);
		for (Product product : products) {
			product.setReviewCount(reviewService.getCount(product.getId()));
		}
		if (null != sort) {
			switch (sort) {
				case "all":
					Collections.sort(products, Comparator.comparing(Product::getSaleXReviewCount));
					break;
				case "reviewCount":
					Collections.sort(products, Comparator.comparing(Product::getReviewCount));
					break;
				case "date":
//					Collections.sort(products, comparing(Product::get));
					break;
				case "sale":
					Collections.sort(products, Comparator.comparing(Product::getSale));
					break;
				case "price":
					Collections.sort(products, Comparator.comparing(Product::getPrice));
					break;
			}
		}
		model.addAttribute("products", products);

		return "searchResult";
	}

	@RequestMapping("/login")
	public String login(Model model,
						@RequestParam("name") String name,
						@RequestParam("password") String password,
						HttpSession session) {
		User user = userService.get(name, password);
		if (null == user) {
			model.addAttribute("msg", "账号密码错误");
			return "loginPage";
		}
		session.setAttribute("user", user);
		return "redirect:home";
	}

	@RequestMapping("/logout")
	public String logout(HttpSession session) {
		session.removeAttribute("user");
		return "redirect:home";
	}

	@RequestMapping("/register")
	public String register(Model model, User user) {
		String name = user.getName();
		boolean exist = userService.isExist(name);

		if (exist) {
			String msg = "用户名已经被占用，不能使用";
			model.addAttribute("msg", msg);
			model.addAttribute("username", user.getName());
			return "registerPage";
		}
		userService.add(user);

		return "redirect:registerSuccessPage";
	}

	/**
	 * 立即购买（即新增OrderItem项）需要考虑以下两种情况：
	 * 1.如果这个产品已经存在于购物车中，那么只需要相应的调整数量就可以了
	 * 2.如果不存在对应的OrderItem项，那么就新增一个订单项（OrderItem）
	 * - 前提条件：已经登录
	 *
	 * @param product_id 产品的ID
	 * @param number     购买的数量
	 * @param session    session用于获取user信息
	 * @return
	 */
	@RequestMapping("/buyone")
	public String buyone(Integer product_id, Integer number, HttpSession session) {
		Product product = productService.get(product_id);
		int orderItemId = 0;

		User user = (User) session.getAttribute("user");
		boolean found = false;
		List<OrderItem> orderItems = orderItemService.listByUserId(user.getId());
		for (OrderItem orderItem : orderItems) {
			if (orderItem.getProduct_id().intValue() == product.getId().intValue()) {
				orderItem.setNumber(orderItem.getNumber() + number);
				orderItemService.update(orderItem);
				orderItemId = orderItem.getId();
				break;
			}
		}

		if (!found) {
			OrderItem orderItem = new OrderItem();
			orderItem.setUser_id(user.getId());
			orderItem.setNumber(number);
			orderItem.setProduct_id(product_id);
			orderItemService.add(orderItem);
			orderItemId = orderItem.getId();
		}

		return "redirect:buy?orderItemId=" + orderItemId;
	}

	@RequestMapping("buy")
	public String buy(Model model, String[] orderItemId, HttpSession session) {
		List<OrderItem> orderItems = new ArrayList<>();
		float total = 0;

		for (String strId : orderItemId) {
			int id = Integer.parseInt(strId);
			OrderItem oi = orderItemService.getById(id);
			total += oi.getProduct().getPrice() * oi.getNumber();
			orderItems.add(oi);
		}

		session.setAttribute("orderItems", orderItems);
		model.addAttribute("total", total);
		return "buyPage";
	}

	@RequestMapping("createOrder")
	public String createOrder(Model model, Order order, HttpSession session) {
		User user = (User) session.getAttribute("user");
		String orderCode = new SimpleDateFormat("yyyyMMddHHmmssSSS").format(new Date());
		order.setOrder_code(orderCode);
		order.setCreate_date(new Date());
		order.setUser_id(user.getId());
		order.setStatus(OrderService.waitPay);
		List<OrderItem> orderItems = (List<OrderItem>) session.getAttribute("orderItems");
		float total = orderService.add(order, orderItems);
		return "redirect:payPage?order_id=" + order.getId() + "&total=" + total;
	}

	@RequestMapping("payed")
	public String payed(int order_id, float total, Model model) {
		Order order = orderService.get(order_id);
		order.setStatus(OrderService.waitDelivery);
		order.setPay_date(new Date());
		orderService.update(order);
		model.addAttribute("o", order);
		return "payed";
	}

	/**
	 * 加入购物车方法，跟buyone()方法有些类似，但返回不同
	 * 仍然需要新增订单项OrderItem，考虑两个情况：
	 * 1.如果这个产品已经存在于购物车中，那么只需要相应的调整数量就可以了
	 * 2.如果不存在对应的OrderItem项，那么就新增一个订单项（OrderItem）
	 * - 前提条件：已经登录
	 *
	 * @param product_id
	 * @param num
	 * @param model
	 * @param session
	 * @return
	 */
	@RequestMapping("addCart")
	@ResponseBody
	public String addCart(int product_id, int num, Model model, HttpSession session) {
		Product p = productService.get(product_id);
		User user = (User) session.getAttribute("user");
		boolean found = false;

		List<OrderItem> ois = orderItemService.listByUserId(user.getId());
		for (OrderItem oi : ois) {
			if (oi.getProduct().getId().intValue() == p.getId().intValue()) {
				oi.setNumber(oi.getNumber() + num);
				orderItemService.update(oi);
				found = true;
				break;
			}
		}

		if (!found) {
			OrderItem oi = new OrderItem();
			oi.setUser_id(user.getId());
			oi.setNumber(num);
			oi.setProduct_id(product_id);
			orderItemService.add(oi);
		}

		return "success";
	}

	/**
	 * 查看购物车方法：
	 * 1.首先通过session获取到当前的用户
	 * 2.获取这个用户关联的订单项的集合
	 *
	 * @param model
	 * @param session
	 * @return
	 */
	@RequestMapping("/cart")
	public String cart(Model model, HttpSession session) {
		User user = (User) session.getAttribute("user");
		List<OrderItem> orderItems = orderItemService.listForCart(user.getId());
		model.addAttribute("orderItems", orderItems);
		return "cart";
	}

	@RequestMapping("/checkLogin")
	@ResponseBody
	public String checkLogin(HttpSession session) {
		User user = (User) session.getAttribute("user");
		if (null != user)
			return "success";
		return "fail";
	}

	@RequestMapping("changeOrderItem")
	@ResponseBody
	public String changeOrderItem(Model model, HttpSession session, int product_id, int number) {
		User user = (User) session.getAttribute("user");
		if (null == user)
			return "fail";

		List<OrderItem> ois = orderItemService.listByUserId(user.getId());
		for (OrderItem oi : ois) {
			if (oi.getProduct().getId().intValue() == product_id) {
				oi.setNumber(number);
				orderItemService.update(oi);
				break;
			}
		}
		return "success";
	}

	@RequestMapping("deleteOrderItem")
	@ResponseBody
	public String deleteOrderItem(Model model, HttpSession session, Integer orderItemId) {
		User user = (User) session.getAttribute("user");
		if (null == user)
			return "fail";
		orderItemService.delete(orderItemId);
		return "success";
	}

	@RequestMapping("bought")
	public String bought(Model model, HttpSession session) {
		User user = (User) session.getAttribute("user");
		List<Order> orders = orderService.list(user.getId(), OrderService.delete);
		orderItemService.fill(orders);
		model.addAttribute("orders", orders);

		return "bought";
	}

	@RequestMapping("confirmPay")
	public String confirmPay(Model model, Integer order_id) {
		Order order = orderService.get(order_id);
		orderItemService.fill(order);
		model.addAttribute("order", order);
		return "confirmPay";
	}

	@RequestMapping("orderConfirmed")
	public String orderConfirmed(Model model, Integer order_id) {
		Order o = orderService.get(order_id);
		o.setStatus(OrderService.waitReview);
		o.setConfirm_date(new Date());
		orderService.update(o);
		return "orderConfirmedPage";
	}

	@RequestMapping("deleteOrder")
	@ResponseBody
	public String deleteOrder(Model model, Integer order_id) {
		Order o = orderService.get(order_id);
		o.setStatus(OrderService.delete);
		orderService.update(o);
		return "success";
	}

	@RequestMapping("review")
	public String review(Model model, Integer order_id) {
		Order order = orderService.get(order_id);
		orderItemService.fill(order);
		Product product = order.getOrderItems().get(0).getProduct();
		List<Review> reviews = reviewService.listByProductId(product.getId());
		productService.setReviewCount(product);
		model.addAttribute("product", product);
		model.addAttribute("order", order);
		model.addAttribute("reviews", reviews);
		return "reviewPage";
	}

	@RequestMapping("doreview")
	public String doreview(Model model, HttpSession session,
						   @RequestParam("order_id") Integer order_id,
						   @RequestParam("product_id") Integer product_id,
						   String content) {

		Order order = orderService.get(order_id);
		order.setStatus(OrderService.finish);
		orderService.update(order);

		User user = (User) session.getAttribute("user");
		Review review = new Review();
		review.setContent(content);
		review.setProduct_id(product_id);
		review.setCreateDate(new Date());
		review.setUser_id(user.getId());
		reviewService.add(review);

		return "redirect:review?order_id=" + order_id + "&showonly=true";
	}

}
