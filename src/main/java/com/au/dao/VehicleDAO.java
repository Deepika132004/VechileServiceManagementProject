package com.au.dao;

import java.sql.Connection;
import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.List;
import java.sql.PreparedStatement;
import java.sql.SQLException;

import com.au.model.Vehicle;
import com.au.util.DBConnection;

public class VehicleDAO {

    public boolean addVehicle(Vehicle vehicle) {

        Connection con = DBConnection.getConnection();

        String query = "INSERT INTO vehicle(vehicle_id,vehicle_number, vehicle_model, vehicle_type,customer_id) VALUES (?, ?, ?,?, ?)";

        try {

            PreparedStatement ps = con.prepareStatement(query);

            
            ps.setInt(1, vehicle.getVehicleId());
            ps.setString(2, vehicle.getVehicleNumber());
            ps.setString(3, vehicle.getVehicleModel());
            ps.setString(4, vehicle.getVehicleType());
            ps.setInt(5,vehicle.getCustomerId());

            int rows = ps.executeUpdate();

            if (rows > 0) {
                return true;
            }

        } catch (SQLException e) {
            e.printStackTrace();
        }

        return false;
    }
    public List<Vehicle> getAllVehicles() {

        List<Vehicle> vehicles = new ArrayList<>();

        Connection con = DBConnection.getConnection();

        String query = "SELECT * FROM vehicle";

        try {

            PreparedStatement ps = con.prepareStatement(query);

            ResultSet rs = ps.executeQuery();

            while (rs.next()) {

                Vehicle vehicle = new Vehicle();

                vehicle.setVehicleId(
                        rs.getInt("vehicle_id"));

                vehicle.setVehicleNumber(
                        rs.getString("vehicle_number"));

                vehicle.setVehicleModel(
                        rs.getString("vehicle_model"));

                vehicle.setVehicleType(
                        rs.getString("vehicle_type"));
                
                vehicle.setCustomerId(rs.getInt("customer_id"));
                vehicles.add(vehicle);
            }

        } catch (Exception e) {
            e.printStackTrace();
        }

        return vehicles;
    }
}
