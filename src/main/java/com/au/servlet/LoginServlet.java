package com.au.servlet;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

@WebServlet("/LoginServlet")
public class LoginServlet extends HttpServlet {

    protected void doPost(
            HttpServletRequest request,
            HttpServletResponse response)
            throws ServletException, IOException {

        String username =
                request.getParameter("username");

        String password =
                request.getParameter("password");

        // Admin credentials
        if (username.equals("admin") &&
            password.equals("admin123")) {

            // Create session
            HttpSession session =
                    request.getSession();

            session.setAttribute("username", username);

            // Go to dashboard
            response.sendRedirect(
                    "DashboardServlet");

        } else {

            response.setContentType("text/html");

            response.getWriter().println(
                    "<h2>Invalid Username or Password</h2>");

            response.getWriter().println(
                    "<a href='login.html'>Try Again</a>");
        }
    }
}
