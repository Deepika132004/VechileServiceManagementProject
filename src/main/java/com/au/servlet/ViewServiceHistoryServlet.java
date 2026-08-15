package com.au.servlet;

import java.io.IOException;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.au.dao.ServiceHistoryDAO;
import com.au.model.ServiceHistory;

@WebServlet("/ViewServiceHistoryServlet")
public class ViewServiceHistoryServlet extends HttpServlet {

    @Override
    protected void doGet(
            HttpServletRequest request,
            HttpServletResponse response)
            throws ServletException, IOException {

        ServiceHistoryDAO dao =
                new ServiceHistoryDAO();

        List<ServiceHistory> historyList =
                dao.getAllServiceHistory();

        request.setAttribute(
                "historyList",
                historyList
        );

        request.getRequestDispatcher(
                "viewServiceHistory.jsp"
        ).forward(request, response);
    }
}