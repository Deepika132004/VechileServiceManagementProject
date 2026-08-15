<%@ page language="java"
    contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<%@ page import="java.util.List" %>
<%@ page import="com.au.model.Payment" %>

<!DOCTYPE html>
<html>

<head>

    <meta charset="UTF-8">

    <title>Generate Invoice</title>

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

        <a href="DashboardServlet" class="back">
            ← Dashboard
        </a>

    </div>


    <!-- Invoice Form -->

    <div class="container">

        <div class="box">

            <h1>
                🧾 Generate Invoice
            </h1>


            <form
                action="InvoiceServlet"
                method="post">


                <!-- Select Payment -->

                <label>
                    Select Payment
                </label>

                <select
                    name="paymentId"
                    required>

                    <option value="">
                        Select Payment
                    </option>


                    <%

                        List<Payment> payments =
                            (List<Payment>)
                            request.getAttribute("payments");


                        if (payments != null &&
                            !payments.isEmpty()) {


                            for (Payment p : payments) {

                    %>


                    <option
                        value="<%= p.getPaymentId() %>">

                        Payment #<%= p.getPaymentId() %>
                        -
                        ₹<%= p.getAmount() %>
                        -
                        <%= p.getPaymentMethod() %>
                        -
                        <%= p.getPaymentStatus() %>

                    </option>


                    <%

                            }

                        } else {

                    %>


                    <option
                        value=""
                        disabled>

                        No payments available

                    </option>


                    <%

                        }

                    %>

                </select>


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


                <!-- Invoice Date -->

                <label>
                    Invoice Date
                </label>

                <input
                    type="date"
                    name="invoiceDate"
                    required>


                <!-- Invoice Status -->

                <label>
                    Invoice Status
                </label>

                <select
                    name="invoiceStatus"
                    required>

                    <option value="GENERATED">
                        GENERATED
                    </option>

                    <option value="PAID">
                        PAID
                    </option>

                    <option value="CANCELLED">
                        CANCELLED
                    </option>

                </select>


                <!-- Submit -->

                <button type="submit">

                    🧾 Generate Invoice

                </button>


            </form>

        </div>

    </div>


</body>

</html>