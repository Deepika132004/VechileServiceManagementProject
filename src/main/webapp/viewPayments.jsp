<%@ page language="java"
    contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<%@ page import="java.util.List" %>
<%@ page import="com.au.model.Payment" %>

<!DOCTYPE html>
<html>

<head>

    <meta charset="UTF-8">

    <title>View Payments</title>

    <style>

        * {
            box-sizing: border-box;
        }

        body {
            margin: 0;
            padding: 40px;
            font-family: Arial, sans-serif;
            background: #f1f5f9;
        }

        .header {
            background: #0f172a;
            color: white;

            padding: 20px 30px;

            border-radius: 12px;

            display: flex;
            justify-content: space-between;
            align-items: center;

            margin-bottom: 30px;
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
            background: white;

            padding: 30px;

            border-radius: 15px;

            box-shadow:
                0 8px 25px rgba(0,0,0,0.08);
        }

        h1 {
            color: #0f172a;

            margin-top: 0;

            margin-bottom: 25px;
        }

        table {
            width: 100%;

            border-collapse: collapse;
        }

        th {
            background: #2563eb;

            color: white;

            padding: 14px;

            text-align: left;
        }

        td {
            padding: 14px;

            border-bottom: 1px solid #e2e8f0;

            color: #334155;
        }

        tr:hover {
            background: #f8fafc;
        }

        .status {
            font-weight: bold;

            color: #16a34a;
        }

        .empty {
            text-align: center;

            padding: 25px;

            color: #64748b;
        }

    </style>

</head>

<body>


    <!-- Header -->

    <div class="header">

        <div class="logo">
            🚗 Vehicle Service Management
        </div>

        <a href="DashboardServlet" class="back">
            ← Dashboard
        </a>

    </div>


    <!-- Payment Container -->

    <div class="container">

        <h1>
            💰 Payment Details
        </h1>


        <table>

            <tr>

                <th>
                    Payment ID
                </th>

                <th>
                    Service ID
                </th>

                <th>
                    Amount
                </th>

                <th>
                    Payment Date
                </th>

                <th>
                    Payment Method
                </th>

                <th>
                    Payment Status
                </th>

            </tr>


            <%

                List<Payment> payments =
                    (List<Payment>)
                    request.getAttribute("payments");


                if (payments != null &&
                    !payments.isEmpty()) {


                    for (Payment p : payments) {

            %>


            <tr>

                <td>
                    <%= p.getPaymentId() %>
                </td>

                <td>
                    <%= p.getServiceId() %>
                </td>

                <td>
                    ₹<%= p.getAmount() %>
                </td>

                <td>
                    <%= p.getPaymentDate() %>
                </td>

                <td>
                    <%= p.getPaymentMethod() %>
                </td>

                <td class="status">
                    <%= p.getPaymentStatus() %>
                </td>

            </tr>


            <%

                    }

                } else {

            %>


            <tr>

                <td
                    colspan="6"
                    class="empty">

                    No payments found.

                </td>

            </tr>


            <%

                }

            %>


        </table>

    </div>


</body>

</html>