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
@Order(1) //���Ͱ� �������� ��� ���� ����
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
			//��� �������� �ش��ϱ⶧���� �����̷�Ʈ ��� ����
		}
		
		if(btitle == "") {
			//�׳� ����
		}
			
		chain.doFilter(request, response);
	}

	@Override
	public void destroy() {
		// TODO Auto-generated method stub
		
	}

}
