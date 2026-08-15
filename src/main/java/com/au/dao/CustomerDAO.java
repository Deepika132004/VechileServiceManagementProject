package com.au.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;

import java.util.ArrayList;
import java.util.List;

import com.au.model.Customer;
import com.au.util.DBConnection;

public class CustomerDAO {

    // Existing method
    public boolean addCustomer(Customer customer) {

        Connection con = DBConnection.getConnection();

        String query = "INSERT INTO customer(customer_name, phone, email, address) VALUES (?, ?, ?, ?)";

        try {

            PreparedStatement ps = con.prepareStatement(query);

            ps.setInt(1, customer.getCustomerId());
            ps.setString(2, customer.getCustomerName());
            ps.setString(3, customer.getPhone());
            ps.setString(4, customer.getEmail());
            ps.setString(5, customer.getAddress());

            int rows = ps.executeUpdate();

            if (rows > 0) {
                return true;
            }

        } catch (SQLException e) {
            e.printStackTrace();
        }

        return false;
    }

    // Add the new method here
    public List<Customer> getAllCustomers() {

        List<Customer> customers = new ArrayList<>();

        Connection con = DBConnection.getConnection();

        String query = "SELECT * FROM customer";

        try {

            PreparedStatement ps = con.prepareStatement(query);

            ResultSet rs = ps.executeQuery();

            while (rs.next()) {

                Customer customer = new Customer();

                customer.setCustomerId(
                        rs.getInt("customer_id"));

                customer.setCustomerName(
                        rs.getString("customer_name"));

                customer.setPhone(
                        rs.getString("phone"));

                customer.setEmail(
                        rs.getString("email"));

                customer.setAddress(
                        rs.getString("address"));

                customers.add(customer);
            }

        } catch (Exception e) {
            e.printStackTrace();
        }

        return customers;
    }
}