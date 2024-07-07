package com.codegym.hoanglongauto.repositories;

import com.codegym.hoanglongauto.models.Car;

import java.util.List;

public interface ICarRepository {
    List<Car> findAll();
    void addCar(Car car);

    List<Car> searchByModel(String model);

    Boolean removeCar(int id);

    Car findById(long id);

    void editById(Long id, Car car);

    void save(Car car);
}
