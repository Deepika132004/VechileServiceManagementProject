
package com.au.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.List;

import com.au.model.ServiceHistory;
import com.au.util.DBConnection;

public class ServiceHistoryDAO {

    // Add service history
    public boolean addServiceHistory(ServiceHistory sh) {

        String sql = "INSERT INTO service_history "
                   + "(service_id, mechanic_id, service_date, "
                   + "service_status, description, total_amount) "
                   + "VALUES (?, ?, ?, ?, ?, ?)";

        try {

            Connection con = DBConnection.getConnection();

            PreparedStatement ps =
                    con.prepareStatement(sql);

            ps.setInt(1, sh.getServiceId());
            ps.setInt(2, sh.getMechanicId());
            ps.setDate(3, sh.getServiceDate());
            ps.setString(4, sh.getServiceStatus());
            ps.setString(5, sh.getDescription());
            ps.setDouble(6, sh.getTotalAmount());

            int rows = ps.executeUpdate();

            return rows > 0;

        } catch (Exception e) {

            e.printStackTrace();
        }

        return false;
    }


    // Get all service history
    public List<ServiceHistory> getAllServiceHistory() {

        List<ServiceHistory> historyList =
                new ArrayList<>();

        String sql =
                "SELECT * FROM service_history "
              + "ORDER BY history_id DESC";

        try {

            Connection con =
                    DBConnection.getConnection();

            PreparedStatement ps =
                    con.prepareStatement(sql);

            ResultSet rs =
                    ps.executeQuery();

            while (rs.next()) {

                ServiceHistory sh =
                        new ServiceHistory();

                sh.setHistoryId(
                        rs.getInt("history_id")
                );

                sh.setServiceId(
                        rs.getInt("service_id")
                );

                sh.setMechanicId(
                        rs.getInt("mechanic_id")
                );

                sh.setServiceDate(
                        rs.getDate("service_date")
                );

                sh.setServiceStatus(
                        rs.getString("service_status")
                );

                sh.setDescription(
                        rs.getString("description")
                );

                sh.setTotalAmount(
                        rs.getDouble("total_amount")
                );

                historyList.add(sh);
            }

        } catch (Exception e) {

            e.printStackTrace();
        }

        return historyList;
    }
}