package com.codegym.hoanglongauto.services.impl;

import com.codegym.hoanglongauto.models.Car;
import com.codegym.hoanglongauto.repositories.ICarRepository;
import com.codegym.hoanglongauto.repositories.impl.CarRepository;
import com.codegym.hoanglongauto.services.ICarService;

import java.util.List;

public class CarService implements ICarService {
    private static ICarRepository carRepository = CarRepository.getInstance();
    private static ICarService instance;

    private CarService() {
    }

    public synchronized static ICarService getInstance() {
        if (instance == null) {
            instance = new CarService();
        }
        return instance;
    }

    @Override
    public List<Car> findAll() {
        return carRepository.findAll();
    }

    @Override
    public List<Car> searchByModel(String model) {
        return carRepository.searchByModel(model);
    }

    @Override
    public Boolean removeCar(int id) {
        return carRepository.removeCar(id);
    }

    @Override
    public Car findById(long id) {
        return carRepository.findById(id);
    }

    @Override
    public void update(Long id, Car car) {
        carRepository.editById (id,car);
    }

    @Override
    public void save(Car car) {
        carRepository.save(car);
    }

}
