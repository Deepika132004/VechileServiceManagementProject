package com.au.model;

import java.sql.Date;

public class Invoice {

    private int invoiceId;
    private int paymentId;
    private Date invoiceDate;
    private double totalAmount;
    private String invoiceStatus;

    public Invoice() {
    }

    public Invoice(
            int paymentId,
            Date invoiceDate,
            double totalAmount,
            String invoiceStatus) {

        this.paymentId = paymentId;
        this.invoiceDate = invoiceDate;
        this.totalAmount = totalAmount;
        this.invoiceStatus = invoiceStatus;
    }

    public int getInvoiceId() {
        return invoiceId;
    }

    public void setInvoiceId(int invoiceId) {
        this.invoiceId = invoiceId;
    }

    public int getPaymentId() {
        return paymentId;
    }

    public void setPaymentId(int paymentId) {
        this.paymentId = paymentId;
    }

    public Date getInvoiceDate() {
        return invoiceDate;
    }

    public void setInvoiceDate(Date invoiceDate) {
        this.invoiceDate = invoiceDate;
    }

    public double getTotalAmount() {
        return totalAmount;
    }

    public void setTotalAmount(double totalAmount) {
        this.totalAmount = totalAmount;
    }

    public String getInvoiceStatus() {
        return invoiceStatus;
    }

    public void setInvoiceStatus(String invoiceStatus) {
        this.invoiceStatus = invoiceStatus;
    }
}
