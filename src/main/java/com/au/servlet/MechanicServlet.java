package com.au.servlet;

import java.io.IOException;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.au.dao.MechanicDAO;
import com.au.model.Mechanic;

@WebServlet("/MechanicServlet")
public class MechanicServlet extends HttpServlet {

    // Display all mechanics
    @Override
    protected void doGet(
            HttpServletRequest request,
            HttpServletResponse response)
            throws ServletException, IOException {

        MechanicDAO dao = new MechanicDAO();

        List<Mechanic> mechanics =
                dao.getAllMechanics();

        request.setAttribute(
                "mechanics",
                mechanics
        );

        request.getRequestDispatcher(
                "mechanic.jsp"
        ).forward(request, response);
    }


    // Add mechanic
    @Override
    protected void doPost(
            HttpServletRequest request,
            HttpServletResponse response)
            throws ServletException, IOException {

        String name =
                request.getParameter("mechanicName");

        String phone =
                request.getParameter("phone");

        String specialization =
                request.getParameter("specialization");


        Mechanic mechanic =
                new Mechanic(
                        name,
                        phone,
                        specialization
                );


        MechanicDAO dao =
                new MechanicDAO();


        boolean result =
                dao.addMechanic(mechanic);


        if (result) {

            // After adding, redirect to GET
            response.sendRedirect(
                    "MechanicServlet"
            );

        } else {

            response.getWriter().println(
                    "Failed to add mechanic"
            );
        }
    }
}