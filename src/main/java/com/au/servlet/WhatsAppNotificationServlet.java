package com.au.servlet;

import java.io.IOException;
import java.net.URLEncoder;
import java.nio.charset.StandardCharsets;
import java.sql.Date;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.au.dao.ServiceDAO;
import com.au.dao.WhatsAppNotificationDAO;
import com.au.model.Service;
import com.au.model.WhatsAppNotification;

@WebServlet("/WhatsAppNotificationServlet")
public class WhatsAppNotificationServlet
        extends HttpServlet {

    // Show WhatsApp notification page
    @Override
    protected void doGet(
            HttpServletRequest request,
            HttpServletResponse response)
            throws ServletException, IOException {

        ServiceDAO serviceDAO =
                new ServiceDAO();

        List<Service> services =
                serviceDAO.getAllServices();

        request.setAttribute(
                "services",
                services
        );

        request.getRequestDispatcher(
                "whatsappNotification.jsp"
        ).forward(request, response);
    }


    // Process WhatsApp notification
    @Override
    protected void doPost(
            HttpServletRequest request,
            HttpServletResponse response)
            throws ServletException, IOException {

        int customerId =
                Integer.parseInt(
                        request.getParameter(
                                "customerId"
                        )
                );

        int serviceId =
                Integer.parseInt(
                        request.getParameter(
                                "serviceId"
                        )
                );

        String phoneNumber =
                request.getParameter(
                        "phoneNumber"
                );

        String message =
                request.getParameter(
                        "message"
                );

        Date notificationDate =
                Date.valueOf(
                        request.getParameter(
                                "notificationDate"
                        )
                );


        // Remove spaces and symbols
        phoneNumber =
                phoneNumber.replaceAll(
                        "[^0-9]",
                        ""
                );


        WhatsAppNotification notification =
                new WhatsAppNotification();

        notification.setCustomerId(customerId);
        notification.setServiceId(serviceId);
        notification.setPhoneNumber(phoneNumber);
        notification.setMessage(message);
        notification.setNotificationDate(
                notificationDate
        );

        // Click-to-chat is ready
        notification.setStatus("READY");


        WhatsAppNotificationDAO dao =
                new WhatsAppNotificationDAO();

        boolean result =
                dao.addNotification(
                        notification
                );


        if (result) {

            String encodedMessage =
                    URLEncoder.encode(
                            message,
                            StandardCharsets.UTF_8.toString()
                    );

            String whatsappURL =
                    "https://wa.me/"
                    + phoneNumber
                    + "?text="
                    + encodedMessage;


            response.sendRedirect(
                    whatsappURL
            );

        } else {

            response.getWriter().println(
                    "WhatsApp notification failed"
            );
        }
    }
}
