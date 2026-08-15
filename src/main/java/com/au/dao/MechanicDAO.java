package com.au.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.List;

import com.au.model.Mechanic;
import com.au.util.DBConnection;

public class MechanicDAO {

    // Add Mechanic
    public boolean addMechanic(Mechanic mechanic) {

        Connection con = DBConnection.getConnection();

        String query =
            "INSERT INTO mechanic " +
            "(mechanic_name, phone, specialization) " +
            "VALUES (?, ?, ?)";

        try {

            PreparedStatement ps =
                con.prepareStatement(query);

            ps.setString(1, mechanic.getMechanicName());
            ps.setString(2, mechanic.getPhone());
            ps.setString(3, mechanic.getSpecialization());

            int rows = ps.executeUpdate();

            return rows > 0;

        } catch (Exception e) {

            e.printStackTrace();
        }

        return false;
    }


    // Get All Mechanics
    public List<Mechanic> getAllMechanics() {

        List<Mechanic> mechanics =
            new ArrayList<>();

        Connection con =
            DBConnection.getConnection();

        String query =
            "SELECT * FROM mechanic";

        try {

            PreparedStatement ps =
                con.prepareStatement(query);

            ResultSet rs =
                ps.executeQuery();

            while (rs.next()) {

                Mechanic mechanic =
                    new Mechanic();

                mechanic.setMechanicId(
                    rs.getInt("mechanic_id"));

                mechanic.setMechanicName(
                    rs.getString("mechanic_name"));

                mechanic.setPhone(
                    rs.getString("phone"));

                mechanic.setSpecialization(
                    rs.getString("specialization"));

                mechanics.add(mechanic);
            }

        } catch (Exception e) {

            e.printStackTrace();
        }

        return mechanics;
    }
}
