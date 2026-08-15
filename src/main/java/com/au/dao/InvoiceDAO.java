package com.au.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.List;

import com.au.model.Invoice;
import com.au.util.DBConnection;

public class InvoiceDAO {

    // Add Invoice
    public boolean addInvoice(Invoice invoice) {

        Connection con = DBConnection.getConnection();

        String query =
                "INSERT INTO invoice " +
                "(payment_id, invoice_date, total_amount, invoice_status) " +
                "VALUES (?, ?, ?, ?)";

        try {

            PreparedStatement ps =
                    con.prepareStatement(query);

            ps.setInt(
                    1,
                    invoice.getPaymentId()
            );

            ps.setDate(
                    2,
                    invoice.getInvoiceDate()
            );

            ps.setDouble(
                    3,
                    invoice.getTotalAmount()
            );

            ps.setString(
                    4,
                    invoice.getInvoiceStatus()
            );

            int rows =
                    ps.executeUpdate();

            return rows > 0;

        } catch (Exception e) {

            e.printStackTrace();
        }

        return false;
    }


    // Get All Invoices
    public List<Invoice> getAllInvoices() {

        List<Invoice> invoices =
                new ArrayList<>();

        Connection con =
                DBConnection.getConnection();

        String query =
                "SELECT * FROM invoice";

        try {

            PreparedStatement ps =
                    con.prepareStatement(query);

            ResultSet rs =
                    ps.executeQuery();

            while (rs.next()) {

                Invoice invoice =
                        new Invoice();

                invoice.setInvoiceId(
                        rs.getInt("invoice_id")
                );

                invoice.setPaymentId(
                        rs.getInt("payment_id")
                );

                invoice.setInvoiceDate(
                        rs.getDate("invoice_date")
                );

                invoice.setTotalAmount(
                        rs.getDouble("total_amount")
                );

                invoice.setInvoiceStatus(
                        rs.getString("invoice_status")
                );

                invoices.add(invoice);
            }

        } catch (Exception e) {

            e.printStackTrace();
        }

        return invoices;
    }
}
