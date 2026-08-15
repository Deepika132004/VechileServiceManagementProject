<%@ page language="java"
    contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<%@ page import="java.util.List" %>
<%@ page import="com.au.model.Customer" %>

<!DOCTYPE html>

<html>

<head>

    <meta charset="UTF-8">

    <title>Add Vehicle</title>


    <style>

        * {
            box-sizing: border-box;
        }


        body {

            margin: 0;

            padding: 0;

            font-family: Arial, sans-serif;

            background: #f1f5f9;

        }


        .container {

            width: 450px;

            margin: 60px auto;

            background: white;

            padding: 35px;

            border-radius: 15px;

            box-shadow:
                0 8px 25px rgba(0,0,0,0.1);

        }


        h1 {

            text-align: center;

            color: #0f172a;

            margin-bottom: 30px;

        }


        .input-group {

            margin-bottom: 20px;

        }


        label {

            display: block;

            margin-bottom: 8px;

            font-weight: bold;

            color: #334155;

        }


        input,
        select {

            width: 100%;

            padding: 12px;

            border: 1px solid #cbd5e1;

            border-radius: 7px;

            font-size: 15px;

        }


        input:focus,
        select:focus {

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


        .back {

            display: block;

            text-align: center;

            margin-top: 20px;

            color: #2563eb;

            text-decoration: none;

        }

    </style>

</head>


<body>


<div class="container">


    <h1>
        🚗 Add Vehicle
    </h1>


    <form
        action="AddVehicleServlet"
        method="post">


        <!-- Vehicle Number -->

        <div class="input-group">

            <label>
                Vehicle Number
            </label>

            <input
                type="text"
                name="vehicleNumber"
                placeholder="Enter vehicle number"
                required>

        </div>


        <!-- Vehicle Model -->

        <div class="input-group">

            <label>
                Vehicle Model
            </label>

            <input
                type="text"
                name="vehicleModel"
                placeholder="Enter vehicle model"
                required>

        </div>


        <!-- Vehicle Type -->

        <div class="input-group">

            <label>
                Vehicle Type
            </label>

            <input
                type="text"
                name="vehicleType"
                placeholder="Enter vehicle type"
                required>

        </div>


        <!-- CUSTOMER DROPDOWN -->

        <div class="input-group">

            <label>
                Select Customer
            </label>


            <select
                name="customerId"
                required>


                <option value="">
                    Select Customer
                </option>


                <%

                    List<Customer> customers =
                        (List<Customer>)
                        request.getAttribute(
                            "customers");


                    if (customers != null) {


                        for (Customer c :
                                customers) {

                %>


                <option
                    value="<%= c.getCustomerId() %>">

                    <%= c.getCustomerName() %>

                </option>


                <%

                        }

                    }

                %>


            </select>

        </div>


        <!-- SUBMIT -->

        <button type="submit">

            Add Vehicle

        </button>


    </form>


    <a
        href="DashboardServlet"
        class="back">

        ← Back to Dashboard

    </a>


</div>


</body>

</html>