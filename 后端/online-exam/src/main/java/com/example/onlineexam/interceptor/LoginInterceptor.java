package com.example.onlineexam.interceptor;

import org.springframework.web.servlet.HandlerInterceptor;
import org.springframework.web.servlet.ModelAndView;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

public class LoginInterceptor implements HandlerInterceptor {

	
	@Override
	public boolean preHandle(HttpServletRequest request,
                             HttpServletResponse response, Object handler) throws Exception {

		HttpSession session = request.getSession();
		String st= (String) session.getAttribute("student");
		String ad= (String) session.getAttribute("admin");
		String te= (String) session.getAttribute("teacher");

		if(st != null){
				return true;
		}
		if(ad != null){
			return true;
		}
		if(te != null){
			return true;
		}
		else{
			response.sendRedirect("/login");
			return false;
		}



	}

	@Override
	public void postHandle(HttpServletRequest request,
                           HttpServletResponse response, Object handler,
                           ModelAndView modelAndView) throws Exception {
		// TODO Auto-generated method stub
		
	}

	@Override
	public void afterCompletion(HttpServletRequest request,
                                HttpServletResponse response, Object handler, Exception ex)
			throws Exception {
		// TODO Auto-generated method stub
		
	}

}
