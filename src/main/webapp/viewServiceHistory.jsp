<%@ page language="java"
    contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<%@ page import="java.util.List" %>
<%@ page import="com.au.model.ServiceHistory" %>

<!DOCTYPE html>
<html>

<head>

    <meta charset="UTF-8">

    <title>Service History</title>

    <style>

        * {
            box-sizing: border-box;
        }

        body {
            margin: 0;
            font-family: Arial, sans-serif;
            background: #f1f5f9;
        }

        .header {
            background: #0f172a;
            color: white;

            padding: 20px 50px;

            display: flex;
            justify-content: space-between;
            align-items: center;
        }

        .logo {
            font-size: 24px;
            font-weight: bold;
        }

        .back {
            color: white;
            text-decoration: none;

            background: #2563eb;

            padding: 10px 18px;

            border-radius: 7px;
        }

        .back:hover {
            background: #1d4ed8;
        }

        .container {
            width: 95%;
            margin: 40px auto;
        }

        .box {
            background: white;

            padding: 30px;

            border-radius: 15px;

            box-shadow:
                0 8px 25px rgba(0,0,0,0.08);
        }

        h1 {
            text-align: center;

            color: #0f172a;

            margin-bottom: 30px;
        }

        table {
            width: 100%;

            border-collapse: collapse;
        }

        th {
            background: #2563eb;

            color: white;

            padding: 14px;

            text-align: center;
        }

        td {
            padding: 13px;

            text-align: center;

            border-bottom: 1px solid #e2e8f0;

            color: #334155;
        }

        tr:hover {
            background: #f8fafc;
        }

        .status {
            font-weight: bold;

            padding: 6px 10px;

            border-radius: 6px;
        }

        .completed {
            background: #dcfce7;
            color: #166534;
        }

        .progress {
            background: #fef3c7;
            color: #92400e;
        }

        .cancelled {
            background: #fee2e2;
            color: #991b1b;
        }

        .amount {
            font-weight: bold;
            color: #15803d;
        }

        .empty {
            text-align: center;

            padding: 30px;

            color: #64748b;
        }

        .add-button {
            display: inline-block;

            margin-top: 25px;

            padding: 12px 20px;

            background: #2563eb;

            color: white;

            text-decoration: none;

            border-radius: 7px;
        }

        .add-button:hover {
            background: #1d4ed8;
        }

    </style>

</head>

<body>


    <!-- Header -->

    <div class="header">

        <div class="logo">
            🚗 Vehicle Service Management
        </div>

        <a href="index.html" class="back">
            ← Home
        </a>

    </div>


    <!-- Service History -->

    <div class="container">

        <div class="box">

            <h1>
                📋 Service History
            </h1>


            <table>

                <tr>

                    <th>
                        History ID
                    </th>

                    <th>
                        Service ID
                    </th>

                    <th>
                        Mechanic ID
                    </th>

                    <th>
                        Service Date
                    </th>

                    <th>
                        Status
                    </th>

                    <th>
                        Description
                    </th>

                    <th>
                        Total Amount
                    </th>

                </tr>


                <%

                    List<ServiceHistory> historyList =
                        (List<ServiceHistory>)
                        request.getAttribute(
                            "historyList"
                        );


                    if (historyList != null &&
                        !historyList.isEmpty()) {


                        for (ServiceHistory sh :
                             historyList) {

                %>


                <tr>

                    <td>
                        <%= sh.getHistoryId() %>
                    </td>

                    <td>
                        <%= sh.getServiceId() %>
                    </td>

                    <td>
                        <%= sh.getMechanicId() %>
                    </td>

                    <td>
                        <%= sh.getServiceDate() %>
                    </td>

                    <td>

                        <%

                            String status =
                                sh.getServiceStatus();

                            String statusClass =
                                "";

                            if ("COMPLETED".equals(
                                    status)) {

                                statusClass =
                                    "completed";

                            } else if (
                                    "IN_PROGRESS".equals(
                                        status)) {

                                statusClass =
                                    "progress";

                            } else if (
                                    "CANCELLED".equals(
                                        status)) {

                                statusClass =
                                    "cancelled";
                            }

                        %>


                        <span
                            class="status <%= statusClass %>">

                            <%= status %>

                        </span>

                    </td>

                    <td>
                        <%= sh.getDescription() %>
                    </td>

                    <td class="amount">

                        ₹<%= sh.getTotalAmount() %>

                    </td>

                </tr>


                <%

                        }

                    } else {

                %>


                <tr>

                    <td
                        colspan="7"
                        class="empty">

                        No service history found.

                    </td>

                </tr>


                <%

                    }

                %>

            </table>


            <a
                href="ServiceHistoryServlet"
                class="add-button">

                ➕ Add Service History

            </a>

        </div>

    </div>


</body>

</html>