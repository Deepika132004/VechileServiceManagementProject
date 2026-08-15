<%@ page language="java"
    contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<%@ page import="java.util.List" %>
<%@ page import="com.au.model.Service" %>
<%@ page import="com.au.model.Mechanic" %>

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
            width: 550px;
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

        select,
        input,
        textarea {

            width: 100%;
            padding: 12px;
            margin-bottom: 20px;

            border: 1px solid #cbd5e1;
            border-radius: 7px;

            font-size: 15px;
        }

        textarea {
            height: 100px;
            resize: vertical;
        }

        select:focus,
        input:focus,
        textarea:focus {

            outline: none;
            border-color: #2563eb;
        }

        button {

            width: 100%;
            padding: 13px;

            border: none;
            border-radius: 7px;

            background: #2563eb;
            color: white;

            font-size: 16px;
            cursor: pointer;
        }

        button:hover {
            background: #1d4ed8;
        }

        .view-button {

            display: block;

            width: 100%;

            margin-top: 15px;

            padding: 13px;

            background: #16a34a;

            color: white;

            text-align: center;

            text-decoration: none;

            border-radius: 7px;

            font-size: 16px;
        }

        .view-button:hover {
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

        <a href="index.html" class="back">
            ← Home
        </a>

    </div>


    <!-- Form -->

    <div class="container">

        <div class="box">

            <h1>
                📋 Service History
            </h1>


            <form
                action="ServiceHistoryServlet"
                method="post">


                <!-- Select Service -->

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


                    <option value="" disabled>
                        No services available
                    </option>


                    <%

                        }

                    %>

                </select>


                <!-- Select Mechanic -->

                <label>
                    Select Mechanic
                </label>

                <select
                    name="mechanicId"
                    required>

                    <option value="">
                        Select Mechanic
                    </option>


                    <%

                        List<Mechanic> mechanics =
                            (List<Mechanic>)
                            request.getAttribute("mechanics");


                        if (mechanics != null &&
                            !mechanics.isEmpty()) {

                            for (Mechanic m : mechanics) {

                    %>


                    <option
                        value="<%= m.getMechanicId() %>">

                        <%= m.getMechanicName() %>
                        -
                        <%= m.getSpecialization() %>

                    </option>


                    <%

                            }

                        } else {

                    %>


                    <option value="" disabled>
                        No mechanics available
                    </option>


                    <%

                        }

                    %>

                </select>


                <!-- Service Date -->

                <label>
                    Service Date
                </label>

                <input
                    type="date"
                    name="serviceDate"
                    required>


                <!-- Service Status -->

                <label>
                    Service Status
                </label>

                <select
                    name="serviceStatus"
                    required>

                    <option value="COMPLETED">
                        COMPLETED
                    </option>

                    <option value="IN_PROGRESS">
                        IN PROGRESS
                    </option>

                    <option value="CANCELLED">
                        CANCELLED
                    </option>

                </select>


                <!-- Description -->

                <label>
                    Description
                </label>

                <textarea
                    name="description"
                    placeholder="Enter service details..."
                    required></textarea>


                <!-- Total Amount -->

                <label>
                    Total Amount
                </label>

                <input
                    type="number"
                    name="totalAmount"
                    step="0.01"
                    placeholder="Enter total amount"
                    required>


                <!-- Submit -->

                <button type="submit">

                    💾 Save Service History

                </button>


            </form>


            <!-- View History -->

            <a
                href="ViewServiceHistoryServlet"
                class="view-button">

                📋 View Service History

            </a>

        </div>

    </div>


</body>

</html>