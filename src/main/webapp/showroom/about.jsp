<%--
  Created by IntelliJ IDEA.
  User: Admin
  Date: 7/8/2024
  Time: 3:13 PM
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>About me</title>
    <meta charset="UTF-8">
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/css/bootstrap.min.css" rel="stylesheet"
          integrity="sha384-EVSTQN3/azprG1Anm3QDgpJLIm9Nao0Yz1ztcQTwFspd3yD65VohhpuuCOmLASjC" crossorigin="anonymous">
</head>
<body >
<main>
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
                        <a class="nav-link" href=""><b>About Me</b></a>
                    </li>
                </ul>
            </div>
        </div>
    </nav>
    <section class="about-us" >
        <h2>About Us</h2>
        <p>
            Hoang Long Auto is a leading and trusted car dealership in Viet Nam . With years of experience in the automotive industry, we are committed to providing our customers with the highest quality products and services.
        </p>

        <h3>Our Vision</h3>
        <p>
            To be the preferred destination for car buyers, not only for our exceptional product selection but also for our dedication and professionalism in customer service.
        </p>

        <h3>Our Mission</h3>
        <p>
            To deliver an outstanding car buying experience, fulfilling the needs and desires of our customers, while contributing to the growth of the automotive industry.
        </p>

        <h3>Core Values</h3>
        <ul>
            <li>Integrity and Quality</li>
            <li>Dedication and Professionalism</li>
            <li>Innovation and Creativity</li>
            <li>Social Responsibility</li>
        </ul>
    </section>

    <section class="team">
        <h2>Our Team</h2>
        <img src="${pageContext.request.contextPath}/showroom/images/about.jpg"  alt="LOGO" width="2000px" height="auto">
    </section>

</main>
</body>
<hr>
<footer id="footer" class="overflow-hidden">
    <div class="container">
        <div class="row">
            <div class="col-lg-3 col-sm-6 pb-3">
                <div class="footer-menu">
                    <img src="${pageContext.request.contextPath}/showroom/images/logoHL2.png"  alt="LOGO" width="100px" height="100px">
                    <p>Hoang Long Auto specializes in buying and selling luxury sedans, premium SUVs, Supercars... and is trusted by many influential individuals.</p>
                    <div class="social-links">
                        <ul class="d-flex list-unstyled">
                            <li>
                                <a href="#">
                                    <svg class="facebook">
                                        <use xlink:href="#facebook"/>
                                    </svg>
                                </a>
                            </li>
                            <li>
                                <a href="#">
                                    <svg class="instagram">
                                        <use xlink:href="#instagram"/>
                                    </svg>
                                </a>
                            </li>
                            <li>
                                <a href="#">
                                    <svg class="twitter">
                                        <use xlink:href="#twitter"/>
                                    </svg>
                                </a>
                            </li>
                            <li>
                                <a href="#">
                                    <svg class="linkedin">
                                        <use xlink:href="#linkedin"/>
                                    </svg>
                                </a>
                            </li>
                            <li>
                                <a href="#">
                                    <svg class="youtube">
                                        <use xlink:href="#youtube"/>
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
                    <p>Do you have any queries or suggestions? <a
                            href="mailto:yourinfo@gmail.com">hoanglongauto@gmail.com</a></p>
                    <p>If you need support? Just give us a call. <a href="">+84 111 222 333 44</a></p>
                </div>
            </div>
        </div>
    </div>
    <hr>
</footer>
</html>
