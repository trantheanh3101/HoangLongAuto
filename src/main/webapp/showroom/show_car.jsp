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
    <style>
        body{
            margin: 0;
        }
        #header{
            background: rosybrown;
            height: 100px;
            width: 100%;
        }
        #main{
            height: 300px;
            width: 65%;
            float: left;
        }
        #sidebar{
            margin-top: 150px;
            margin-left: 20px;
            padding: 50px;
            background: #ffffff;
            height: 300px;
            width: 30%;
            float: left;
        }
        #footer{
            background: lemonchiffon;
            height: 100px;
            width: 100%;
            clear: both; /*ko cho các thẻ khác xuất hiện 2 bên của thẻ footer*/
        }
    </style>
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
    <c:if test='${requestScope["message"] != null}'>
        <span class="message">${requestScope["message"]}</span>
    </c:if>
    <div id="main">
        <table class="table table-hover">
            <tr>
                <th>${car.img}</th>
            </tr>
            <tr>
                <th>${car.description}</th>
            </tr>
        </table>
    </div>
    <div id="sidebar">
        <table class="table table-hover">
            <h1>Thông tin xe</h1>
            <tr>
                <th>Tên Xe</th>
                <td>${car.make} ${car.model}</td>
            </tr>
            <tr>
                <th>Giá Bán</th>
                <td>${car.price}</td>
            </tr>
            <tr>
                <th>Màu Sơn</th>
                <td>${car.color}</td>
            </tr>
            <tr>
                <th>Tồn Kho</th>
                <td>${car.quantity}</td>
            </tr>
        </table>
        </table>
    </div>
</div>
</body>
</html>
