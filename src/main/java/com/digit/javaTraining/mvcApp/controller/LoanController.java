package com.digit.javaTraining.mvcApp.controller;

import java.io.IOException;
import java.sql.ResultSet;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.digit.javaTraining.mvcApp.model.BankApp;

@WebServlet("/loan")
public class LoanController extends HttpServlet {
	@Override
	protected void service(HttpServletRequest req, HttpServletResponse res) throws ServletException, IOException {
		int loanId = Integer.parseInt((String) req.getParameter("loan-type"));
		BankApp bankApp = new BankApp();
		ResultSet result = bankApp.loan(loanId);
		HttpSession session = req.getSession();
		try {
			if (result.next()) {
				session.setAttribute("loan_type", result.getString("loan_type"));
            	session.setAttribute("loan_tenure", result.getInt("tenure"));
            	session.setAttribute("loan_interest", result.getInt("interest"));
            	session.setAttribute("loan_description", result.getString("description"));
            	
                res.sendRedirect("loanDetail.jsp");
			}else { 
				res.sendRedirect("loanFailed.html");
			}
		} catch (Exception e) {
			e.printStackTrace();
		}
	}
}
