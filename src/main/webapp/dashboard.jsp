<%@ page language="java"
    contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<!DOCTYPE html>
<html>
<head>

<meta charset="UTF-8">

<title>Admin Dashboard | Vehicle Service Management</title>

<style>

/* =========================
   RESET
========================= */

* {
    margin: 0;
    padding: 0;
    box-sizing: border-box;
    font-family: "Segoe UI", Arial, sans-serif;
}

body {
    background: #f1f5f9;
    color: #0f172a;
}


/* =========================
   SIDEBAR
========================= */

.sidebar {

    position: fixed;

    left: 0;
    top: 0;

    width: 240px;
    height: 100vh;

    background: #0f172a;

    color: white;

    padding: 25px 18px;

    z-index: 1000;
}

.logo {

    font-size: 22px;

    font-weight: bold;

    padding: 10px 12px 30px;

    border-bottom: 1px solid #334155;

}

.logo span {

    color: #60a5fa;

}


.nav {

    margin-top: 30px;

}

.nav a {

    display: flex;

    align-items: center;

    gap: 12px;

    text-decoration: none;

    color: #cbd5e1;

    padding: 13px 15px;

    border-radius: 9px;

    margin-bottom: 8px;

    transition: 0.3s;

}

.nav a:hover,
.nav a.active {

    background: #2563eb;

    color: white;

}


/* =========================
   LOGOUT
========================= */

.sidebar-logout {

    position: absolute;

    bottom: 25px;

    left: 18px;

    right: 18px;

}

.sidebar-logout a {

    display: block;

    text-align: center;

    text-decoration: none;

    background: #dc2626;

    color: white;

    padding: 12px;

    border-radius: 8px;

    font-weight: 600;

}

.sidebar-logout a:hover {

    background: #b91c1c;

}


/* =========================
   MAIN
========================= */

.main {

    margin-left: 240px;

    min-height: 100vh;

    padding: 25px 35px;

}


/* =========================
   TOP BAR
========================= */

.topbar {

    display: flex;

    justify-content: space-between;

    align-items: center;

    margin-bottom: 30px;

}

.welcome h1 {

    font-size: 30px;

    margin-bottom: 5px;

}

.welcome p {

    color: #64748b;

}

.admin-profile {

    display: flex;

    align-items: center;

    gap: 12px;

}

.admin-icon {

    width: 45px;
    height: 45px;

    border-radius: 50%;

    background: #2563eb;

    color: white;

    display: flex;

    justify-content: center;

    align-items: center;

    font-size: 20px;

}


/* =========================
   SUMMARY CARDS
========================= */

.summary-grid {

    display: grid;

    grid-template-columns:
        repeat(4, 1fr);

    gap: 20px;

    margin-bottom: 35px;

}

.summary-card {

    background: white;

    padding: 22px;

    border-radius: 14px;

    box-shadow:
        0 5px 18px rgba(0,0,0,0.06);

    display: flex;

    align-items: center;

    gap: 18px;

    transition: 0.3s;

}

.summary-card:hover {

    transform: translateY(-4px);

    box-shadow:
        0 10px 25px rgba(0,0,0,0.10);

}

.summary-icon {

    width: 55px;
    height: 55px;

    border-radius: 12px;

    display: flex;

    justify-content: center;

    align-items: center;

    font-size: 27px;

    background: #dbeafe;

}

.summary-info p {

    color: #64748b;

    font-size: 14px;

    margin-bottom: 5px;

}

.summary-info h2 {

    font-size: 28px;

}


/* =========================
   SECTION
========================= */

.section {

    margin-bottom: 35px;

}

.section-title {

    display: flex;

    justify-content: space-between;

    align-items: center;

    margin-bottom: 15px;

}

.section-title h2 {

    font-size: 21px;

}

.section-title span {

    color: #64748b;

    font-size: 14px;

}


/* =========================
   QUICK ACTIONS
========================= */

.quick-actions {

    display: grid;

    grid-template-columns:
        repeat(3, 1fr);

    gap: 20px;

}

.quick-card {

    background: white;

    border-radius: 14px;

    padding: 22px;

    display: flex;

    align-items: center;

    justify-content: space-between;

    box-shadow:
        0 5px 18px rgba(0,0,0,0.06);

    transition: 0.3s;

}

.quick-card:hover {

    transform: translateY(-4px);

}

.quick-left {

    display: flex;

    align-items: center;

    gap: 15px;

}

.quick-icon {

    font-size: 30px;

}

.quick-card h3 {

    margin-bottom: 4px;

}

.quick-card p {

    color: #64748b;

    font-size: 13px;

}

.quick-btn {

    text-decoration: none;

    background: #2563eb;

    color: white;

    padding: 9px 15px;

    border-radius: 7px;

    font-size: 13px;

    font-weight: 600;

}

