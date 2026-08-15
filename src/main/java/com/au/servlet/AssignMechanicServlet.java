package com.au.servlet;

import java.io.IOException;
import java.sql.Date;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.au.dao.MechanicAssignmentDAO;
import com.au.dao.MechanicDAO;
import com.au.dao.ServiceDAO;
import com.au.model.Mechanic;
import com.au.model.MechanicAssignment;
import com.au.model.Service;

@WebServlet("/AssignMechanicServlet")
public class AssignMechanicServlet extends HttpServlet {

    // Load mechanics and services
    @Override
    protected void doGet(
            HttpServletRequest request,
            HttpServletResponse response)
            throws ServletException, IOException {

        MechanicDAO mechanicDAO =
                new MechanicDAO();

        ServiceDAO serviceDAO =
                new ServiceDAO();

        List<Mechanic> mechanics =
                mechanicDAO.getAllMechanics();

        List<Service> services =
                serviceDAO.getAllServices();

        request.setAttribute(
                "mechanics",
                mechanics
        );

        request.setAttribute(
                "services",
                services
        );

        request.getRequestDispatcher(
                "assignMechanic.jsp"
        ).forward(request, response);
    }


    // Save mechanic assignment
    @Override
    protected void doPost(
            HttpServletRequest request,
            HttpServletResponse response)
            throws ServletException, IOException {

        int mechanicId = Integer.parseInt(
                request.getParameter("mechanicId")
        );

        int serviceId = Integer.parseInt(
                request.getParameter("serviceId")
        );

        Date assignedDate = Date.valueOf(
                request.getParameter("assignedDate")
        );

        String status =
                request.getParameter("status");


        MechanicAssignment assignment =
                new MechanicAssignment(
                        mechanicId,
                        serviceId,
                        assignedDate,
                        status
                );


        MechanicAssignmentDAO dao =
                new MechanicAssignmentDAO();


        boolean result =
                dao.assignMechanic(assignment);


        if (result) {

            response.sendRedirect(
                    "AssignMechanicServlet"
            );

        } else {

            response.getWriter().println(
                    "Failed to assign mechanic"
            );
        }
    }
}