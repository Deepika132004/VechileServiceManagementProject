package com.au.servlet;

import java.io.IOException;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.au.dao.InvoiceDAO;
import com.au.model.Invoice;

@WebServlet("/ViewInvoiceServlet")
public class ViewInvoiceServlet extends HttpServlet {

    @Override
    protected void doGet(
            HttpServletRequest request,
            HttpServletResponse response)
            throws ServletException, IOException {

        InvoiceDAO dao = new InvoiceDAO();

        List<Invoice> invoices =
                dao.getAllInvoices();

        request.setAttribute(
                "invoices",
                invoices
        );

        request.getRequestDispatcher(
                "viewInvoices.jsp"
        ).forward(request, response);
    }
}
