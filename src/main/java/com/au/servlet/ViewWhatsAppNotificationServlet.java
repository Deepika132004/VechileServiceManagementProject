package com.au.servlet;

import java.io.IOException;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.au.dao.WhatsAppNotificationDAO;
import com.au.model.WhatsAppNotification;

@WebServlet("/ViewWhatsAppNotificationServlet")
public class ViewWhatsAppNotificationServlet extends HttpServlet {

    private static final long serialVersionUID = 1L;

    private WhatsAppNotificationDAO dao;

    @Override
    public void init() throws ServletException {

        dao = new WhatsAppNotificationDAO();

    }

    @Override
    protected void doGet(
            HttpServletRequest request,
            HttpServletResponse response)
            throws ServletException, IOException {

        try {

            // Get all WhatsApp notifications
            List<WhatsAppNotification> notifications =
                    dao.getAllNotifications();

            System.out.println(
                    "WhatsApp notifications found: "
                    + notifications.size()
            );

            // Send list to JSP
            request.setAttribute(
                    "notifications",
                    notifications
            );

            // Open history page
            request.getRequestDispatcher(
                    "viewWhatsAppNotification.jsp"
            ).forward(request, response);

        } catch (Exception e) {

            e.printStackTrace();

            response.sendRedirect(
                    "adminDashboard.jsp"
            );
        }
    }
}