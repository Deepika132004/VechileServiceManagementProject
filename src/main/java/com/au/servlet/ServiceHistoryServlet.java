package com.au.servlet;

import java.io.IOException;
import java.sql.Date;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.au.dao.MechanicDAO;
import com.au.dao.ServiceDAO;
import com.au.dao.ServiceHistoryDAO;
import com.au.model.Mechanic;
import com.au.model.Service;
import com.au.model.ServiceHistory;

@WebServlet("/ServiceHistoryServlet")
public class ServiceHistoryServlet extends HttpServlet {

    // Show Service History form
    @Override
    protected void doGet(
            HttpServletRequest request,
            HttpServletResponse response)
            throws ServletException, IOException {

        // Get all services
        ServiceDAO serviceDAO = new ServiceDAO();

        List<Service> services =
                serviceDAO.getAllServices();

        // Get all mechanics
        MechanicDAO mechanicDAO = new MechanicDAO();

        List<Mechanic> mechanics =
                mechanicDAO.getAllMechanics();

        // Send data to JSP
        request.setAttribute(
                "services",
                services
        );

        request.setAttribute(
                "mechanics",
                mechanics
        );

        // Open JSP
        request.getRequestDispatcher(
                "serviceHistory.jsp"
        ).forward(request, response);
    }


    // Save Service History
    @Override
    protected void doPost(
            HttpServletRequest request,
            HttpServletResponse response)
            throws ServletException, IOException {

        try {

            int serviceId =
                    Integer.parseInt(
                            request.getParameter("serviceId")
                    );

            int mechanicId =
                    Integer.parseInt(
                            request.getParameter("mechanicId")
                    );

            Date serviceDate =
                    Date.valueOf(
                            request.getParameter("serviceDate")
                    );

            String serviceStatus =
                    request.getParameter(
                            "serviceStatus"
                    );

            String description =
                    request.getParameter(
                            "description"
                    );

            double totalAmount =
                    Double.parseDouble(
                            request.getParameter(
                                    "totalAmount"
                            )
                    );


            // Create ServiceHistory object
            ServiceHistory sh =
                    new ServiceHistory();

            sh.setServiceId(serviceId);
            sh.setMechanicId(mechanicId);
            sh.setServiceDate(serviceDate);
            sh.setServiceStatus(serviceStatus);
            sh.setDescription(description);
            sh.setTotalAmount(totalAmount);


            // DAO
            ServiceHistoryDAO dao =
                    new ServiceHistoryDAO();

            boolean result =
                    dao.addServiceHistory(sh);


            if (result) {

                response.sendRedirect(
                        "ViewServiceHistoryServlet"
                );

            } else {

                response.getWriter().println(
                        "Service History could not be saved."
                );
            }

        } catch (Exception e) {

            e.printStackTrace();

            response.getWriter().println(
                    "Error: " + e.getMessage()
            );
        }
    }
}