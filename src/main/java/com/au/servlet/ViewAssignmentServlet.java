package com.au.servlet;

import java.io.IOException;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.au.dao.MechanicAssignmentDAO;
import com.au.model.MechanicAssignment;

@WebServlet("/ViewAssignmentServlet")
public class ViewAssignmentServlet extends HttpServlet {

    @Override
    protected void doGet(
            HttpServletRequest request,
            HttpServletResponse response)
            throws ServletException, IOException {

        MechanicAssignmentDAO dao =
                new MechanicAssignmentDAO();

        List<MechanicAssignment> assignments =
                dao.getAllAssignments();

        request.setAttribute(
                "assignments",
                assignments
        );

        request.getRequestDispatcher(
                "viewAssignments.jsp"
        ).forward(request, response);
    }
}
