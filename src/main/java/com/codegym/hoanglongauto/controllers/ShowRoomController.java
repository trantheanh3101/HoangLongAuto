package com.codegym.hoanglongauto.controllers;

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
        req.setCharacterEncoding("UTF-8");
        String action = req.getParameter("action");
        if (action == null) {
            action = "";
        }
        switch (action) {
            case "create":
                List<Car> cars = carService.findAll();
                req.setAttribute("cars", cars);
                req.getRequestDispatcher("/showroom/create.jsp").forward(req,resp);
                break;
            case "list":
                showList(req, resp);
                break;
            case "edit":
                showEditForm(req,resp);
                break;
            default:
                showHomeForm(req, resp);
                break;
        }
    }

    private void showEditForm(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException{
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

    private void showList(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        List<Car> cars = carService.findAll();
        req.setAttribute("cars", cars);
        req.getRequestDispatcher("/showroom/list.jsp").forward(req, resp);
    }

    private void showHomeForm(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        List<Car> carDTO = carService.findAll();
        req.setAttribute("cars", carDTO);
        req.getRequestDispatcher("/showroom/home.jsp").forward(req, resp);
    }

    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        req.setCharacterEncoding("UTF-8");
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
            case "delete":
                deleteCar(req, resp);
                break;
            case "edit":
                updateCar(req,resp);
                break;
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

    private void updateCar(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
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

    //    anh long bao rang delete chua chay
    protected void deleteCar(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        Long id = Long.parseLong(req.getParameter("id"));
        boolean isDeleted = carService.removeCar(id);
        if (isDeleted) {
//            resp.sendRedirect("/showroom/list");
            List<Car> cars = carService.findAll();
            req.setAttribute("cars", cars);
            req.getRequestDispatcher("/showroom/list.jsp").forward(req, resp);
        } else {
            req.setAttribute("message", "xoa khong thanh cong");
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
}
