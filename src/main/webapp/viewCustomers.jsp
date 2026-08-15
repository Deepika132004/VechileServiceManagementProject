<%@ page language="java"
    contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<%@ page import="java.util.List" %>
<%@ page import="com.au.model.Customer" %>

<!DOCTYPE html>
<html>

<head>

    <meta charset="UTF-8">

    <title>View Customers</title>

    <style>

        body {
            font-family: Arial, sans-serif;
            background: #f1f5f9;
            margin: 0;
            padding: 40px;
        }

        h1 {
            color: #0f172a;
            margin-bottom: 25px;
        }

        .container {
            background: white;
            padding: 25px;
            border-radius: 15px;
            box-shadow: 0 8px 25px rgba(0,0,0,0.08);
        }

        table {
            width: 100%;
            border-collapse: collapse;
        }

        th {
            background: #2563eb;
            color: white;
            padding: 15px;
            text-align: left;
        }

        td {
            padding: 14px;
            border-bottom: 1px solid #ddd;
        }

        tr:hover {
            background: #f8fafc;
        }

        .back {
            display: inline-block;
            margin-bottom: 20px;
            padding: 10px 18px;
            background: #2563eb;
            color: white;
            text-decoration: none;
            border-radius: 7px;
        }

    </style>

</head>

<body>

<div class="container">

    <a href="DashboardServlet" class="back">
        ← Back to Dashboard
    </a>

    <h1>👤 Customer Details</h1>

    <table>

        <tr>
            <th>ID</th>
            <th>Name</th>
            <th>Phone</th>
            <th>Email</th>
            <th>Address</th>
        </tr>

        <%
            List<Customer> customers =
                (List<Customer>) request.getAttribute("customers");

            if (customers != null && !customers.isEmpty()) {

                for (Customer c : customers) {
        %>

        <tr>

            <td>
                <%= c.getCustomerId() %>
            </td>

            <td>
                <%= c.getCustomerName() %>
            </td>

            <td>
                <%= c.getPhone() %>
            </td>

            <td>
                <%= c.getEmail() %>
            </td>

            <td>
                <%= c.getAddress() %>
            </td>

        </tr>

        <%
                }

            } else {
        %>

        <tr>
            <td colspan="5">
                No customers found.
            </td>
        </tr>

        <%
            }
        %>

    </table>

</div>

</body>

</html>