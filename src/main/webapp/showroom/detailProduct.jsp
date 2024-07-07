<%--
  Created by IntelliJ IDEA.
  User: TheAnh
  Date: 7/7/2024
  Time: 9:43 PM
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<html>
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <meta http-equiv="X-UA-Compatible" content="ie=edge">
    <title>Detail Product</title>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/css/bootstrap.min.css" rel="stylesheet"
          integrity="sha384-EVSTQN3/azprG1Anm3QDgpJLIm9Nao0Yz1ztcQTwFspd3yD65VohhpuuCOmLASjC" crossorigin="anonymous">
    <link rel="stylesheet" href="${pageContext.request.contextPath}/showroom/css/style.css">
</head>

<body class="p-3">
<nav class="navbar navbar-expand-md navbar-light " style="background-color: #607D8B">
    <div class="container-fluid">
        <a class="navbar-brand" href="#">
            <img src="${pageContext.request.contextPath}/showroom/images/LOGO.jpg"  alt="LOGO" width="250px" height="100px">
        </a>
        <button class="navbar-toggler" type="button" data-bs-toggle="collapse" data-bs-target="#navbarSupportedContent" aria-controls="navbarSupportedContent" aria-expanded="false" aria-label="Toggle navigation">
            <span class="navbar-toggler-icon"></span>
        </button>
        <div class="collapse navbar-collapse" id="navbarSupportedContent">
            <ul class="navbar-nav me-auto mb-2 mb-lg-0">
                <li class="nav-item">
                    <a class="nav-link active" aria-current="page" href="#">Home</a>
                </li>
                <li class="nav-item">
                    <a class="nav-link" href="showroom?action=list">List Product</a>
                </li>
                <li class="nav-item">
                    <a class="nav-link" href="">Contract</a>
                </li>
            </ul>

        </div>
    </div>
</nav>
<main>
    <div class="container">
        <nav class="navbar navbar-expand-lg navbar-dark mt-3 mb-5 shadow p-2" style="background-color: #607D8B">
            <div class="container-fluid">
                <a class="navbar-brand" href="#">Products</a>
                <button class="navbar-toggler" type="button" data-mdb-toggle="collapse" data-mdb-target="#navbarSupportedContent2" aria-controls="navbarSupportedContent2" aria-expanded="false" aria-label="Toggle navigation">
                    <i class="fas fa-bars"></i>
                </button>
                <div class="collapse navbar-collapse" id="navbarSupportedContent2">
                    <ul class="navbar-nav me-auto mb-2 mb-lg-0">
                        <li class="nav-item acitve">
                            <a class="nav-link text-white" href="#">All</a>
                        </li>
                        <li class="nav-item">
                            <a class="nav-link text-white" href="#">New Cars</a>
                        </li>
                        <li class="nav-item">
                            <a class="nav-link text-white" href="#">Old Cars</a>
                        </li>
                        <li class="nav-item">
                            <a class="nav-link text-white" href="#">Sales Cars</a>
                        </li>
                    </ul>
                    <form class="d-flex">
                        <input class="form-control me-3" type="search" placeholder="Search" aria-label="Search">
                        <button class="btn btn-outline-info  text-white" type="submit">Search</button>
                    </form>
                </div>
            </div>
        </nav>
        <!-- Products Detail -->
        <section class="padding-large">
            <div class="container mt-5">
                <div class="row">
                    <div class="col-md-6 mb-4">
                        <img src="${pageContext.request.contextPath}/showroom/images/2023-Toyota-Vios.jpg" class="img-fluid" alt="" />
                    </div>
                    <div class="col-md-6 mb-4">
                        <div class="p-4">
                            <div class="mb-3">
                                <a href="">
                                    <span class="badge bg-info me-1">New</span>
                                </a>
                                <a href="">
                                    <span class="badge bg-danger me-1">Bestseller</span>
                                </a>
                            </div>
                            <p class="lead">
                        <span class="me-1">
                            <del>$200</del>
                        </span>
                                <span>$100</span>
                            </p>
                            <strong><p style="font-size: 20px;">Description</p></strong>
                            <p>Xe giamr gias  </p>
                            <form class="d-flex justify-content-left">
                                <div class="form-outline me-1" style="width: 100px;">
                                    <input type="number" value="1" class="form-control" />
                                </div>
                                <button class="btn btn-primary ms-1" type="submit">
                                    Contact
                                    <i class="fas fa-shopping-cart ms-1"></i>
                                </button>
                            </form>
                        </div>
                    </div>
                </div>
                <hr />
                <div class="row d-flex justify-content-center">
                    <div class="col-md-6 text-center">
                        <h4 class="my-4 h4">Tham khảo</h4>

                        <p>Tham khảo</p>
                    </div>
                </div>

                <div class="row">
                    <div class="col-lg-4 col-md-12 mb-4">
                        <img src="${pageContext.request.contextPath}/showroom/images/BMW-x3.jpg" class="img-fluid" alt="" />
                    </div>
                    <div class="col-lg-4 col-md-6 mb-4">
                        <img src="${pageContext.request.contextPath}/showroom/images/EverestPlatinum.jpg" class="img-fluid" alt="" />
                    </div>
                    <div class="col-lg-4 col-md-6 mb-4">
                        <img src="h${pageContext.request.contextPath}/showroom/images/Ford_Ranger.jpg" class="img-fluid" alt="" />
                    </div>
                </div>
            </div>
        </section>
    </div>
