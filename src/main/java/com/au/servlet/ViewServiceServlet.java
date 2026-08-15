package com.au.servlet;

import java.io.IOException;
import java.util.List;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.au.dao.ServiceDAO;
import com.au.model.Service;

@WebServlet("/ViewServiceServlet")
public class ViewServiceServlet extends HttpServlet {

    protected void doGet(
            HttpServletRequest request,
            HttpServletResponse response)
            throws ServletException, IOException {

        ServiceDAO dao = new ServiceDAO();

        List<Service> services =
                dao.getAllServices();

        request.setAttribute(
                "services",
                services);

        RequestDispatcher rd =
                request.getRequestDispatcher(
                        "/viewServices.jsp");

        rd.forward(request, response);
    }
}