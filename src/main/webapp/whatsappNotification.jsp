<%@ page language="java"
    contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<%@ page import="java.util.List" %>
<%@ page import="com.au.model.Service" %>

<!DOCTYPE html>

<html>

<head>

<meta charset="UTF-8">

<title>WhatsApp Notification</title>

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

.container {

    width: 500px;

    margin: 50px auto;
}

.box {

    background: white;

    padding: 35px;

    border-radius: 15px;

    box-shadow:
        0 8px 25px rgba(0,0,0,0.08);
}

h1 {

    text-align: center;

    color: #0f172a;

    margin-bottom: 30px;
}

label {

    display: block;

    margin-bottom: 8px;

    font-weight: bold;

    color: #334155;
}

input,
select,
textarea {

    width: 100%;

    padding: 12px;

    margin-bottom: 20px;

    border: 1px solid #cbd5e1;

    border-radius: 7px;

    font-size: 15px;
}

textarea {

    height: 120px;

    resize: vertical;
}

button {

    width: 100%;

    padding: 13px;

    border: none;

    border-radius: 7px;

    background: #16a34a;

    color: white;

    font-size: 16px;

    cursor: pointer;
}

button:hover {

    background: #15803d;
}

</style>

</head>


<body>


<!-- Header -->

<div class="header">

    <div class="logo">

        🚗 Vehicle Service Management

    </div>

    <a
        href="DashboardServlet"
        class="back">

        ← Dashboard

    </a>

</div>


<!-- Form -->

<div class="container">

<div class="box">

<h1>
    💬 WhatsApp Notification
</h1>


<form
    action="WhatsAppNotificationServlet"
    method="post">


<!-- Customer ID -->

<label>
    Customer ID
</label>

<input
    type="number"
    name="customerId"
    placeholder="Enter Customer ID"
    required>


<!-- Service -->

<label>
    Select Service
</label>

<select
    name="serviceId"
    required>

<option value="">
    Select Service
</option>


<%

List<Service> services =
    (List<Service>)
    request.getAttribute("services");

if (services != null &&
    !services.isEmpty()) {

    for (Service s : services) {

%>

<option
    value="<%= s.getServiceId() %>">

    <%= s.getServiceName() %>
    -
    ₹<%= s.getAmount() %>

</option>

<%

    }

} else {

%>

<option
    value=""
    disabled>

    No services available

</option>

<%

}

%>

</select>


<!-- Phone Number -->

<label>
    Customer WhatsApp Number
</label>

<input
    type="text"
    name="phoneNumber"
    placeholder="91XXXXXXXXXX"
    required>

<small>
    Enter country code without + or spaces.
    Example: 919876543210
</small>


<!-- Message -->

<label>
    Message
</label>

<textarea
    name="message"
    placeholder="Enter notification message"
    required>Your vehicle service has been completed successfully.</textarea>


<!-- Date -->

<label>
    Notification Date
</label>

<input
    type="date"
    name="notificationDate"
    required>


<!-- Submit -->

<button type="submit">

    💬 Send via WhatsApp

</button>


</form>

</div>

</div>

</body>

</html>