<%@ page language="java"
    contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<%@ page import="java.util.List" %>
<%@ page import="com.au.model.Vehicle" %>

<!DOCTYPE html>
<html>

<head>

    <meta charset="UTF-8">

    <title>View Vehicles</title>

    <style>

        * {
            box-sizing: border-box;
            margin: 0;
            padding: 0;
            font-family: Arial, sans-serif;
        }

        body {
            background: #f1f5f9;
            color: #1e293b;
        }

        /* Header */

        .header {
            background: #0f172a;
            color: white;
            padding: 22px 50px;

            display: flex;
            justify-content: space-between;
            align-items: center;
        }

        .logo {
            font-size: 25px;
            font-weight: bold;
        }

        .back-btn {
            background: #2563eb;
            color: white;
            text-decoration: none;

            padding: 11px 20px;

            border-radius: 8px;
        }

        .back-btn:hover {
            background: #1d4ed8;
        }

        /* Main */

        .container {
            width: 90%;
            margin: 40px auto;
        }

        .title {
            margin-bottom: 25px;
        }

        .title h1 {
            font-size: 32px;
            color: #0f172a;
        }

        .title p {
            margin-top: 8px;
            color: #64748b;
        }

        /* Table */

        .table-container {
            background: white;
            padding: 25px;

            border-radius: 15px;

            box-shadow:
                0 8px 25px rgba(0,0,0,0.08);

            overflow-x: auto;
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
            padding: 15px;

            border-bottom:
                1px solid #e2e8f0;
        }

        tr:hover {
            background: #f8fafc;
        }

        /* Vehicle number */

        .vehicle-number {
            font-weight: bold;
            color: #2563eb;
        }

        /* Empty */

        .empty {
            text-align: center;
            padding: 30px;
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

    <a href="DashboardServlet"
       class="back-btn">

        ← Dashboard

    </a>

</div>


<!-- Main -->

<div class="container">

    <div class="title">

        <h1>
            🚗 Vehicle Details
        </h1>

        <p>
            View all registered vehicles
        </p>

    </div>


    <div class="table-container">

        <table>

            <tr>

                <th>
                    Vehicle ID
                </th>

                <th>
                    Vehicle Number
                </th>

                <th>
                    Model
                </th>

                <th>
                    Type
                </th>

            </tr>


            <%
                List<Vehicle> vehicles =
                    (List<Vehicle>)
                    request.getAttribute("vehicles");

                if (vehicles != null &&
                    !vehicles.isEmpty()) {

                    for (Vehicle v : vehicles) {
            %>


            <tr>

                <td>
                    <%= v.getVehicleId() %>
                </td>

                <td class="vehicle-number">
                    <%= v.getVehicleNumber() %>
                </td>

                <td>
                    <%= v.getVehicleModel() %>
                </td>

                <td>
                    <%= v.getVehicleType() %>
                </td>

            </tr>


            <%
                    }

                } else {
            %>


            <tr>

                <td colspan="4"
                    class="empty">

                    No vehicles found.

                </td>

            </tr>


            <%
                }
            %>


        </table>

    </div>

</div>


</body>

</html>