package com.au.servlet;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.au.dao.VehicleDAO;
import com.au.model.Vehicle;

@WebServlet("/AddVehicleServlet")
public class AddVehicleServlet extends HttpServlet {

    protected void doPost(
            HttpServletRequest request,
            HttpServletResponse response)
            throws ServletException, IOException {

        // Get vehicle details

        String vehicleNumber =
                request.getParameter("vehicleNumber");

        String vehicleModel =
                request.getParameter("vehicleModel");

        String vehicleType =
                request.getParameter("vehicleType");


        // Get selected customer ID

        int customerId =
                Integer.parseInt(
                        request.getParameter("customerId"));


        // Create Vehicle object

        Vehicle vehicle =
                new Vehicle();

        vehicle.setVehicleNumber(
                vehicleNumber);

        vehicle.setVehicleModel(
                vehicleModel);

        vehicle.setVehicleType(
                vehicleType);

        vehicle.setCustomerId(
                customerId);


        // DAO

        VehicleDAO dao =
                new VehicleDAO();


        // Save vehicle

        if (dao.addVehicle(vehicle)) {

            response.getWriter().println(
                    "Vehicle added successfully.");

        } else {

            response.getWriter().println(
                    "Vehicle insertion failed.");
        }
    }
}