package com.au.servlet;

import java.io.IOException;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.au.util.DBConnection;

@WebServlet("/DashboardServlet")
public class DashboardServlet extends HttpServlet {

    private static final long serialVersionUID = 1L;

    @Override
    protected void doGet(HttpServletRequest request,
                          HttpServletResponse response)
                          throws ServletException, IOException {

        int customerCount = 0;
        int vehicleCount = 0;
        int serviceCount = 0;

        Connection con = null;
        PreparedStatement ps = null;
        ResultSet rs = null;

        try {

            // Get database connection
            con = DBConnection.getConnection();

            /*
             * =========================
             * CUSTOMER COUNT
             * =========================
             */

            String customerSql =
                    "SELECT COUNT(*) FROM customer";

            ps = con.prepareStatement(customerSql);

            rs = ps.executeQuery();

            if (rs.next()) {
                customerCount = rs.getInt(1);
            }

            rs.close();
            ps.close();


            /*
             * =========================
             * VEHICLE COUNT
             * =========================
             */

            String vehicleSql =
                    "SELECT COUNT(*) FROM vehicle";

            ps = con.prepareStatement(vehicleSql);

            rs = ps.executeQuery();

            if (rs.next()) {
                vehicleCount = rs.getInt(1);
            }

            rs.close();
            ps.close();


            /*
             * =========================
             * SERVICE COUNT
             * =========================
             */

            String serviceSql =
                    "SELECT COUNT(*) FROM service";

            ps = con.prepareStatement(serviceSql);

            rs = ps.executeQuery();

            if (rs.next()) {
                serviceCount = rs.getInt(1);
            }

            rs.close();
            ps.close();


            /*
             * =========================
             * SEND DATA TO JSP
             * =========================
             */

            request.setAttribute(
                    "customerCount",
                    customerCount
            );

            request.setAttribute(
                    "vehicleCount",
                    vehicleCount
            );

            request.setAttribute(
                    "serviceCount",
                    serviceCount
            );


            /*
             * =========================
             * OPEN DASHBOARD JSP
             * =========================
             */

            request.getRequestDispatcher(
                    "dashboard.jsp"
            ).forward(request, response);


        } catch (Exception e) {

            e.printStackTrace();

            response.getWriter().println(
                    "Dashboard Error: "
                    + e.getMessage()
            );

        } finally {

            try {
                if (rs != null) {
                    rs.close();
                }
            } catch (Exception e) {
                e.printStackTrace();
            }

            try {
                if (ps != null) {
                    ps.close();
                }
            } catch (Exception e) {
                e.printStackTrace();
            }

            try {
                if (con != null) {
                    con.close();
                }
            } catch (Exception e) {
                e.printStackTrace();
            }
        }
    }
}