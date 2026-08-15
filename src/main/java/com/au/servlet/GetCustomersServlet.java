package com.au.servlet;

import java.io.IOException;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.au.dao.CustomerDAO;
import com.au.model.Customer;

@WebServlet("/GetCustomersServlet")
public class GetCustomersServlet extends HttpServlet {

    protected void doGet(
            HttpServletRequest request,
            HttpServletResponse response)
            throws ServletException, IOException {

        CustomerDAO dao = new CustomerDAO();

        List<Customer> customers =
                dao.getAllCustomers();

        request.setAttribute(
                "customers",
                customers);

        request.getRequestDispatcher(
                "/vehicle.jsp")
                .forward(request, response);
    }
}