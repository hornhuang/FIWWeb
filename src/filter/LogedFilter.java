package filter;

import java.io.IOException;
import javax.servlet.Filter;
import javax.servlet.FilterChain;
import javax.servlet.FilterConfig;
import javax.servlet.ServletException;
import javax.servlet.ServletRequest;
import javax.servlet.ServletResponse;
import javax.servlet.annotation.WebFilter;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

/**
 * Servlet Filter implementation class LogedFilter
 */
@WebFilter("*.jsp")
public class LogedFilter implements Filter {
 
	/**
	 * @see Filter#doFilter(ServletRequest, ServletResponse, FilterChain)
	 */
	public void doFilter(ServletRequest request, ServletResponse response, FilterChain chain) throws IOException, ServletException {
		if (((HttpServletRequest)request).getRequestURI().indexOf("loginForm.jsp") > 0) {
			chain.doFilter(request, response);
			return;
		}else if(((HttpServletRequest)request).getSession().getAttribute("name") == null) {
			((HttpServletResponse)response).sendRedirect("/MyJspProject/lessen/exp_6/loginForm.jsp");
			return;
		}
		chain.doFilter(request, response);
		// pass the request along the filter chain
	}

	@Override
	public void destroy() {
		// TODO Auto-generated method stub
		
	}

	@Override
	public void init(FilterConfig filterConfig) throws ServletException {
		// TODO Auto-generated method stub
		
	}

}
