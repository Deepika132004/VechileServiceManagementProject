<%@ page language="java"
    contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<%@ page import="java.util.List" %>
<%@ page import="com.au.model.Service" %>

<!DOCTYPE html>
<html>
<head>

<meta charset="UTF-8">

<title>View Services</title>

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
    color: #64748b;
    margin-top: 8px;
}

/* Table */

.table-container {
    background: white;
    border-radius: 15px;
    padding: 25px;
    box-shadow: 0 8px 25px rgba(0,0,0,0.08);
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
    border-bottom: 1px solid #e2e8f0;
}

tr:hover {
    background: #f8fafc;
}

/* Status */

.status {
    padding: 7px 12px;
    border-radius: 20px;
    font-size: 13px;
    font-weight: bold;
}

.pending {
    background: #fef3c7;
    color: #92400e;
}

.progress {
    background: #dbeafe;
    color: #1e40af;
}

.completed {
    background: #dcfce7;
    color: #166534;
}

/* Amount */

.amount {
    font-weight: bold;
    color: #16a34a;
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

    <a href="DashboardServlet" class="back-btn">
        ← Dashboard
    </a>

</div>


<!-- Main -->

<div class="container">

    <div class="title">

        <h1>🛠 Service Records</h1>

        <p>
            View all vehicle service information
        </p>

    </div>


    <div class="table-container">

        <table>

            <tr>

                <th>Service ID</th>
                <th>Service Name</th>
                <th>Service Date</th>
                <th>Amount</th>
                <th>Status</th>

            </tr>


            <%
                List<Service> services =
                    (List<Service>) request.getAttribute("services");

                if (services != null && !services.isEmpty()) {

                    for (Service service : services) {
            %>

            <tr>

                <td>
                    <%= service.getServiceId() %>
                </td>

                <td>
                    <%= service.getServiceName() %>
                </td>

                <td>
                    <%= service.getServiceDate() %>
                </td>

                <td class="amount">
                    ₹ <%= service.getAmount() %>
                </td>

                <td>

                    <%
                        String status = service.getStatus();

                        if ("Completed".equals(status)) {
                    %>

                        <span class="status completed">
                            Completed
                        </span>

                    <%
                        } else if ("In Progress".equals(status)) {
                    %>

                        <span class="status progress">
                            In Progress
                        </span>

                    <%
                        } else {
                    %>

                        <span class="status pending">
                            Pending
                        </span>

                    <%
                        }
                    %>

                </td>

            </tr>

            <%
                    }

                } else {
            %>

            <tr>

                <td colspan="5" class="empty">
                    No service records found.
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