package com.codegym.hoanglongauto.repositories;

import com.codegym.hoanglongauto.dto.SaleDTO;
import com.codegym.hoanglongauto.models.Car;
import com.codegym.hoanglongauto.models.Customer;

import java.util.List;

public interface ICarRepository {
    List<Car> findAll();
    void addCar(Car car);

    List<Car> searchByModel(String model);

    Boolean removeCar(int id);

    Car findById(long id);

    void editById(Long id, Car car);

    void save(Car car);

    List<SaleDTO> findAllSaleDTO(String startDate, String endDate);

    boolean checkLogin(String account, String password);

    List<Car> findByUsedCarUser(int i);

    List<Car> findByUsedCarAdmin(int i);

    void saveOrder(long id, Customer customer);
}
