package com.au.model;

public class Mechanic {

    private int mechanicId;
    private String mechanicName;
    private String phone;
    private String specialization;

    public Mechanic() {
    }

    public Mechanic(String mechanicName, String phone, String specialization) {
        this.mechanicName = mechanicName;
        this.phone = phone;
        this.specialization = specialization;
    }

    public int getMechanicId() {
        return mechanicId;
    }

    public void setMechanicId(int mechanicId) {
        this.mechanicId = mechanicId;
    }

    public String getMechanicName() {
        return mechanicName;
    }

    public void setMechanicName(String mechanicName) {
        this.mechanicName = mechanicName;
    }

    public String getPhone() {
        return phone;
    }

    public void setPhone(String phone) {
        this.phone = phone;
    }

    public String getSpecialization() {
        return specialization;
    }

    public void setSpecialization(String specialization) {
        this.specialization = specialization;
    }
}