</main>
<footer id="footer" class="overflow-hidden">
    <div class="container">
        <div class="row">
            <div class="col-lg-3 col-sm-6 pb-3">
                <div class="footer-menu">
                    <img src="${pageContext.request.contextPath}/showroom/images/LOGO.jpg" alt="logo" width="150px" height="150px">
                    <p>Chào mưng den voi gara cuar chung toi</p>
                    <div class="social-links">
                        <ul class="d-flex list-unstyled">
                            <li>
                                <a href="#">
                                    <svg class="facebook">
                                        <use xlink:href="#facebook" />
                                    </svg>
                                </a>
                            </li>
                            <li>
                                <a href="#">
                                    <svg class="instagram">
                                        <use xlink:href="#instagram" />
                                    </svg>
                                </a>
                            </li>
                            <li>
                                <a href="#">
                                    <svg class="twitter">
                                        <use xlink:href="#twitter" />
                                    </svg>
                                </a>
                            </li>
                            <li>
                                <a href="#">
                                    <svg class="linkedin">
                                        <use xlink:href="#linkedin" />
                                    </svg>
                                </a>
                            </li>
                            <li>
                                <a href="#">
                                    <svg class="youtube">
                                        <use xlink:href="#youtube" />
                                    </svg>
                                </a>
                            </li>
                        </ul>
                    </div>
                </div>
            </div>
            <div class="col-lg-2 col-sm-6 pb-3">
                <div class="footer-menu text-uppercase">
                    <h5 class="widget-title pb-2">Quick Links</h5>
                    <ul class="menu-list list-unstyled text-uppercase">
                        <li class="menu-item pb-2">
                            <a href="#">Home</a>
                        </li>
                        <li class="menu-item pb-2">
                            <a href="#">About</a>
                        </li>
                        <li class="menu-item pb-2">
                            <a href="#">Shop</a>
                        </li>
                        <li class="menu-item pb-2">
                            <a href="#">Blogs</a>
                        </li>
                        <li class="menu-item pb-2">
                            <a href="#">Contact</a>
                        </li>
                    </ul>
                </div>
            </div>
            <div class="col-lg-3 col-sm-6 pb-3">
                <div class="footer-menu text-uppercase">
                    <h5 class="widget-title pb-2">Help & Info Help</h5>
                    <ul class="menu-list list-unstyled">
                        <li class="menu-item pb-2">
                            <a href="#">Track Your Order</a>
                        </li>
                        <li class="menu-item pb-2">
                            <a href="#">Returns Policies</a>
                        </li>
                        <li class="menu-item pb-2">
                            <a href="#">Shipping + Delivery</a>
                        </li>
                        <li class="menu-item pb-2">
                            <a href="#">Contact Us</a>
                        </li>
                        <li class="menu-item pb-2">
                            <a href="#">Faqs</a>
                        </li>
                    </ul>
                </div>
            </div>
            <div class="col-lg-3 col-sm-6 pb-3">
                <div class="footer-menu contact-item">
                    <h5 class="widget-title text-uppercase pb-2">Contact Us</h5>
                    <p>Do you have any queries or suggestions? <a href="mailto:yourinfo@gmail.com">yourinfo@gmail.com</a></p>
                    <p>If you need support? Just give us a call. <a href="">+55 111 222 333 44</a></p>
                </div>
            </div>
        </div>
    </div>
    <hr>
</footer>
</body>
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/js/bootstrap.bundle.min.js"
        integrity="sha384-MrcW6ZMFYlzcLA8Nl+NtUVF0sA7MsXsP1UyJoMp4YLEuNSfAP+JcXn/tWtIaxVXM"
        crossorigin="anonymous"></script>
<script src="https://code.jquery.com/jquery-3.5.1.slim.min.js"></script>
<script src="https://cdn.jsdelivr.net/npm/@popperjs/core@2.5.3/dist/umd/popper.min.js"></script>
</html>

