package com.au.model;

import java.sql.Date;

public class MechanicAssignment {

    private int assignmentId;
    private int mechanicId;
    private int serviceId;
    private Date assignedDate;
    private String status;
    private String mechanicName;
    private String serviceName;

    public MechanicAssignment() {
    }

    public MechanicAssignment(
            int mechanicId,
            int serviceId,
            Date assignedDate,
            String status) {

        this.mechanicId = mechanicId;
        this.serviceId = serviceId;
        this.assignedDate = assignedDate;
        this.status = status;
    }

    public int getAssignmentId() {
        return assignmentId;
    }

    public void setAssignmentId(int assignmentId) {
        this.assignmentId = assignmentId;
    }

    public int getMechanicId() {
        return mechanicId;
    }

    public void setMechanicId(int mechanicId) {
        this.mechanicId = mechanicId;
    }

    public int getServiceId() {
        return serviceId;
    }

    public void setServiceId(int serviceId) {
        this.serviceId = serviceId;
    }

    public Date getAssignedDate() {
        return assignedDate;
    }

    public void setAssignedDate(Date assignedDate) {
        this.assignedDate = assignedDate;
    }

    public String getStatus() {
        return status;
    }

    public void setStatus(String status) {
        this.status = status;
    }
    public String getMechanicName() {
        return mechanicName;
    }

    public void setMechanicName(String mechanicName) {
        this.mechanicName = mechanicName;
    }

    public String getServiceName() {
        return serviceName;
    }

    public void setServiceName(String serviceName) {
        this.serviceName = serviceName;
    }
}