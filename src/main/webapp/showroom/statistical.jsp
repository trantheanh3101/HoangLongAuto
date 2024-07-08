<%@ page contentType="text/html;charset=UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <meta http-equiv="X-UA-Compatible" content="ie=edge">
    <title>Home</title>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/css/bootstrap.min.css" rel="stylesheet"
          integrity="sha384-EVSTQN3/azprG1Anm3QDgpJLIm9Nao0Yz1ztcQTwFspd3yD65VohhpuuCOmLASjC" crossorigin="anonymous">
    <link rel="stylesheet" href="${pageContext.request.contextPath}/showroom/css/style.css">
</head>

<body class="p-3">
<nav class="navbar navbar-expand-md navbar-light " style="background-color: #607D8B">
    <div class="container-fluid">
        <a class="navbar-brand" href="showroom">
            <img src="${pageContext.request.contextPath}/showroom/images/logoHL2.png"  alt="LOGO" width="100px" height="100px">
        </a>
        <button class="navbar-toggler" type="button" data-bs-toggle="collapse" data-bs-target="#navbarSupportedContent"
                aria-controls="navbarSupportedContent" aria-expanded="false" aria-label="Toggle navigation">
            <span class="navbar-toggler-icon"></span>
        </button>
        <div class="collapse navbar-collapse" id="navbarSupportedContent">
            <ul class="navbar-nav me-auto mb-2 mb-lg-0">
                <li class="nav-item">
                    <a class="nav-link active" aria-current="page" href="showroom"><b>Home</b></a>
                </li>
                <li class="nav-item">
                    <a class="nav-link" href="showroom?action=list"><b>List Product</b></a>
                </li>
                <li class="nav-item">
                    <a class="nav-link" href=""><b>Contact</b></a>
                </li>
            </ul>

        </div>
    </div>
</nav>
<div class="container">
    <form method="post">
        <div class="mb-3">
            <div class="col-md-2">
                <label for="startDate" class="form-label">Start date</label>
                <input type="date" class="form-control" id="startDate" name="startDate"
                       value="<%= request.getParameter("startDate") %>">
            </div>

            <div class="col-md-2">
                <label for="endDate" class="form-label">End date</label>
                <input type="date" class="form-control" id="endDate" name="endDate"
                       value="<%= request.getParameter("endDate") %>">
            </div>
            <br>
            <button type="submit" class="btn btn-primary">Check</button>
            <c:if test='${requestScope["message"] != null}'>
                <span class="message">${requestScope["message"]}</span>
            </c:if>
        </div>
    </form>
    <table class="table table-hover">
        <thead>
        <tr>
            <th>Serial Number</th>
            <th>Car Name</th>
            <th>Selling Price</th>
            <th>Car Color</th>
            <th>Inventory</th>
            <th>Quantity</th>
        </tr>
        </thead>
        <tbody>
        <%--        for(Student student : students)--%>
        <c:forEach var="saleDTO" items="${saleDTO}" varStatus="status">
        <tr>
            <td>${status.count}</td>
            <td>${saleDTO.car_make} ${saleDTO.car_model}</td>
            <td>${saleDTO.price}</td>
            <td>${saleDTO.color}</td>
            <td>${saleDTO.quantity}</td>
            <td>${saleDTO.sales}</td>
            <td>
            </td>
            </c:forEach>
        </tbody>
    </table>
</div>
</body>