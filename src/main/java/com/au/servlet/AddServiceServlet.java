package com.au.servlet;

import java.io.IOException;
import java.sql.Date;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.au.dao.ServiceDAO;
import com.au.model.Service;

@WebServlet("/AddServiceServlet")
public class AddServiceServlet extends HttpServlet {

    protected void doPost(
            HttpServletRequest request,
            HttpServletResponse response)
            throws ServletException, IOException {

        String serviceName =
                request.getParameter("serviceName");

        Date serviceDate =
                Date.valueOf(request.getParameter("serviceDate"));

        double amount =
                Double.parseDouble(request.getParameter("amount"));
        int vehicleId = Integer.parseInt(request.getParameter("vehicleId"));

        // New code
        String status =
                request.getParameter("status");

        Service service = new Service();

        service.setServiceName(serviceName);
        service.setServiceDate(serviceDate);
        service.setAmount(amount);
        service.setVehicleId(vehicleId);

        // New code
        service.setStatus(status);

        ServiceDAO dao = new ServiceDAO();

        if (dao.addService(service)) {

            response.getWriter().println(
                    "Service added successfully.");

        } else {

            response.getWriter().println(
                    "Service insertion failed.");
        }
    }
}
