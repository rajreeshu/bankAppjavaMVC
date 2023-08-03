package com.digit.javaTraining.mvcApp.controller;

import java.io.IOException;
import java.sql.DriverManager;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.digit.javaTraining.mvcApp.model.BankApp;

@WebServlet("/changePin")
public class ChangePinController extends HttpServlet{
	@Override
	protected void service(HttpServletRequest req, HttpServletResponse res) throws ServletException, IOException {
		int prevPin = Integer.parseInt(req.getParameter("prevPin"));
		int newPin = Integer.parseInt(req.getParameter("newPin"));
		int cnfrmPin = Integer.parseInt(req.getParameter("cnfrmPin"));
		
		HttpSession session = req.getSession();
		
		int acc_no = (int)session.getAttribute("accno");
		BankApp bankApp = new BankApp();
		bankApp.setAcc_no(acc_no);
		bankApp.setPin(prevPin);
		if(newPin==cnfrmPin) {
			boolean chg = bankApp.changePin(newPin);
			if(chg) {
				res.sendRedirect("changePasswordSuccess.jsp");
			}else {
				res.sendRedirect("changePasswordFail.jsp");
			}
			
		}else {
			res.sendRedirect("changePasswordFail.jsp");
		}
	}
}
