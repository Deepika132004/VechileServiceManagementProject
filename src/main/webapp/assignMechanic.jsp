<%@ page language="java"
    contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<%@ page import="java.util.List" %>
<%@ page import="com.au.model.Mechanic" %>
<%@ page import="com.au.model.Service" %>

<!DOCTYPE html>
<html>

<head>

    <meta charset="UTF-8">

    <title>Assign Mechanic</title>

    <style>

        * {
            box-sizing: border-box;
        }

        body {
            margin: 0;
            font-family: Arial, sans-serif;
            background: #f1f5f9;
        }

        /* Header */

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

        /* Main container */

        .container {
            width: 500px;
            margin: 50px auto;
        }

        /* Form box */

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

        /* Labels */

        label {
            display: block;

            margin-bottom: 8px;

            font-weight: bold;

            color: #334155;
        }

        /* Inputs */

        select,
        input {

            width: 100%;

            padding: 12px;

            margin-bottom: 20px;

            border: 1px solid #cbd5e1;

            border-radius: 7px;

            font-size: 15px;
        }

        select:focus,
        input:focus {

            outline: none;

            border-color: #2563eb;
        }

        /* Button */

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

        /* Empty message */

        .empty {

            color: #dc2626;

            font-size: 14px;
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


    <!-- Main Container -->

    <div class="container">

        <div class="box">

            <h1>
                🔧 Assign Mechanic
            </h1>


            <form
                action="AssignMechanicServlet"
                method="post">


                <!-- ========================= -->
                <!-- SELECT MECHANIC -->
                <!-- ========================= -->

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


                    <option
                        value=""
                        disabled>

                        No mechanics available

                    </option>


                    <%

                        }

                    %>

                </select>


                <!-- ========================= -->
                <!-- SELECT SERVICE -->
                <!-- ========================= -->

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


                <!-- ========================= -->
                <!-- ASSIGNED DATE -->
                <!-- ========================= -->

                <label>
                    Assigned Date
                </label>

                <input
                    type="date"
                    name="assignedDate"
                    required>


                <!-- ========================= -->
                <!-- STATUS -->
                <!-- ========================= -->

                <label>
                    Status
                </label>

                <select
                    name="status"
                    required>

                    <option value="ASSIGNED">
                        ASSIGNED
                    </option>

                    <option value="IN_PROGRESS">
                        IN PROGRESS
                    </option>

                    <option value="COMPLETED">
                        COMPLETED
                    </option>

                </select>


                <!-- ========================= -->
                <!-- SUBMIT -->
                <!-- ========================= -->

                <button type="submit">

                    Assign Mechanic

                </button>


            </form>

        </div>

    </div>


</body>

</html>