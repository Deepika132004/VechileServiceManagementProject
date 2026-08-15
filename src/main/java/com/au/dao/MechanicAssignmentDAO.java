package com.au.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.List;

import com.au.model.MechanicAssignment;
import com.au.util.DBConnection;

public class MechanicAssignmentDAO {

    // Assign mechanic to service
    public boolean assignMechanic(
            MechanicAssignment assignment) {

        Connection con =
                DBConnection.getConnection();

        String query =
                "INSERT INTO mechanic_assignment " +
                "(mechanic_id, service_id, assigned_date, status) " +
                "VALUES (?, ?, ?, ?)";

        try {

            PreparedStatement ps =
                    con.prepareStatement(query);

            ps.setInt(
                    1,
                    assignment.getMechanicId()
            );

            ps.setInt(
                    2,
                    assignment.getServiceId()
            );

            ps.setDate(
                    3,
                    assignment.getAssignedDate()
            );

            ps.setString(
                    4,
                    assignment.getStatus()
            );

            int rows =
                    ps.executeUpdate();

            return rows > 0;

        } catch (Exception e) {

            e.printStackTrace();
        }

        return false;
    }


    public List<MechanicAssignment> getAllAssignments() {

        List<MechanicAssignment> assignments =
                new ArrayList<>();

        Connection con =
                DBConnection.getConnection();

        String query =
                "SELECT ma.assignment_id, " +
                "ma.mechanic_id, " +
                "ma.service_id, " +
                "ma.assigned_date, " +
                "ma.status, " +
                "m.mechanic_name, " +
                "s.service_name " +
                "FROM mechanic_assignment ma " +
                "JOIN mechanic m " +
                "ON ma.mechanic_id = m.mechanic_id " +
                "JOIN service s " +
                "ON ma.service_id = s.service_id";

        try {

            PreparedStatement ps =
                    con.prepareStatement(query);

            ResultSet rs =
                    ps.executeQuery();

            while (rs.next()) {

                MechanicAssignment assignment =
                        new MechanicAssignment();

                assignment.setAssignmentId(
                        rs.getInt("assignment_id")
                );

                assignment.setMechanicId(
                        rs.getInt("mechanic_id")
                );

                assignment.setServiceId(
                        rs.getInt("service_id")
                );

                assignment.setAssignedDate(
                        rs.getDate("assigned_date")
                );

                assignment.setStatus(
                        rs.getString("status")
                );

                assignment.setMechanicName(
                        rs.getString("mechanic_name")
                );

                assignment.setServiceName(
                        rs.getString("service_name")
                );

                assignments.add(assignment);
            }

        } catch (Exception e) {

            e.printStackTrace();
        }

        return assignments;
    }
}