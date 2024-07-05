<%--
  Created by IntelliJ IDEA.
  User: mac
  Date: 28/06/2024
  Time: 09:30
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<html>
<head>
    <title>Danh sách Sản Phẩm</title>

    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/css/bootstrap.min.css" rel="stylesheet"
          integrity="sha384-EVSTQN3/azprG1Anm3QDgpJLIm9Nao0Yz1ztcQTwFspd3yD65VohhpuuCOmLASjC" crossorigin="anonymous">
</head>
<body>
<nav class="navbar navbar-expand-lg navbar-light bg-light">
    <div class="container-fluid">
        <a class="navbar-brand" href="showroom">Trang chủ</a>
        <button class="navbar-toggler" type="button" data-bs-toggle="collapse" data-bs-target="#navbarNavAltMarkup"
                aria-controls="navbarNavAltMarkup" aria-expanded="false" aria-label="Toggle navigation">
            <span class="navbar-toggler-icon"></span>
        </button>
        <div class="collapse navbar-collapse" id="navbarNavAltMarkup">
            <div class="navbar-nav">
                <select class="form-select form-select-lg mb-3" aria-label=".form-select-lg example">
                    <option selected>Chức năng</option>
                    <option value="1">One</option>
                    <option value="2">Two</option>
                    <option value="3">Three</option>
                </select>
            </div>
        </div>
        <form class="d-flex" action="showroom?action=search" method="post">
            <input class="form-control me-2" type="search" placeholder="Search" aria-label="Search" name="search">
            <input type="hidden" name="action" value="search">
            <button class="btn btn-outline-success" type="submit">Search</button>
        </form>
    </div>
</nav>
<div class="container">
    <button class="btn btn-primary mt-4" onclick="window.location.href='/student?action=create'">Thêm</button>
    <c:if test='${requestScope["message"] != null}'>
        <span class="message">${requestScope["message"]}</span>
    </c:if>
    <table class="table table-hover">
        <thead>
        <tr>
            <th>Số thứ tự</th>
            <th>Hãng Sản Xuất</th>
            <th>Mẫu Xe</th>
            <th>Giá Bán</th>
            <th>Màu Sơn</th>
            <th>Tồn Kho</th>
            <th>Chức năng</th>
        </tr>
        </thead>
        <tbody>
        <%--        for(Student student : students)--%>
        <c:forEach var="car" items="${cars}" varStatus="status">
            <tr>
                <td>${status.count}</td>
                <td>${car.make}</td>
                <td>${car.model}</td>
                <td>${car.price}</td>
                <td>${car.color}</td>
                <td>${car.quantity}</td>
            </tr>
        </c:forEach>
        </tbody>
    </table>
</div>
</body>
</html>
