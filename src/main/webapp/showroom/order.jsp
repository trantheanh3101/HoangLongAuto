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
    <style>

    </style>
</head>

<body class="p-3">
<nav class="navbar navbar-expand-md navbar-light " style="background-color: #607D8B">
    <div class="container-fluid">
        <a class="navbar-brand" href="showroom">
            <img src="${pageContext.request.contextPath}/showroom/images/logoHL2.png" alt="LOGO" width="100px"
                 height="100px">
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
                    <a class="nav-link" href="showroom?action=about"><b>About Me</b></a>
                </li>
            </ul>
        </div>
    </div>
</nav>

<div class="container">
    <form method="post">
        <div class="row">
            <div class="col-md-6">
                <div class="text-center"><h1>Customer Information</h1></div>
                <div class="mb-3">
                    <label for="name" class="form-label">Full name</label><span class="red">*</span>
                    <input type="text" class="form-control" id="name" name="name" required>
                </div>
                <div class="mb-3">
                    <label for="address" class="form-label">Address</label>
                    <input type="text" class="form-control" id="address" name="address" required>
                </div>
                <div class="mb-3">
                    <label for="phoneNumber" class="form-label">Phone number</label>
                    <input type="tel" class="form-control" id="phoneNumber" name="phoneNumber" required>
                </div>
                <div class="mb-3">
                    <label for="email" class="form-label">Email</label>
                    <input type="email" class="form-control" id="email" name="email">
                </div>
            </div>
            <div class="col-md-6">
                <div class="text-center"><h1>Car Detail</h1></div>
                <table class="table table-hover">
                    <tr>
                        <th>Name</th>
                        <td>${car.make} ${car.model}</td>
                        <td></td>
                    </tr>
                    <tr>
                        <th>Price</th>
                        <td>${car.price}</td>
                        <td></td>
                    </tr>
                    <tr>
                        <th>Color</th>
                        <td>${car.color}</td>
                        <td></td>
                    </tr>
                    <tr>
                        <th>Engine type</th>
                        <td>${car.engineType} ${car.horsePower}(Mã Lực)</td>
                    </tr>
                    <tr>
                        <th>Torque</th>
                        <td>${car.torque}</td>
                    </tr>
                    <tr>
                        <th>Xe</th>
                        <td><c:choose>
                            <c:when test="${car.used_car == 1}">
                                NEW
                            </c:when>
                            <c:otherwise>
                                USED
                            </c:otherwise>
                        </c:choose></td>
                    </tr>
                    <tr>
                        <th>Seat capacity</th>
                        <td>${car.settingCapacity}</td>
                    </tr>
                </table>
            </div>
        </div>
        <input class="btn btn-primary form-control" type="submit" value="Confirm" name="submit" id="submit">
        <br>
        <br>
        <h2><c:if test='${requestScope["message"]!= null}'>
            <span style="color: darkblue" class="message">${requestScope["message"]}</span>
        </c:if></h2>
    </form>
</div>
</body>
</html>
