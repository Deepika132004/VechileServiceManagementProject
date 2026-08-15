package com.au.servlet;

import java.io.IOException;
import java.sql.Date;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.au.dao.PaymentDAO;
import com.au.dao.ServiceDAO;
import com.au.model.Payment;
import com.au.model.Service;

@WebServlet("/PaymentServlet")
public class PaymentServlet extends HttpServlet {

    // Display payment form
    @Override
    protected void doGet(
            HttpServletRequest request,
            HttpServletResponse response)
            throws ServletException, IOException {

        ServiceDAO serviceDAO = new ServiceDAO();

        List<Service> services =
                serviceDAO.getAllServices();

        request.setAttribute(
                "services",
                services
        );

        request.getRequestDispatcher(
                "payment.jsp"
        ).forward(request, response);
    }


    // Save payment
    @Override
    protected void doPost(
            HttpServletRequest request,
            HttpServletResponse response)
            throws ServletException, IOException {

        int serviceId =
                Integer.parseInt(
                        request.getParameter("serviceId")
                );

        double amount =
                Double.parseDouble(
                        request.getParameter("amount")
                );

        Date paymentDate =
                Date.valueOf(
                        request.getParameter("paymentDate")
                );

        String paymentMethod =
                request.getParameter("paymentMethod");

        String paymentStatus =
                request.getParameter("paymentStatus");


        Payment payment =
                new Payment();

        payment.setServiceId(serviceId);
        payment.setAmount(amount);
        payment.setPaymentDate(paymentDate);
        payment.setPaymentMethod(paymentMethod);
        payment.setPaymentStatus(paymentStatus);


        PaymentDAO dao =
                new PaymentDAO();

        boolean result =
                dao.addPayment(payment);


        if (result) {

            response.sendRedirect(
                    "ViewPaymentServlet"
            );

        } else {

            response.getWriter().println(
                    "Payment failed"
            );
        }
    }
}