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
            case "statistical":
                showStatistical(req, resp);
                break;
            default:
                showHomeForm(req, resp);
                break;
        }
    }

    private void showStatistical(HttpServletRequest req, HttpServletResponse resp) {
        RequestDispatcher requestDispatcher = req.getRequestDispatcher("showroom/statistical.jsp");
        try {
            requestDispatcher.forward(req, resp);
        } catch (ServletException | IOException e) {
            e.printStackTrace();
        }
    }

    // Long làm phần này.
    private void showCar(HttpServletRequest req, HttpServletResponse resp) {
        long id = Long.parseLong(req.getParameter("id"));
        Car car = carService.findById(id);
        req.setAttribute("car", car);
        RequestDispatcher requestDispatcher = req.getRequestDispatcher("showroom/show_car.jsp");
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
        req.getRequestDispatcher("/showroom/home.jsp").forward(req, resp);
    }

    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        String action = req.getParameter("action");
        if (action == null) {
            action = "";
        }
        switch (action) {
            case "create":
                break;
            case "search":
                searchByModel(req, resp);
                break;
            case "delete":
                deleteCar(req, resp);
                break;
            case "statistical":
                checkSales(req, resp);
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

    private void deleteCar(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        int id = Integer.parseInt(req.getParameter("id"));
        Boolean isDeleted = carService.removeCar(id);
        if (isDeleted) {
            resp.sendRedirect("/showroom/list");
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
}
