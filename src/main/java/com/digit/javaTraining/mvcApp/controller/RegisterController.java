package com.digit.javaTraining.mvcApp.controller;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.digit.javaTraining.mvcApp.model.BankApp;

@WebServlet("/register")
public class RegisterController extends HttpServlet {
	@Override
	protected void service(HttpServletRequest req, HttpServletResponse res) throws ServletException, IOException {
		
		BankApp bankApp = new BankApp();
		bankApp.setBank_id(Integer.parseInt(req.getParameter("bank_id")));
		bankApp.setBank_name(req.getParameter("bank_name"));
		bankApp.setIfsc_code(req.getParameter("ifsc_code"));
		bankApp.setBalance(Integer.parseInt(req.getParameter("balance")));
		bankApp.setEmail(req.getParameter("email"));
		bankApp.setPhone(Long.parseLong(req.getParameter("phone")));
		bankApp.setCustomer_name(req.getParameter("customer_name"));
		bankApp.setCust_id(Integer.parseInt(req.getParameter("customer_id")));
		bankApp.setPin(Integer.parseInt(req.getParameter("pin")));
		bankApp.setAcc_no(Integer.parseInt(req.getParameter("account_no")));
		
		boolean b = bankApp.register();
		if(b==true) {
			res.sendRedirect("RegisterSuccess.html");
		}
		else {
			res.sendRedirect("RegisterFail.html");
		}
	}
}
