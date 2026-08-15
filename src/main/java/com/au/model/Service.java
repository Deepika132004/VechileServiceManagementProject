package com.au.model;

import java.sql.Date;

public class Service {

    private int serviceId;
    private String serviceName;
    private Date serviceDate;
    private double amount;
    private String status;
    private int vehicleId;

    public Service() {

    }

    public Service(String serviceName,
                   Date serviceDate,
                   double amount,
                   String status,int vehicleId) {

        this.serviceName = serviceName;
        this.serviceDate = serviceDate;
        this.amount = amount;
        this.status = status;
        this.vehicleId=vehicleId;
    }

    public int getServiceId() {
        return serviceId;
    }

    public void setServiceId(int serviceId) {
        this.serviceId = serviceId;
    }

    public String getServiceName() {
        return serviceName;
    }

    public void setServiceName(String serviceName) {
        this.serviceName = serviceName;
    }

    public Date getServiceDate() {
        return serviceDate;
    }

    public void setServiceDate(Date serviceDate) {
        this.serviceDate = serviceDate;
    }

    public double getAmount() {
        return amount;
    }

    public void setAmount(double amount) {
        this.amount = amount;
    }

    public String getStatus() {
        return status;
    }

    public void setStatus(String status) {
        this.status = status;
    }
    public int getVehicleId() {
        return vehicleId;
    }

    public void setVehicleId(int vehicleId) {
        this.vehicleId = vehicleId;
    }
}
