
<%@ page import="java.util.List" %>
<%@ page import="com.au.model.Vehicle" %>


<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Vehicle Service Form</title>

<style>

*{
    margin:0;
    padding:0;
    box-sizing:border-box;
    font-family:Arial, sans-serif;
}

body{
    min-height:100vh;
    display:flex;
    justify-content:center;
    align-items:center;
    background:linear-gradient(135deg,#0f172a,#1e293b,#334155);
}

.container{
    width:450px;
    padding:35px;
    border-radius:20px;
    background:white;
    box-shadow:0px 10px 25px rgba(0,0,0,0.3);
}

h2{
    text-align:center;
    margin-bottom:25px;
    color:#1e293b;
}

.input-group{
    margin-bottom:18px;
}

label{
    display:block;
    margin-bottom:8px;
    font-weight:bold;
    color:#333;
}

input,
select{
    width:100%;
    padding:12px;
    border:1px solid #cccccc;
    border-radius:10px;
    outline:none;
    transition:0.3s;
}

input:focus,
select:focus{
    border-color:#2563eb;
    box-shadow:0 0 8px rgba(37,99,235,0.3);
}

button{
    width:100%;
    padding:12px;
    border:none;
    border-radius:10px;
    background:#2563eb;
    color:white;
    font-size:16px;
    cursor:pointer;
    transition:0.3s;
}

button:hover{
    background:#1d4ed8;
    transform:scale(1.02);
}

</style>

</head>

<body>

<div class="container">

    <h2>🛠 Vehicle Service Form</h2>

    <form action="AddServiceServlet" method="post">

        <div class="input-group">

            <label>Service Name</label>

            <input
                type="text"
                name="serviceName"
                placeholder="Enter service name"
                required>

        </div>

        <div class="input-group">

            <label>Service Date</label>

            <input
                type="date"
                name="serviceDate"
                required>

        </div>

        <div class="input-group">

            <label>Amount</label>

            <input
                type="number"
                name="amount"
                placeholder="Enter amount"
                required>

        </div>

        
            <!-- Select Vehicle -->

    <div class="input-group">

        <label>Select Vehicle</label>

        <select name="vehicleId" required>

            <option value="">
                Select Vehicle
            </option>

            <%
                List<Vehicle> vehicles =
                    (List<Vehicle>)
                    request.getAttribute("vehicles");

                if (vehicles != null) {

                    for (Vehicle v : vehicles) {
            %>

            <option value="<%= v.getVehicleId() %>">

                <%= v.getVehicleNumber() %>
                -
                <%= v.getVehicleModel() %>

            </option>

            <%
                    }
                }
            %>

        </select>
        <div class="input-group">

            <label>Service Status</label>

            <select name="status">

                <option value="Pending">
                    Pending
                </option>

                <option value="In Progress">
                    In Progress
                </option>

                <option value="Completed">
                    Completed
                </option>

            </select>

        </div>

    </div>

        <button type="submit">
            Add Service
        </button>

    </form>

</div>

</body>
</html>