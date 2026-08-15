package com.au.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.List;

import com.au.model.Payment;
import com.au.util.DBConnection;

public class PaymentDAO {

    // Add Payment
    public boolean addPayment(Payment payment) {

        Connection con = DBConnection.getConnection();

        String query =
                "INSERT INTO payment " +
                "(service_id, amount, payment_date, payment_method, payment_status) " +
                "VALUES (?, ?, ?, ?, ?)";

        try {

            PreparedStatement ps =
                    con.prepareStatement(query);

            ps.setInt(
                    1,
                    payment.getServiceId()
            );

            ps.setDouble(
                    2,
                    payment.getAmount()
            );

            ps.setDate(
                    3,
                    payment.getPaymentDate()
            );

            ps.setString(
                    4,
                    payment.getPaymentMethod()
            );

            ps.setString(
                    5,
                    payment.getPaymentStatus()
            );

            int rows =
                    ps.executeUpdate();

            return rows > 0;

        } catch (Exception e) {

            e.printStackTrace();
        }

        return false;
    }


    // Get All Payments
    public List<Payment> getAllPayments() {

        List<Payment> payments =
                new ArrayList<>();

        Connection con =
                DBConnection.getConnection();

        String query =
                "SELECT * FROM payment";

        try {

            PreparedStatement ps =
                    con.prepareStatement(query);

            ResultSet rs =
                    ps.executeQuery();

            while (rs.next()) {

                Payment payment =
                        new Payment();

                payment.setPaymentId(
                        rs.getInt("payment_id")
                );

                payment.setServiceId(
                        rs.getInt("service_id")
                );

                payment.setAmount(
                        rs.getDouble("amount")
                );

                payment.setPaymentDate(
                        rs.getDate("payment_date")
                );

                payment.setPaymentMethod(
                        rs.getString("payment_method")
                );

                payment.setPaymentStatus(
                        rs.getString("payment_status")
                );

                payments.add(payment);
            }

        } catch (Exception e) {

            e.printStackTrace();
        }

        return payments;
    }
}
