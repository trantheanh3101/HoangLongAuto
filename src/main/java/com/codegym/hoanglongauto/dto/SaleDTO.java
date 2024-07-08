package com.codegym.hoanglongauto.dto;

public class SaleDTO {
    private String car_model;
    private String car_make;
    private double price;
    private String color;
    private int quantity;
    private int sales;

    public SaleDTO(String model, String make, String color, int quantity, int sales, double price) {
        this.car_model = model;
        this.car_make = make;
        this.color = color;
        this.quantity = quantity;
        this.sales = sales;
        this.price = price;
    }

    public String getCar_make() {
        return car_make;
    }

    public void setCar_make(String car_make) {
        this.car_make = car_make;
    }

    public String getCar_model() {
        return car_model;
    }

    public void setCar_model(String car_model) {
        this.car_model = car_model;
    }

    public String getColor() {
        return color;
    }

    public void setColor(String color) {
        this.color = color;
    }

    public double getPrice() {
        return price;
    }

    public void setPrice(double price) {
        this.price = price;
    }

    public int getSales() {
        return sales;
    }

    public void setSales(int sales) {
        this.sales = sales;
    }

    public int getQuantity() {
        return quantity;
    }

    public void setQuantity(int quantity) {
        this.quantity = quantity;
    }
}

