package com.au.servlet;

import java.io.IOException;
import java.util.List;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.au.dao.VehicleDAO;
import com.au.model.Vehicle;

@WebServlet("/GetVehiclesServlet")
public class GetVehiclesServlet extends HttpServlet {

    @Override
    protected void doGet(
            HttpServletRequest request,
            HttpServletResponse response)
            throws ServletException, IOException {

        VehicleDAO dao = new VehicleDAO();

        List<Vehicle> vehicles = dao.getAllVehicles();

        request.setAttribute("vehicles", vehicles);

        RequestDispatcher rd =
                request.getRequestDispatcher("service.jsp");

        rd.forward(request, response);
    }
}