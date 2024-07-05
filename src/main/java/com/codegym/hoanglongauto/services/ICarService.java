package com.codegym.hoanglongauto.services;

import com.codegym.hoanglongauto.models.Car;

import java.util.List;

public interface ICarService {
    List<Car> findAll();

    List<Car> searchByModel(String model);

    Boolean removeCar(int id);
}
