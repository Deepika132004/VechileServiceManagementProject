package com.au.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.List;

import com.au.model.WhatsAppNotification;
import com.au.util.DBConnection;

public class WhatsAppNotificationDAO {

    // Add WhatsApp notification
    public boolean addNotification(
            WhatsAppNotification notification) {

        String query =
                "INSERT INTO whatsapp_notification "
                + "(customer_id, service_id, phone_number, "
                + "message, notification_date, status) "
                + "VALUES (?, ?, ?, ?, ?, ?)";

        try {

            Connection con =
                    DBConnection.getConnection();

            PreparedStatement ps =
                    con.prepareStatement(query);

            ps.setInt(
                    1,
                    notification.getCustomerId()
            );

            ps.setInt(
                    2,
                    notification.getServiceId()
            );

            ps.setString(
                    3,
                    notification.getPhoneNumber()
            );

            ps.setString(
                    4,
                    notification.getMessage()
            );

            ps.setDate(
                    5,
                    notification.getNotificationDate()
            );

            ps.setString(
                    6,
                    notification.getStatus()
            );

            int rows =
                    ps.executeUpdate();

            return rows > 0;

        } catch (Exception e) {

            e.printStackTrace();
        }

        return false;
    }


    // Get all notifications
    public List<WhatsAppNotification>
            getAllNotifications() {

        List<WhatsAppNotification> list =
                new ArrayList<>();

        String query =
                "SELECT * FROM whatsapp_notification "
                + "ORDER BY notification_id DESC";

        try {

            Connection con =
                    DBConnection.getConnection();

            PreparedStatement ps =
                    con.prepareStatement(query);

            ResultSet rs =
                    ps.executeQuery();

            while (rs.next()) {

                WhatsAppNotification notification =
                        new WhatsAppNotification();

                notification.setNotificationId(
                        rs.getInt("notification_id")
                );

                notification.setCustomerId(
                        rs.getInt("customer_id")
                );

                notification.setServiceId(
                        rs.getInt("service_id")
                );

                notification.setPhoneNumber(
                        rs.getString("phone_number")
                );

                notification.setMessage(
                        rs.getString("message")
                );

                notification.setNotificationDate(
                        rs.getDate("notification_date")
                );

                notification.setStatus(
                        rs.getString("status")
                );

                list.add(notification);
            }

        } catch (Exception e) {

            e.printStackTrace();
        }

        return list;
    }
}
