<%@ page language="java"
    contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<%@ page import="java.util.List" %>
<%@ page import="com.au.model.WhatsAppNotification" %>

<!DOCTYPE html>

<html>

<head>

<meta charset="UTF-8">

<title>WhatsApp Notification History</title>

<style>

* {
    box-sizing: border-box;
}

body {

    margin: 0;

    font-family: Arial, sans-serif;

    background: #f1f5f9;

    color: #0f172a;
}


/* HEADER */

.header {

    background: #0f172a;

    color: white;

    padding: 20px 40px;

    display: flex;

    justify-content: space-between;

    align-items: center;
}

.logo {

    font-size: 24px;

    font-weight: bold;
}

.dashboard {

    color: white;

    text-decoration: none;

    background: #2563eb;

    padding: 10px 18px;

    border-radius: 7px;
}

.dashboard:hover {

    background: #1d4ed8;
}


/* CONTAINER */

.container {

    width: 95%;

    max-width: 1400px;

    margin: 40px auto;
}


/* CARD */

.card {

    background: white;

    padding: 30px;

    border-radius: 15px;

    box-shadow:
        0 8px 25px rgba(0,0,0,0.08);
}


/* TITLE */

h1 {

    text-align: center;

    margin-top: 0;

    margin-bottom: 30px;
}


/* TABLE */

.table-container {

    overflow-x: auto;
}

table {

    width: 100%;

    border-collapse: collapse;

    margin-top: 20px;
}

th {

    background: #2563eb;

    color: white;

    padding: 15px;

    text-align: left;

    white-space: nowrap;
}

td {

    padding: 15px;

    border-bottom:
        1px solid #e2e8f0;
}

tr:hover {

    background: #f8fafc;
}


/* STATUS */

.status {

    padding: 7px 12px;

    border-radius: 20px;

    font-weight: bold;

    display: inline-block;
}

.sent {

    background: #dcfce7;

    color: #166534;
}

.failed {

    background: #fee2e2;

    color: #991b1b;
}

.pending {

    background: #fef3c7;

    color: #92400e;
}


/* NO DATA */

.no-data {

    text-align: center;

    padding: 40px;

    color: #64748b;

    background: #f8fafc;

    border-radius: 10px;
}


/* RESPONSIVE */

@media(max-width: 700px) {

    .header {

        padding: 15px 20px;
    }

    .logo {

        font-size: 18px;
    }

    .card {

        padding: 15px;
    }

}

</style>

</head>


<body>


<!-- HEADER -->

<div class="header">

    <div class="logo">

        🚗 Vehicle Service Management

    </div>


    <a href="DashboardServlet"
       class="dashboard">

        ← Dashboard

    </a>

</div>



<!-- MAIN -->

<div class="container">

<div class="card">


<h1>

    💬 WhatsApp Notification History

</h1>



<%

List<WhatsAppNotification> notifications =
    (List<WhatsAppNotification>)
    request.getAttribute("notifications");


if (notifications != null &&
    !notifications.isEmpty()) {

%>


<div class="table-container">


<table>


<thead>

<tr>

    <th>
        ID
    </th>

    <th>
        Customer ID
    </th>

    <th>
        Service ID
    </th>

    <th>
        Phone Number
    </th>

    <th>
        Message
    </th>

    <th>
        Date
    </th>

    <th>
        Status
    </th>

</tr>

</thead>



<tbody>


<%

for (WhatsAppNotification n :
     notifications) {

%>


<tr>


<td>

    <%= n.getNotificationId() %>

</td>


<td>

    <%= n.getCustomerId() %>

</td>


<td>

    <%= n.getServiceId() %>

</td>


<td>

    <%= n.getPhoneNumber() %>

</td>


<td>

    <%= n.getMessage() %>

</td>


<td>

    <%= n.getNotificationDate() %>

</td>


<td>


<%

String status =
    n.getStatus();

String statusClass =
    "pending";


if (status != null &&
    status.equalsIgnoreCase("SENT")) {

    statusClass = "sent";

}

else if (status != null &&
         status.equalsIgnoreCase("FAILED")) {

    statusClass = "failed";

}

%>


<span class="status <%= statusClass %>">

    <%= status %>

</span>


</td>


</tr>


<%

}

%>


</tbody>


</table>


</div>


<%

} else {

%>


<div class="no-data">

    <h3>
        📋 No WhatsApp Notifications Found
    </h3>

    <p>
        No notification history is available.
    </p>

</div>


<%

}

%>


</div>

</div>


</body>

</html>