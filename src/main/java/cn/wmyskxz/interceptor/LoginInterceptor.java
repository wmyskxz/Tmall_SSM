package cn.wmyskxz.interceptor;

import cn.wmyskxz.pojo.User;
import org.springframework.web.servlet.ModelAndView;
import org.springframework.web.servlet.handler.HandlerInterceptorAdapter;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import java.util.Arrays;

/**
 * 登录拦截器：
 *
 * @author: @我没有三颗心脏
 * @create: 2018-05-02-下午 19:28
 */
public class LoginInterceptor extends HandlerInterceptorAdapter {

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

		HttpSession session = request.getSession();
		String[] noNeedAuthPage = new String[]{
				"/home",
				"/searchProduct",
				"/sortProduct",
				"/showProduct",
				"/loginPage",
				"/login",
				"/registerPage",
				"/register",
				"/registerSuccessPage",
				"/test",
				"/checkLogin",
				"/admin"
		};
		String uri = request.getRequestURI();
		if (!Arrays.asList(noNeedAuthPage).contains(uri)) {
			User user = (User) session.getAttribute("user");
			if (null == user) {
				response.sendRedirect("/loginPage");
				return false;
			}
		}
		return true;
	}

	/**
	 * 在业务处理器处理请求执行完成后，生成视图之前执行的动作
	 * 可在 modelAndView 中加入数据，比如当前的时间
	 *
	 * @param request
	 * @param response
	 * @param handler
	 * @param modelAndView
	 * @throws Exception
	 */
	@Override
	public void postHandle(HttpServletRequest request, HttpServletResponse response, Object handler, ModelAndView modelAndView) throws Exception {
	}

	/**
	 * 在DispatcherServlet完全处理完请求后被调用，可用于清理资源等
	 * 当有拦截器抛出异常时，会从当前拦截器往回执行所有的拦截器的afterCompletion()方法
	 *
	 * @param request
	 * @param response
	 * @param handler
	 * @param ex
	 * @throws Exception
	 */
	@Override
	public void afterCompletion(HttpServletRequest request, HttpServletResponse response, Object handler, Exception ex) throws Exception {
		super.afterCompletion(request, response, handler, ex);
	}
}
