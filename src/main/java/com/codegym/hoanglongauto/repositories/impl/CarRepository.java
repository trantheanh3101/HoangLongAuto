package com.codegym.hoanglongauto.repositories.impl;

import com.codegym.hoanglongauto.models.Car;
import com.codegym.hoanglongauto.repositories.ICarRepository;

import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

public class CarRepository implements ICarRepository {
    private static CarRepository instance;

    private CarRepository() {
    }

    public synchronized static CarRepository getInstance() {
        if (instance == null) {
            instance = new CarRepository();
        }
        return instance;
    }

    @Override
    public List<Car> findAll() {
        List<Car> cars = new ArrayList<Car>();
        try {
            PreparedStatement preparedStatement = BaseRepository.getConnection().
                    prepareStatement("select * from manager.car");
            ResultSet resultSet = preparedStatement.executeQuery();
            while (resultSet.next()) {
                long id = resultSet.getInt("id");
                String make = resultSet.getString("make");
                String model = resultSet.getString("model");
                int year = resultSet.getInt("year");
                double price = resultSet.getDouble("price");
                String color = resultSet.getString("color");
                String engineType = resultSet.getString("engine_type");
                int horsepower = resultSet.getInt("horsepower");
                int torque = resultSet.getInt("torque");
                int settingCapacity = resultSet.getInt("seating_capacity");
                String description = resultSet.getString("description");
                String img = resultSet.getString("img");
                int quantity = resultSet.getInt("quantity");
                int used_car = resultSet.getInt("used_car");
                cars.add(new Car(color, description, engineType, horsepower, id, img, make, model, price, settingCapacity, torque, year, quantity, used_car));
            }
        } catch (SQLException e) {
            throw new RuntimeException(e);
        }
        return cars;
    }

    public void addCar(Car car) {
        try {
            PreparedStatement preparedStatement = BaseRepository.getConnection().
                    prepareStatement("INSERT INTO manager.car" +
                            "(make, model, year, price, color, engine_type, horsepower, torque, " +
                            "setting_capacity, description, img, quantity, used_car) values (?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?)");
        } catch (SQLException e) {
            throw new RuntimeException(e);
        }
    }

    @Override
    public List<Car> searchByModel(String model) {
        List<Car> result = new ArrayList<>();
        try {
            PreparedStatement preparedStatement = BaseRepository.
                    getConnection().prepareStatement("select * from manager.car where car.model LIKE CONCAT('%',?,'%')");
            preparedStatement.setString(1, model);
            ResultSet resultSet = preparedStatement.executeQuery();
            while (resultSet.next()) {
                long id = resultSet.getInt("id");
                String make = resultSet.getString("make");
                String models = resultSet.getString("model");
                int year = resultSet.getInt("year");
                double price = resultSet.getDouble("price");
                String color = resultSet.getString("color");
                String engineType = resultSet.getString("engine_type");
                int horsepower = resultSet.getInt("horsepower");
                int torque = resultSet.getInt("torque");
                int settingCapacity = resultSet.getInt("seating_capacity");
                String description = resultSet.getString("description");
                String img = resultSet.getString("img");
                int quantity = resultSet.getInt("quantity");
                int used_car = resultSet.getInt("used_car");
                result.add(new Car(color, description, engineType, horsepower, id, img, make, models, price, settingCapacity, torque, year, quantity, used_car));
            }
        } catch (SQLException e) {
            throw new RuntimeException(e);
        }
        return result;
    }

    @Override
    public Boolean removeCar(int id) {
        boolean result;
        try {
            PreparedStatement preparedStatement = BaseRepository.getConnection().
                    prepareStatement("delete from manager.car where id = ?");
            preparedStatement.setInt(1, id);
            result = preparedStatement.executeUpdate() > 0;
        } catch (SQLException e) {
            throw new RuntimeException(e);
        }
        return result;
    }

}
