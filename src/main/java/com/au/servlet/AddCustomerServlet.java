package com.au.servlet;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.au.dao.CustomerDAO;
import com.au.model.Customer;

@WebServlet("/AddCustomerServlet")
public class AddCustomerServlet extends HttpServlet {

    protected void doPost(
            HttpServletRequest request,
            HttpServletResponse response)
            throws ServletException, IOException {

        String customerName =
                request.getParameter("customerName");

        String phone =
                request.getParameter("phone");

        String email =
                request.getParameter("email");

        String address =
                request.getParameter("address");

        Customer customer = new Customer();

        customer.setCustomerName(customerName);
        customer.setPhone(phone);
        customer.setEmail(email);
        customer.setAddress(address);

        CustomerDAO dao = new CustomerDAO();

        if (dao.addCustomer(customer)) {
            response.getWriter().println(
                    "Customer added successfully.");
        } else {
            response.getWriter().println(
                    "Failed to add customer.");
        }
    }
}
