package cn.wmyskxz.interceptor;

import cn.wmyskxz.pojo.OrderItem;
import cn.wmyskxz.pojo.User;
import cn.wmyskxz.service.CategoryService;
import cn.wmyskxz.service.OrderItemService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.servlet.ModelAndView;
import org.springframework.web.servlet.handler.HandlerInterceptorAdapter;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import java.util.List;

/**
 * 其他拦截器
 *
 * @author: @我没有三颗心脏
 * @create: 2018-05-06-下午 15:48
 */
public class OtherInterceptor extends HandlerInterceptorAdapter {

	@Autowired
	CategoryService categoryService;
	@Autowired
	OrderItemService orderItemService;

	/**
	 * 在业务处理器处理请求之前被调用
	 * - 如果返回false
	 * 从当前的拦截器往回执行所有拦截器的afterCompletion()方法，再退出拦截器链
	 * - 如果返回true
	 * 执行下一个拦截器，知道素有的拦截器都执行完毕
	 * 再执行被拦截的Controller
	 * 然后进入拦截器链，
	 * 从最后一个拦截器往回执行所有的postHandel()方法
	 * 接着再从最后一个拦截器往回执行所有的afterCompletion()方法
	 *
	 * @param request
	 * @param response
	 * @param handler
	 * @return
	 * @throws Exception
	 */
	@Override
	public boolean preHandle(HttpServletRequest request, HttpServletResponse response, Object handler) throws Exception {
		return true;
	}

	/**
	 * 在业务处理器处理请求执行完成后,生成视图之前执行的动作
	 * 可在modelAndView中加入数据，比如当前时间
	 */

	public void postHandle(HttpServletRequest request,
						   HttpServletResponse response, Object handler,
						   ModelAndView modelAndView) throws Exception {

		/* 这里是获取购物车中一共有多少数量 */
		HttpSession session = request.getSession();
		User user = (User) session.getAttribute("user");
		int cartTotalItemNumber = 0;
		if (null != user) {
			List<OrderItem> ois = orderItemService.listForCart(user.getId());
			for (OrderItem oi : ois) {
				cartTotalItemNumber += oi.getNumber();
			}
		}
		session.setAttribute("cartTotalItemNumber", cartTotalItemNumber);
	}

	/**
	 * 在DispatcherServlet完全处理完请求后被调用,可用于清理资源等
	 * <p>
	 * 当有拦截器抛出异常时,会从当前拦截器往回执行所有的拦截器的afterCompletion()
	 */

	public void afterCompletion(HttpServletRequest request,
								HttpServletResponse response, Object handler, Exception ex)
			throws Exception {

//        System.out.println("afterCompletion(), 在访问视图之后被调用");
	}
}
