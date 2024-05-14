package ezen.dteam.filter;

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

import org.springframework.core.annotation.Order;
import org.springframework.stereotype.Component;

@WebFilter({"/*"})
@Component
@Order(1) //필터가 여러개일 경우 순서 지정
public class InquriyFilter implements Filter{

	@Override
	public void init(FilterConfig filterConfig) throws ServletException {
		// TODO Auto-generated method stub
		
	}

	@Override
	public void doFilter(ServletRequest request, ServletResponse response, FilterChain chain)
			throws IOException, ServletException {
		HttpServletRequest httpRequest = (HttpServletRequest) request;
		HttpServletResponse httpResponse = (HttpServletResponse) response;
		
		String bno = request.getParameter("bno");
		String btitle = request.getParameter("btitle");
		String bcontent = request.getParameter("bcontent");
		String replyContent = request.getParameter("replyContent");
		String icmtno = request.getParameter("icmtno");
		
		
		if(bno == null || btitle == null || bcontent == null || replyContent == null || icmtno == null) {
			//모든 페이지에 해당하기때문에 리다이렉트 계속 나옴
		}
		
		if(btitle == "") {
			//그냥 만들어봄
		}
			
		chain.doFilter(request, response);
	}

	@Override
	public void destroy() {
		// TODO Auto-generated method stub
		
	}

}
