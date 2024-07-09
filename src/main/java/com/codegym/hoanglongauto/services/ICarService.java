package com.codegym.hoanglongauto.services;

import com.codegym.hoanglongauto.dto.SaleDTO;
import com.codegym.hoanglongauto.models.Car;
import com.codegym.hoanglongauto.models.Customer;

import java.util.List;

public interface ICarService {
    List<Car> findAll();

    List<Car> searchByModel(String model);

    Boolean removeCar(int id);

    Car findById(long id);

    void update(Long id, Car car);

    void save(Car car);

    List<SaleDTO> findAllSaleDTO(String startDate, String endDate);

    boolean checkLogin(String account, String password);

    List<Car> findByUsedCarUser(int i);

    List<Car> findByUsedCarAdmin(int i);

    void saveOrder(long id, Customer customer);
}
