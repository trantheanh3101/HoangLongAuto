package com.codegym.hoanglongauto.models;

public class Car {
    private long id;
    private String make;
    private String model;
    private int year;
    private double price;
    private String color;
    private String engineType;
    private int horsePower;
    private int torque;
    private int settingCapacity;
    private String description;
    private String img;
    private int quantity;
    private int used_car;

    public Car(String color, String description, String engineType, int horsePower, long id, String img, String make, String model, double price, int settingCapacity, int torque, int year, int quantity, int used_car) {
        this.color = color;
        this.description = description;
        this.engineType = engineType;
        this.horsePower = horsePower;
        this.id = id;
        this.img = img;
        this.make = make;
        this.model = model;
        this.price = price;
        this.settingCapacity = settingCapacity;
        this.torque = torque;
        this.year = year;
        this.quantity = quantity;
        this.used_car = used_car;
    }
    public Car(String color, String description, String engineType, int horsePower, String img, String make, String model, double price, int settingCapacity, int torque, int year, int quantity, int used_car) {
        this.color = color;
        this.description = description;
        this.engineType = engineType;
        this.horsePower = horsePower;
        this.img = img;
        this.make = make;
        this.model = model;
        this.price = price;
        this.settingCapacity = settingCapacity;
        this.torque = torque;
        this.year = year;
        this.quantity = quantity;
        this.used_car = used_car;
    }

    public int getQuantity() {
        return quantity;
    }

    public void setQuantity(int quantity) {
        this.quantity = quantity;
    }

    public String getColor() {
        return color;
    }

    public void setColor(String color) {
        this.color = color;
    }

    public String getDescription() {
        return description;
    }

    public void setDescription(String description) {
        this.description = description;
    }

    public String getEngineType() {
        return engineType;
    }

    public void setEngineType(String engineType) {
        this.engineType = engineType;
    }

    public int getHorsePower() {
        return horsePower;
    }

    public void setHorsePower(int horsePower) {
        this.horsePower = horsePower;
    }

    public long getId() {
        return id;
    }

    public void setId(long id) {
        this.id = id;
    }

    public String getImg() {
        return img;
    }

    public void setImg(String img) {
        this.img = img;
    }

    public String getMake() {
        return make;
    }

    public void setMake(String make) {
        this.make = make;
    }

    public String getModel() {
        return model;
    }

    public void setModel(String model) {
        this.model = model;
    }

    public double getPrice() {
        return price;
    }

    public void setPrice(double price) {
        this.price = price;
    }

    public int getSettingCapacity() {
        return settingCapacity;
    }

    public void setSettingCapacity(int settingCapacity) {
        this.settingCapacity = settingCapacity;
    }

    public int getTorque() {
        return torque;
    }

    public void setTorque(int torque) {
        this.torque = torque;
    }

    public int getYear() {
        return year;
    }

    public void setYear(int year) {
        this.year = year;
    }

    public int getUsed_car() {
        return used_car;
    }

    public void setUsed_car(int used_car) {
        this.used_car = used_car;
    }
}