.quick-btn:hover {

    background: #1d4ed8;

}


/* =========================
   MODULE GRID
========================= */

.module-grid {

    display: grid;

    grid-template-columns:
        repeat(2, 1fr);

    gap: 20px;

}

.module-card {

    background: white;

    border-radius: 14px;

    padding: 25px;

    box-shadow:
        0 5px 18px rgba(0,0,0,0.06);

    display: flex;

    align-items: center;

    justify-content: space-between;

    transition: 0.3s;

}

.module-card:hover {

    transform: translateY(-4px);

    box-shadow:
        0 10px 25px rgba(0,0,0,0.10);

}

.module-left {

    display: flex;

    align-items: center;

    gap: 18px;

}

.module-icon {

    width: 55px;
    height: 55px;

    border-radius: 12px;

    background: #eff6ff;

    display: flex;

    align-items: center;

    justify-content: center;

    font-size: 27px;

}

.module-info h3 {

    font-size: 18px;

    margin-bottom: 5px;

}

.module-info p {

    color: #64748b;

    font-size: 14px;

}

.open-btn {

    text-decoration: none;

    background: #2563eb;

    color: white;

    padding: 10px 18px;

    border-radius: 7px;

    font-size: 14px;

    font-weight: 600;

}

.open-btn:hover {

    background: #1d4ed8;

}


/* =========================
   FOOTER
========================= */

.footer {

    text-align: center;

    color: #94a3b8;

    padding: 20px;

    font-size: 13px;

}


/* =========================
   RESPONSIVE
========================= */

@media(max-width:1100px) {

    .summary-grid {

        grid-template-columns:
            repeat(2, 1fr);

    }

}

@media(max-width:800px) {

    .sidebar {

        position: relative;

        width: 100%;

        height: auto;

    }

    .sidebar-logout {

        position: relative;

        left: 0;
        right: 0;
        bottom: 0;

        margin-top: 20px;

    }

    .main {

        margin-left: 0;

        padding: 20px;

    }

    .quick-actions,
    .module-grid {

        grid-template-columns: 1fr;

    }

}

@media(max-width:550px) {

    .summary-grid {

        grid-template-columns: 1fr;

    }

    .topbar {

        align-items: flex-start;

    }

}

</style>

</head>


<body>


<!-- ==================================================
     SIDEBAR
================================================== -->

<div class="sidebar">

    <div class="logo">

        🚗 Vehicle <span>Service</span>

    </div>


    <div class="nav">

        <a href="DashboardServlet"
           class="active">

            🏠 Dashboard

        </a>


        <a href="ViewCustomerServlet">
                                👤 Customers
</a>

<a href="ViewVehicleServlet">
    🚗 Vehicles
</a>

<a href="ViewServiceServlet">
    🛠️ Services
</a>


        <a href="ViewMechanicServlet">

            🔧 Mechanics

        </a>


        <a href="ViewPaymentServlet">

            💰 Payments

        </a>


        <a href="ViewInvoiceServlet">

            🧾 Invoices

        </a>


        <a href="ViewServiceHistoryServlet">

            📋 Service History

        </a>


        <a href="ViewWhatsAppNotificationServlet">

            💬 WhatsApp

        </a>

    </div>


    <div class="sidebar-logout">

        <a href="${pageContext.request.contextPath}/LogoutServlet">

            🚪 Logout

        </a>

    </div>

</div>



<!-- ==================================================
     MAIN CONTENT
================================================== -->

<div class="main">


<!-- TOP BAR -->

<div class="topbar">

    <div class="welcome">

        <h1>Admin Dashboard</h1>

        <p>
            Welcome back! Manage your vehicle service center.
        </p>

    </div>


    <div class="admin-profile">

        <div>

            <strong>Administrator</strong>

            <p style="font-size:13px;color:#64748b;">
                Service Center
            </p>

        </div>

        <div class="admin-icon">

            👤

        </div>

    </div>

</div>



<!-- ==================================================
     SUMMARY
================================================== -->

<div class="summary-grid">


    <!-- CUSTOMER -->

    <div class="summary-card">

        <div class="summary-icon">

            👤

        </div>

        <div class="summary-info">

            <p>Total Customers</p>

            <h2>2</h2>

        </div>

    </div>


    <!-- VEHICLES -->

    <div class="summary-card">

        <div class="summary-icon">

            🚗

        </div>

        <div class="summary-info">

            <p>Total Vehicles</p>

            <h2>2</h2>

        </div>

    </div>


    <!-- SERVICES -->

    <div class="summary-card">

        <div class="summary-icon">

            🛠️

        </div>

        <div class="summary-info">

            <p>Total Services</p>

            <h2>2</h2>

        </div>

    </div>


    <!-- PAYMENTS -->

    <div class="summary-card">

        <div class="summary-icon">

            💰

        </div>

        <div class="summary-info">

            <p>Total Payments</p>

            <h2>2</h2>

        </div>

    </div>

