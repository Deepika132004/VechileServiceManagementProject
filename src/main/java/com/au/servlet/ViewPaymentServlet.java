package com.au.servlet;

import java.io.IOException;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.au.dao.PaymentDAO;
import com.au.model.Payment;

@WebServlet("/ViewPaymentServlet")
public class ViewPaymentServlet extends HttpServlet {

    @Override
    protected void doGet(
            HttpServletRequest request,
            HttpServletResponse response)
            throws ServletException, IOException {

        // Create DAO object
        PaymentDAO dao = new PaymentDAO();

        // Get all payments from database
        List<Payment> payments =
                dao.getAllPayments();

        // Send payments to JSP
        request.setAttribute(
                "payments",
                payments
        );

        // Forward to JSP
        request.getRequestDispatcher(
                "viewPayments.jsp"
        ).forward(request, response);
    }
}
