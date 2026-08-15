package com.au.dao;
import java.sql.Connection;

import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.List;


import java.sql.PreparedStatement;
import java.sql.SQLException;

import com.au.model.Service;
import com.au.util.DBConnection;

public class ServiceDAO {

    public boolean addService(Service service) {

        Connection con = DBConnection.getConnection();

        String query =
                "INSERT INTO service(service_name, service_date, amount, status,vehicle_id) VALUES (?, ?,?, ?, ?)";

        try {

            PreparedStatement ps = con.prepareStatement(query);

            ps.setString(1, service.getServiceName());
            ps.setDate(2, service.getServiceDate());
            ps.setDouble(3, service.getAmount());
            ps.setString(4, service.getStatus());
            ps.setInt(5, service.getVehicleId());

            int rows = ps.executeUpdate();

            return rows > 0;

        } catch (SQLException e) {
            e.printStackTrace();
        }

        return false;
    }
    public List<Service> getAllServices() {

        List<Service> services = new ArrayList<>();

        Connection con = DBConnection.getConnection();

        String query = "SELECT * FROM service";

        try {

            PreparedStatement ps =
                    con.prepareStatement(query);

            ResultSet rs = ps.executeQuery();

            while (rs.next()) {

                Service service = new Service();

                service.setServiceId(
                        rs.getInt("service_id"));

                service.setServiceName(
                        rs.getString("service_name"));

                service.setServiceDate(
                        rs.getDate("service_date"));

                service.setAmount(
                        rs.getDouble("amount"));

                service.setStatus(
                        rs.getString("status"));
                service.setVehicleId(
                        rs.getInt("vehicle_id"));

                services.add(service);
            }

        } catch (Exception e) {

            e.printStackTrace();
        }

        return services;
    }
}
