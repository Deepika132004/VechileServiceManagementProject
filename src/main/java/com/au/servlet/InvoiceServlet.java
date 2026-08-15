package com.au.servlet;

import java.io.IOException;
import java.sql.Date;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.au.dao.InvoiceDAO;
import com.au.dao.PaymentDAO;
import com.au.model.Invoice;
import com.au.model.Payment;

@WebServlet("/InvoiceServlet")
public class InvoiceServlet extends HttpServlet {

    // Show invoice page
    @Override
    protected void doGet(
            HttpServletRequest request,
            HttpServletResponse response)
            throws ServletException, IOException {

        PaymentDAO paymentDAO = new PaymentDAO();

        List<Payment> payments =
                paymentDAO.getAllPayments();

System.out.println(
        "Number of payments: " + payments.size()
);

        request.setAttribute(
                "payments",
                payments
        );

        request.getRequestDispatcher(
                "invoice.jsp"
        ).forward(request, response);
    }


    // Save invoice
    @Override
    protected void doPost(
            HttpServletRequest request,
            HttpServletResponse response)
            throws ServletException, IOException {

        int paymentId =
                Integer.parseInt(
                        request.getParameter("paymentId")
                );

        double totalAmount =
                Double.parseDouble(
                        request.getParameter("totalAmount")
                );

        Date invoiceDate =
                Date.valueOf(
                        request.getParameter("invoiceDate")
                );

        String invoiceStatus =
                request.getParameter("invoiceStatus");


        Invoice invoice =
                new Invoice();

        invoice.setPaymentId(paymentId);
        invoice.setTotalAmount(totalAmount);
        invoice.setInvoiceDate(invoiceDate);
        invoice.setInvoiceStatus(invoiceStatus);


        InvoiceDAO dao =
                new InvoiceDAO();

        boolean result =
                dao.addInvoice(invoice);


        if (result) {

            response.sendRedirect(
                    "ViewInvoiceServlet"
            );

        } else {

            response.getWriter().println(
                    "Invoice generation failed"
            );
        }
    }
}