</div>



<!-- ==================================================
     QUICK ACTIONS
================================================== -->

<div class="section">

    <div class="section-title">

        <h2>⚡ Quick Actions</h2>

        <span>Frequently used</span>

    </div>


    <div class="quick-actions">


        <div class="quick-card">

            <div class="quick-left">

                <div class="quick-icon">

                    👤

                </div>

                <div>

                    <h3>Add Customer</h3>

                    <p>Register a new customer</p>

                </div>

            </div>


            <a href="customer.html"
               class="quick-btn">

                Add

            </a>

        </div>



        <div class="quick-card">

            <div class="quick-left">

                <div class="quick-icon">

                    🚗

                </div>

                <div>

                    <h3>Add Vehicle</h3>

                    <p>Register customer vehicle</p>

                </div>

            </div>


            <a href="GetCustomersServlet"
               class="quick-btn">

                Add

            </a>

        </div>



        <div class="quick-card">

            <div class="quick-left">

                <div class="quick-icon">

                    🛠️

                </div>

                <div>

                    <h3>Add Service</h3>

                    <p>Create service record</p>

                </div>

            </div>


            <a href="GetVehiclesServlet"
               class="quick-btn">

                Add

            </a>

        </div>


    </div>

</div>



<!-- ==================================================
     SERVICE OPERATIONS
================================================== -->

<div class="section">

    <div class="section-title">

        <h2>🔧 Service Operations</h2>

        <span>Manage your workshop</span>

    </div>


    <div class="module-grid">


        <!-- MECHANIC -->

        <div class="module-card">

            <div class="module-left">

                <div class="module-icon">

                    🔧

                </div>

                <div class="module-info">

                    <h3>
                        Mechanic Management
                    </h3>

                    <p>
                        Add and manage mechanics
                    </p>

                </div>

            </div>


            <a href="mechanic.jsp"
               class="open-btn">

                Open

            </a>

        </div>



        <!-- ASSIGNMENT -->

        <div class="module-card">

            <div class="module-left">

                <div class="module-icon">

                    👨‍🔧

                </div>

                <div class="module-info">

                    <h3>
                        Mechanic Assignment
                    </h3>

                    <p>
                        Assign mechanics to services
                    </p>

                </div>

            </div>


            <a href="AssignMechanicServlet"
               class="open-btn">

                Open

            </a>

        </div>

    </div>

</div>



<!-- ==================================================
     BILLING
================================================== -->

<div class="section">

    <div class="section-title">

        <h2>💳 Billing</h2>

        <span>Payments & invoices</span>

    </div>


    <div class="module-grid">


        <!-- PAYMENT -->

        <div class="module-card">

            <div class="module-left">

                <div class="module-icon">

                    💰

                </div>

                <div class="module-info">

                    <h3>
                        Payment Management
                    </h3>

                    <p>
                        Record and manage payments
                    </p>

                </div>

            </div>


            <a href="PaymentServlet"
               class="open-btn">

                Open

            </a>

        </div>



        <!-- INVOICE -->

        <div class="module-card">

            <div class="module-left">

                <div class="module-icon">

                    🧾

                </div>

                <div class="module-info">

                    <h3>
                        Invoice Management
                    </h3>

                    <p>
                        Generate customer invoices
                    </p>

                </div>

            </div>


            <a href="InvoiceServlet"
               class="open-btn">

                Open

            </a>

        </div>

    </div>

</div>



<!-- ==================================================
     RECORDS & NOTIFICATIONS
================================================== -->

<div class="section">

    <div class="section-title">

        <h2>📊 Records & Notifications</h2>

        <span>Track service activity</span>

    </div>


    <div class="module-grid">


        <!-- SERVICE HISTORY -->

        <div class="module-card">

            <div class="module-left">

                <div class="module-icon">

                    📋

                </div>

                <div class="module-info">

                    <h3>
                        Service History
                    </h3>

                    <p>
                        View customer service history
                    </p>

                </div>

            </div>


            <a href="ViewServiceHistoryServlet"
               class="open-btn">

                Open

            </a>

        </div>



        <!-- WHATSAPP -->

        <div class="module-card">

            <div class="module-left">

                <div class="module-icon">

                    💬

                </div>

                <div class="module-info">

                    <h3>
                        WhatsApp Notification
                    </h3>

                    <p>
                         sent WhatsApp notifications
                    </p>

                </div>

            </div>


          <a href="WhatsAppNotificationServlet" class="open-btn">
    💬 Open
</a>

        </div>


    </div>

</div>



<!-- FOOTER -->

<div class="footer">

    © 2026 Vehicle Service Management System

</div>


</div>

</body>

</html>