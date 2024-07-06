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
    public Boolean removeCar(long id) {
        boolean result;
        try {
            PreparedStatement preparedStatement = BaseRepository.getConnection().
                    prepareStatement("delete from manager.oder where id = ?");
            preparedStatement.setLong(1, id);
            result = preparedStatement.executeUpdate() > 0;
        } catch (SQLException e) {
            throw new RuntimeException(e);
        }
        try{
            PreparedStatement preparedStatement = BaseRepository.getConnection().
                    prepareStatement("delete from manager.car where id = ?");
            preparedStatement.setLong(1, id);
            result = preparedStatement.executeUpdate() > 0;
        } catch (SQLException e) {
            throw new RuntimeException(e);
        }
        return result;
    }

    @Override
    public Car findById(Long id) {
        for (Car car :this.findAll()){
            if(car.getId() == id){
                return car;
            }
        }
        return null;
    }

    @Override
    public void editById(Long id, Car car) {
        try{
            PreparedStatement preparedStatement = BaseRepository.getConnection().
                    prepareStatement("update manager.car set make = ?, model =?,price =?,color =?, quantity=? where id=?;");
            preparedStatement.setString(1, car.getMake());
            preparedStatement.setString(2, car.getModel());
            preparedStatement.setDouble(3, car.getPrice());
            preparedStatement.setString(4,car.getColor());
            preparedStatement.setInt(5, car.getQuantity());
            preparedStatement.setLong(6, id);
            preparedStatement.executeUpdate();
        } catch (SQLException e){
            e.printStackTrace();
        }
    }

    @Override
    public void save(Car car) {
        try {
            PreparedStatement preparedStatement = BaseRepository.getConnection().
                    prepareStatement("insert into car(make,model,year,price,color,engine_type,horsepower,torque,seating_capacity,description,img,quantity,used_car) values (?,?,?,?,?,?,?,?,?,?,?,?,?);");

            preparedStatement.setString(1, car.getMake());
            preparedStatement.setString(2, car.getModel());
            preparedStatement.setInt(3, car.getYear());
            preparedStatement.setDouble(4, car.getPrice());
            preparedStatement.setString(5, car.getColor());
            preparedStatement.setString(6, car.getEngineType());
            preparedStatement.setInt(7, car.getHorsePower());
            preparedStatement.setInt(8, car.getTorque());
            preparedStatement.setInt(9, car.getSettingCapacity());
            preparedStatement.setString(10, car.getDescription());
            preparedStatement.setString(11, car.getImg());
            preparedStatement.setInt(12, car.getQuantity());
            preparedStatement.setInt(13, car.getUsed_car());

            preparedStatement.executeUpdate();
        } catch (SQLException e) {
            throw new RuntimeException(e);
        }
    }

}
