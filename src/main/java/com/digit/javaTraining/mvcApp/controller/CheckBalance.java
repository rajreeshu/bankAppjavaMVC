package com.digit.javaTraining.mvcApp.controller;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.digit.javaTraining.mvcApp.model.BankApp;

@WebServlet("/checkBalance")
public class CheckBalance extends HttpServlet{
	@Override
	protected void service(HttpServletRequest req, HttpServletResponse res) throws ServletException, IOException {
		HttpSession session = req.getSession();
		int accNo = (int) session.getAttribute("accno");
		String cust_name = (String) session.getAttribute("cust_name");
		BankApp bankApp = new BankApp();
		bankApp.setAcc_no(accNo);
		int acc_bal = bankApp.checkBalance();
		if(acc_bal>0) {
			session.setAttribute("balance", acc_bal);
			res.sendRedirect("checkBalance.jsp");
		}else {
			res.sendRedirect("balanceFail.html");
		}
	}
}
