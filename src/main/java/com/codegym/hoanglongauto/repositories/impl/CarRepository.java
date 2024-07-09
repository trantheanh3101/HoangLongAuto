package com.codegym.hoanglongauto.repositories.impl;

import com.codegym.hoanglongauto.dto.SaleDTO;
import com.codegym.hoanglongauto.models.Car;
import com.codegym.hoanglongauto.repositories.ICarRepository;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.Collections;
import java.util.List;

import static com.codegym.hoanglongauto.repositories.impl.BaseRepository.getConnection;

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
            PreparedStatement preparedStatement = getConnection().
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
            PreparedStatement preparedStatement = getConnection().
                    prepareStatement("INSERT INTO manager.car" +
                            "(make, model, year, price, color, engine_type, horsepower, torque, " +
                            "seating_capacity, description, img, quantity, used_car) values (?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?)");
        } catch (SQLException e) {
            throw new RuntimeException(e);
        }
    }

    @Override
    public List<Car> searchByModel(String model) {
        List<Car> result = new ArrayList<>();
        try {
            PreparedStatement preparedStatement = getConnection().prepareStatement("select * from manager.car where car.make LIKE CONCAT('%',?,'%')");
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
            PreparedStatement preparedStatement = getConnection().
                    prepareStatement("delete from manager.oder where oder.car_id = ?");
            preparedStatement.setInt(1, id);
            result = preparedStatement.executeUpdate() > 0;
        } catch (SQLException e) {
            throw new RuntimeException(e);
        }
        try {
            PreparedStatement preparedStatement = getConnection().
                    prepareStatement("delete from manager.car where id = ?");
            preparedStatement.setInt(1, id);
            result = preparedStatement.executeUpdate() > 0;

        } catch (SQLException e) {
            throw new RuntimeException(e);
        }
        return result;
    }

    @Override
    public Car findById(long id) {
        Car car = null;
        try {
            PreparedStatement preparedStatement = getConnection().
                    prepareStatement("select * from manager.car where car.id = ?");
            preparedStatement.setLong(1, id);
            ResultSet resultSet = preparedStatement.executeQuery();
            while (resultSet.next()) {
                id = resultSet.getInt("id");
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
                car = new Car(color, description, engineType, horsepower, id, img, make, models, price, settingCapacity, torque, year, quantity, used_car);
            }
        } catch (SQLException e) {
            throw new RuntimeException(e);
        }
        return car;
    }

    @Override
    public void editById(Long id, Car car) {
        try {
            PreparedStatement preparedStatement = getConnection().
                    prepareStatement("update manager.car set make = ?, model =?,price =?,color =?, quantity=? where id=?;");
            preparedStatement.setString(1, car.getMake());
            preparedStatement.setString(2, car.getModel());
            preparedStatement.setDouble(3, car.getPrice());
            preparedStatement.setString(4, car.getColor());
            preparedStatement.setInt(5, car.getQuantity());
            preparedStatement.setLong(6, id);
            preparedStatement.executeUpdate();
        } catch (SQLException e) {
            e.printStackTrace();
        }
    }

    @Override
    public void save(Car car) {
        try {
            PreparedStatement preparedStatement = getConnection().
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

    @Override
    public List<SaleDTO> findAllSaleDTO(String startDate, String endDate) {
        String sql = "SELECT car.model,\n" +
                "       car.make,\n" +
                "       car.price,\n" +
                "       car.color,\n" +
                "       car.quantity,\n" +
                "       COUNT(oder.car_id) AS SalesCount\n" +
                "FROM car\n" +
                "JOIN oder ON car.id = oder.car_id\n" +
                "WHERE oder.sale_date BETWEEN ? AND ?\n" +
                "GROUP BY car.model, car.make, car.price, car.color, car.quantity\n" +
                "ORDER BY SalesCount DESC;\n";
        List<SaleDTO> saleDTO = new ArrayList<>();
        try {
            PreparedStatement preparedStatement = getConnection().prepareStatement(sql);
            preparedStatement.setString(1, startDate);
            preparedStatement.setString(2, endDate);
            ResultSet resultSet = preparedStatement.executeQuery();
            while (resultSet.next()) {
                String model = resultSet.getString("model");
                String make = resultSet.getString("make");
                String color = resultSet.getString("color");
                int quantity = resultSet.getInt("quantity");
                int sales = resultSet.getInt("SalesCount");
                double price = resultSet.getDouble("price");
                saleDTO.add(new SaleDTO(model, make, color, quantity, sales, price));
            }
        } catch (SQLException e) {
            throw new RuntimeException(e);
        }
        return saleDTO;

    }

    @Override
    public boolean checkLogin(String account, String password) {
        PreparedStatement preparedStatement = null;
        try {
            preparedStatement = getConnection().prepareStatement ("SELECT * FROM accounts WHERE account = ? AND password = ?");
            preparedStatement.setString(1, account);
            preparedStatement.setString(2, password);
            ResultSet resultSet = preparedStatement.executeQuery();
            if (resultSet.next()){
                return true;
            }
        } catch (SQLException e) {
            throw new RuntimeException(e);
        }
        return false;
    }

    @Override
    public List<Car> findByUsedCarUser(int usedCar) {
        List<Car> cars = new ArrayList<>();
        try {
            PreparedStatement preparedStatement = getConnection().
                    prepareStatement("SELECT * FROM car WHERE used_car = ?");
            preparedStatement.setInt(1, usedCar);
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

    @Override
    public List<Car> findByUsedCarAdmin(int usedCar) {
        List<Car> cars = new ArrayList<>();
        try {
            PreparedStatement preparedStatement = getConnection().
                    prepareStatement("SELECT * FROM car WHERE used_car = ?");
            preparedStatement.setInt(1, usedCar);
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
}