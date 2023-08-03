package com.digit.javaTraining.mvcApp.controller;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.digit.javaTraining.mvcApp.model.BankApp;

@WebServlet("/login")
public class LoginController extends HttpServlet{
	@Override
	protected void service(HttpServletRequest req, HttpServletResponse res) throws ServletException, IOException {
		HttpSession session = req.getSession();
		
		BankApp bankApp = new BankApp();
		bankApp.setCust_id(Integer.parseInt(req.getParameter("customer_id")));
		bankApp.setPin(Integer.parseInt(req.getParameter("pin")));
				
		boolean isLogin = bankApp.login();
		if(isLogin) {
			session.setAttribute("accno", bankApp.getAcc_no());
			session.setAttribute("cust_name", bankApp.getCustomer_name());

			res.sendRedirect("home.jsp");
		}else {
			res.sendRedirect("loginFailed.html");
		}
	}
}
