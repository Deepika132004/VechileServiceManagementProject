<%@ page language="java"
    contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<%@ page import="java.util.List" %>
<%@ page import="com.au.model.Invoice" %>

<!DOCTYPE html>
<html>

<head>

    <meta charset="UTF-8">

    <title>View Invoices</title>

    <style>

        body {
            margin: 0;
            padding: 40px;
            font-family: Arial, sans-serif;
            background: #f1f5f9;
        }

        h1 {
            color: #0f172a;
            margin-bottom: 25px;
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

        .container {
            background: white;
            padding: 25px;
            border-radius: 15px;

            box-shadow:
                0 8px 25px rgba(0,0,0,0.08);
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

    </style>

</head>

<body>

    <a href="DashboardServlet" class="back">
        ← Dashboard
    </a>

    <h1>🧾 Invoice Details</h1>

    <div class="container">

        <table>

            <tr>

                <th>Invoice ID</th>
                <th>Payment ID</th>
                <th>Invoice Date</th>
                <th>Total Amount</th>
                <th>Status</th>

            </tr>

            <%

                List<Invoice> invoices =
                    (List<Invoice>)
                    request.getAttribute("invoices");

                if (invoices != null &&
                    !invoices.isEmpty()) {

                    for (Invoice i : invoices) {

            %>

            <tr>

                <td>
                    <%= i.getInvoiceId() %>
                </td>

                <td>
                    <%= i.getPaymentId() %>
                </td>

                <td>
                    <%= i.getInvoiceDate() %>
                </td>

                <td>
                    ₹<%= i.getTotalAmount() %>
                </td>

                <td>
                    <%= i.getInvoiceStatus() %>
                </td>

            </tr>

            <%

                    }

                } else {

            %>

            <tr>

                <td colspan="5">
                    No invoices found.
                </td>

            </tr>

            <%

                }

            %>

        </table>

    </div>

</body>

</html>