package com.codegym.hoanglongauto.controllers;

import com.codegym.hoanglongauto.dto.SaleDTO;
import com.codegym.hoanglongauto.models.Car;
import com.codegym.hoanglongauto.services.ICarService;
import com.codegym.hoanglongauto.services.impl.CarService;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.util.List;

@WebServlet(name = "ShowRoomController", urlPatterns = "/showroom")
public class ShowRoomController extends HttpServlet {
    private static ICarService carService = CarService.getInstance();

    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        String action = req.getParameter("action");
        if (action == null) {
            action = "";
        }
        switch (action) {
            case "list":
                showList(req, resp);
                break;
            case "show_car":
                showCar(req, resp);
                break;
            case "edit":
                showEditForm(req,resp);
                break;
            case "create":
                List<Car> cars = carService.findAll();
                req.setAttribute("cars", cars);
                req.getRequestDispatcher("/showroom/create.jsp").forward(req,resp);
                break;
            case "statistical":
                showStatistical(req, resp);
                break;
            case "showHomeAdmin":
                showHomeFormAdmin(req, resp);
                break;
            case "filterUser":
                filterCarsUser(req, resp);
                break;
            case "filterAdmin":
                filterCarsAdmin(req, resp);
                break;
            default:
                showHomeFormUser(req, resp);
                break;
        }
    }

    private void filterCarsAdmin(HttpServletRequest req, HttpServletResponse resp) {
        String type = req.getParameter("type");
        List<Car> filteredCars;
        switch (type) {
            case "new":
                filteredCars = carService.findByUsedCarAdmin(1);
                break;
            case "old":
                filteredCars = carService.findByUsedCarAdmin(0);
                break;
            default:
                filteredCars = carService.findAll();
                break;
        }
        req.setAttribute("cars", filteredCars);
        try {
            req.getRequestDispatcher("/showroom/homeAdmin.jsp").forward(req, resp);
        } catch (ServletException e) {
            throw new RuntimeException(e);
        } catch (IOException e) {
            throw new RuntimeException(e);
        }
    }

    private void filterCarsUser(HttpServletRequest req, HttpServletResponse resp) {
        String type = req.getParameter("type");
        List<Car> filteredCars;
        switch (type) {
            case "new":
                filteredCars = carService.findByUsedCarUser(1);
                break;
            case "old":
                filteredCars = carService.findByUsedCarUser(0);
                break;
            default:
                filteredCars = carService.findAll();
                break;
        }
        req.setAttribute("cars", filteredCars);
        try {
            req.getRequestDispatcher("/showroom/homeUser.jsp").forward(req, resp);
        } catch (ServletException e) {
            throw new RuntimeException(e);
        } catch (IOException e) {
            throw new RuntimeException(e);
        }
    }

    private void showHomeFormUser(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        List<Car> carDTO = carService.findAll();
        req.setAttribute("cars", carDTO);
        req.getRequestDispatcher("/showroom/homeUser.jsp").forward(req, resp);
    }

    private void showHomeFormAdmin(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        List<Car> carDTO = carService.findAll();
        req.setAttribute("cars", carDTO);
        req.getRequestDispatcher("/showroom/homeAdmin.jsp").forward(req, resp);
    }

    private void showEditForm(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        Long id = Long.parseLong(req.getParameter("id"));
        Car car = carService.findById(id);

        RequestDispatcher dispatcher;
        if (car == null){
            dispatcher =req.getRequestDispatcher("/showroom/error-404.jsp");
        } else {
            req.setAttribute("car",car);
            dispatcher = req.getRequestDispatcher("/showroom/edit.jsp");
        }
        try {
            dispatcher.forward(req, resp);
        } catch ( ServletException e){
            e.printStackTrace();
        } catch (IOException e  ){
            e.printStackTrace();
        }
    }

    // Long làm phần này.
    private void showCar(HttpServletRequest req, HttpServletResponse resp) {
        long id = Long.parseLong(req.getParameter("id"));
        Car car = carService.findById(id);
        req.setAttribute("car", car);
        RequestDispatcher requestDispatcher = req.getRequestDispatcher("showroom/detailProduct.jsp");
        try {
            requestDispatcher.forward(req, resp);
        } catch (ServletException | IOException e) {
            e.printStackTrace();
        }
    }

    private void showList(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        List<Car> cars = carService.findAll();
        req.setAttribute("cars", cars);
        req.getRequestDispatcher("/showroom/list.jsp").forward(req, resp);
    }

    private void showHomeForm(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        List<Car> carDTO = carService.findAll();
        req.setAttribute("cars", carDTO);
        req.getRequestDispatcher("/showroom/homeAdmin.jsp").forward(req, resp);
    }

    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        String action = req.getParameter("action");
        if (action == null) {
            action = "";
        }
        switch (action) {
            case "create":
                createCar(req,resp);
                break;
            case "search":
                searchByModel(req, resp);
                break;
            case "searchHomeUser":
                searchByModelHomeUser(req, resp);
                break;
            case "searchHomeAdmin":
                searchByModelHomeAdmin(req, resp);
                break;
            case "delete":
                deleteCar(req, resp);
                break;
            case "edit":
                updateCar(req,resp);
                break;
            case "login":
                loginAdmin(req, resp);
                break;
            case "statistical":
                checkSales(req, resp);
                break;
        }
    }

    private void searchByModelHomeAdmin(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException  {
        String model = req.getParameter("searchHomeAdmin");
        List<Car> result = carService.searchByModel(model);
        RequestDispatcher dispatcher;
        if (result.isEmpty()) {
            req.setAttribute("message", "ko tìm thấy sản phẩm bạn tìm");
            dispatcher = req.getRequestDispatcher("showroom/homeAdmin.jsp");
        } else {
            req.setAttribute("cars", result);
            dispatcher = req.getRequestDispatcher("/showroom/homeAdmin.jsp");
        }
        dispatcher.forward(req, resp);
    }

    private void searchByModelHomeUser(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        String model = req.getParameter("searchHomeUser");
        List<Car> result = carService.searchByModel(model);
        RequestDispatcher dispatcher;
        if (result.isEmpty()) {
            req.setAttribute("message", "ko tìm thấy sản phẩm bạn tìm");
            dispatcher = req.getRequestDispatcher("showroom/homeUser.jsp");
        } else {
            req.setAttribute("cars", result);
            dispatcher = req.getRequestDispatcher("/showroom/homeUser.jsp");
        }
        dispatcher.forward(req, resp);
    }

    private void loginAdmin(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        String account = req.getParameter("account");
        String password = req.getParameter("password");
        boolean result = carService.checkLogin(account, password);
        if (result) {
            showHomeFormAdmin(req,resp);
        } else {
            showHomeFormUser(req,resp);
        }
    }

    private void createCar(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        String name = req.getParameter("name");
        String model = req.getParameter("model");
        int year = Integer.parseInt(req.getParameter("year"));
        float price = Float.parseFloat(req.getParameter("price"));
        String color = req.getParameter("color");
        String engineType =  req.getParameter("engineType");
        int horsePower = Integer.parseInt(req.getParameter("horsePower"));
        int torque = Integer.parseInt(req.getParameter("torque"));
        int seating = Integer.parseInt(req.getParameter("seating"));
        String description = req.getParameter("description");
        String img = req.getParameter("img");
        int quantity = Integer.parseInt(req.getParameter("quantity"));
        String usedCarParam = req.getParameter("used_car");
        int usedCar = Integer.parseInt(usedCarParam);
        Car car = new Car(color,description,engineType,horsePower,img,name,model,price,seating,torque,year,quantity,usedCar);
        carService.save(car);
        List<Car> cars = carService.findAll();
        req.setAttribute("cars", cars);
        req.getRequestDispatcher("/showroom/list.jsp").forward(req, resp);
    }

    private void updateCar(HttpServletRequest req, HttpServletResponse resp) throws ServletException,IOException{
        Long id = Long.parseLong(req.getParameter("id"));
        String name = req.getParameter("name");
        String model = req.getParameter("model");
        Double price = Double.parseDouble(req.getParameter("price"));
        String color = req.getParameter("color");
        int quantity = Integer.parseInt(req.getParameter("quantity"));
        RequestDispatcher dispatcher;
        Car car = carService.findById(id);
        if( car == null ){
            dispatcher = req.getRequestDispatcher("/showroom/error-404.jsp");
        } else {
            car.setMake(name);
            car.setModel(model);
            car.setPrice(price);
            car.setColor(color);
            car.setQuantity(quantity);
            carService.update(id,car);
            req.setAttribute("car", car);
            req.setAttribute("message", "Successful");
            dispatcher = req.getRequestDispatcher("/showroom/edit.jsp");
        }
        try {
            dispatcher.forward(req, resp);
        } catch (ServletException e){
            e.printStackTrace();
        } catch (IOException e){
            e.printStackTrace();
        }

    }

    private void deleteCar(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        int id = Integer.parseInt(req.getParameter("id"));
        Boolean isDeleted = carService.removeCar(id);
        if (isDeleted) {
//            resp.sendRedirect("/showroom/list");
            List<Car> cars = carService.findAll();
            req.setAttribute("cars", cars);
            req.getRequestDispatcher("/showroom/list.jsp").forward(req, resp);
        } else {
            req.setAttribute("message", "sản phẩm ko tồn tại");
            List<Car> cars = carService.findAll();
            req.setAttribute("cars", cars);
            req.getRequestDispatcher("/showroom/list.jsp").forward(req, resp);
        }
    }

    private void searchByModel(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        String model = req.getParameter("search");
        List<Car> result = carService.searchByModel(model);
        RequestDispatcher dispatcher;
        if (result.isEmpty()) {
            req.setAttribute("message", "ko tìm thấy sản phẩm bạn tìm");
            dispatcher = req.getRequestDispatcher("showroom/list.jsp");
        } else {
            req.setAttribute("cars", result);
            dispatcher = req.getRequestDispatcher("/showroom/list.jsp");
        }
        dispatcher.forward(req, resp);
    }

    private void showStatistical(HttpServletRequest req, HttpServletResponse resp) {
        RequestDispatcher requestDispatcher = req.getRequestDispatcher("showroom/statistical.jsp");
        try {
            requestDispatcher.forward(req, resp);
        } catch (ServletException | IOException e) {
            e.printStackTrace();
        }
    }

    private void checkSales(HttpServletRequest req, HttpServletResponse resp)throws ServletException, IOException {
        String startDate = req.getParameter("startDate");
        String endDate = req.getParameter("endDate");
        List<SaleDTO> saleDTO = carService.findAllSaleDTO(startDate, endDate);
        RequestDispatcher requestDispatcher;
        if(saleDTO.isEmpty()) {
            req.setAttribute("message", "ko tìm thấy sản phẩm");
            requestDispatcher = req.getRequestDispatcher("/showroom/statistical.jsp");
        }else{
            req.setAttribute("saleDTO", saleDTO);
            requestDispatcher = req.getRequestDispatcher("/showroom/statistical.jsp");
        }
        requestDispatcher.forward(req, resp);
    }
}
