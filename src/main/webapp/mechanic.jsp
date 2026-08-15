<%@ page language="java"
    contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<%@ page import="java.util.List" %>
<%@ page import="com.au.model.Mechanic" %>

<!DOCTYPE html>
<html>

<head>

    <meta charset="UTF-8">

    <title>Mechanic Management</title>

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
            width: 90%;
            max-width: 1000px;
            margin: 40px auto;
        }

        .form-box {
            background: white;
            padding: 30px;
            border-radius: 15px;
            box-shadow: 0 8px 25px rgba(0,0,0,0.08);

            margin-bottom: 35px;
        }

        h1 {
            color: #0f172a;
            margin-bottom: 25px;
        }

        h2 {
            color: #0f172a;
            margin-bottom: 20px;
        }

        label {
            display: block;
            margin-bottom: 7px;
            font-weight: bold;
            color: #334155;
        }

        input {
            width: 100%;
            padding: 12px;
            margin-bottom: 18px;

            border: 1px solid #cbd5e1;
            border-radius: 7px;

            font-size: 15px;
        }

        input:focus {
            outline: none;
            border-color: #2563eb;
        }

        button {
            padding: 12px 25px;

            background: #2563eb;
            color: white;

            border: none;
            border-radius: 7px;

            font-size: 15px;
            cursor: pointer;
        }

        button:hover {
            background: #1d4ed8;
        }

        table {
            width: 100%;
            border-collapse: collapse;
            background: white;

            border-radius: 12px;
            overflow: hidden;

            box-shadow: 0 8px 25px rgba(0,0,0,0.08);
        }

        th {
            background: #2563eb;
            color: white;
            padding: 14px;
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
            padding: 20px;
        }

    </style>

</head>


<body>


    <!-- Header -->

    <div class="header">

        <div class="logo">
            🚗 Vehicle Service Management
        </div>

        <a href="dashboard.jsp" class="back">
            ← Dashboard
        </a>

    </div>


    <div class="container">


        <!-- Add Mechanic -->

        <div class="form-box">

            <h1>🔧 Mechanic Management</h1>

            <h2>Add Mechanic</h2>

            <form action="MechanicServlet" method="post">

                <label>
                    Mechanic Name
                </label>

                <input
                    type="text"
                    name="mechanicName"
                    placeholder="Enter mechanic name"
                    required
                >


                <label>
                    Phone
                </label>

                <input
                    type="text"
                    name="phone"
                    placeholder="Enter phone number"
                    required
                >


                <label>
                    Specialization
                </label>

                <input
                    type="text"
                    name="specialization"
                    placeholder="Example: Engine Service"
                    required
                >


                <button type="submit">
                    Add Mechanic
                </button>

            </form>

        </div>


        <!-- Mechanic List -->

        <h2>Available Mechanics</h2>

        <table>

            <tr>

                <th>
                    ID
                </th>

                <th>
                    Name
                </th>

                <th>
                    Phone
                </th>

                <th>
                    Specialization
                </th>

            </tr>


            <%

                List<Mechanic> mechanics =
                    (List<Mechanic>)
                    request.getAttribute("mechanics");

                if (mechanics != null &&
                    !mechanics.isEmpty()) {

                    for (Mechanic m : mechanics) {

            %>


            <tr>

                <td>
                    <%= m.getMechanicId() %>
                </td>

                <td>
                    <%= m.getMechanicName() %>
                </td>

                <td>
                    <%= m.getPhone() %>
                </td>

                <td>
                    <%= m.getSpecialization() %>
                </td>

            </tr>


            <%

                    }

                } else {

            %>


            <tr>

                <td colspan="4" class="empty">

                    No mechanics found.

                </td>

            </tr>


            <%

                }

            %>

        </table>


    </div>

</body>

</html>