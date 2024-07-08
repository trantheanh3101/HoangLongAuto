<%--
  Created by IntelliJ IDEA.
  User: Admin
  Date: 7/7/2024
  Time: 9:14 AM
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<html>
<head>
    <title>Them san pham</title>
    <meta charset="UTF-8">
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/css/bootstrap.min.css" rel="stylesheet"
          integrity="sha384-EVSTQN3/azprG1Anm3QDgpJLIm9Nao0Yz1ztcQTwFspd3yD65VohhpuuCOmLASjC" crossorigin="anonymous">
</head>
<body>
<nav class="navbar navbar-expand-lg navbar-light bg-light">
    <div class="container-fluid">
        <a class="navbar-brand" href="/showroom?action=list">Quay lại </a>
        <button class="navbar-toggler" type="button" data-bs-toggle="collapse" data-bs-target="#navbarNavAltMarkup"
                aria-controls="navbarNavAltMarkup" aria-expanded="false" aria-label="Toggle navigation">
            <span class="navbar-toggler-icon"></span>
        </button>
    </div>
</nav>

<div class="container">
    <form method="post">

        <div class="mb-3">
            <label for="model" class="form-label">Tên</label>
            <input type="text" class="form-control" id="model" name="model" required maxlength="50" minlength="3">
        </div>
        <div class="mb-3">
            <label for="name" class="form-label">Nhà sản xuất</label>
            <input type="text" class="form-control" id="name" name="name" required maxlength="50" minlength="3">
        </div>
        <div class="mb-3">
            <label for="year" class="form-label">Năm sản xuất</label>
            <input type="number" class="form-control" id="year" name="year" required>
        </div>
        <div class="mb-3">
            <label class="form-label" for="price">Giá</label>
            <input type="number" class="form-control" id="price" name="price" required>
        </div>
        <div class="mb-3">
            <label class="form-label" for="color">Màu sắc</label>
            <input type="text" class="form-control" id="color" name="color" required>
        </div>
        <div class="mb-3">
            <label class="form-label" for="engineType">Loại động cơ</label>
            <input type="text" class="form-control" id="engineType" name="engineType" required  maxlength="50" minlength="3">
        </div>
        <div class="mb-3">
            <label for="horsePower" class="form-label">Mã lực</label>
            <input type="number" class="form-control" id="horsePower" name="horsePower" required>
        </div>
        <div class="mb-3">
            <label for="torque" class="form-label">Mô-men xoắn</label>
            <input type="number" class="form-control" id="torque" name="torque" required>
        </div>
        <div class="mb-3">
            <label for="seating" class="form-label">Số lượng ghế ngồi</label>
            <input type="number" class="form-control" id="seating" name="seating" required>
        </div>
        <div class="mb-3">
            <label class="form-label" for="description">Mô tả</label>
            <input type="text" class="form-control" id="description" name="description">
        </div>
        <div class="mb-3">
            <label class="form-label" for="img">Hình ảnh</label>
            <input type="text" class="form-control" id="img" name="img">
        </div>
        <div class="mb-3">
            <label class="form-label" for="quantity">Số lượng</label>
            <input type="number" class="form-control" id="quantity" name="quantity" required>
        </div>
        <div class="mb-3">
            <label class="form-label">Tình trạng</label>
            <div class="form-check">
                <input class="form-check-input" type="radio" name="used_car" id="used" value="1" required>
                <label class="form-check-label" for="used">
                    Đã qua sử dụng
                </label>
            </div>
            <div class="form-check">
                <input class="form-check-input" type="radio" name="used_car" id="new" value="0" required>
                <label class="form-check-label" for="new">
                    Mới
                </label>
            </div>
        </div>

        <button type="submit" class="btn btn-primary">Tạo mới</button>
    </form>
</div>
</body>
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/js/bootstrap.bundle.min.js"
        integrity="sha384-MrcW6ZMFYlzcLA8Nl+NtUVF0sA7MsXsP1UyJoMp4YLEuNSfAP+JcXn/tWtIaxVXM"
        crossorigin="anonymous"></script>
</html>
