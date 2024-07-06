package com.codegym.hoanglongauto.services;

import com.codegym.hoanglongauto.models.Car;

import java.util.List;

public interface ICarService {
    List<Car> findAll();

    List<Car> searchByModel(String model);

    Boolean removeCar(Long id);


    Car findById(Long id);

    void update(Long id, Car car);

    void save(Car car);
}
