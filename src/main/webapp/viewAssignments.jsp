<%@ page language="java"
    contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<%@ page import="java.util.List" %>
<%@ page import="com.au.model.MechanicAssignment" %>

<!DOCTYPE html>

<html>

<head>

    <meta charset="UTF-8">

    <title>Mechanic Assignments</title>

    <style>

        body {
            font-family: Arial, sans-serif;
            background: #f1f5f9;
            margin: 0;
            padding: 40px;
        }

        h1 {
            color: #0f172a;
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

        table {
            width: 100%;
            background: white;
            border-collapse: collapse;
            box-shadow: 0 8px 25px rgba(0,0,0,0.08);
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

        .empty {
            text-align: center;
        }

    </style>

</head>

<body>

<a href="dashboard.jsp" class="back">
    ← Back to Dashboard
</a>

<h1>🔧 Mechanic Assignments</h1>

<table>

    <tr>

        <th>ID</th>
        <th>Mechanic</th>
        <th>Service</th>
        <th>Assigned Date</th>
        <th>Status</th>

    </tr>

    <%

        List<MechanicAssignment> assignments =
            (List<MechanicAssignment>)
            request.getAttribute("assignments");

        if (assignments != null &&
            !assignments.isEmpty()) {

            for (MechanicAssignment a : assignments) {

    %>

    <tr>

        <td>
            <%= a.getAssignmentId() %>
        </td>

        <td>
            <%= a.getMechanicName() %>
        </td>

        <td>
            <%= a.getServiceName() %>
        </td>

        <td>
            <%= a.getAssignedDate() %>
        </td>

        <td>
            <%= a.getStatus() %>
        </td>

    </tr>

    <%

            }

        } else {

    %>

    <tr>

        <td colspan="5" class="empty">
            No mechanic assignments found.
        </td>

    </tr>

    <%

        }

    %>

</table>

</body>

</html>