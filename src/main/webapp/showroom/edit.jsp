<%--
  Created by IntelliJ IDEA.
  User: Admin
  Date: 7/6/2024
  Time: 9:15 AM
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<html>
<head>
    <title>Edit Car</title>
</head>
<body>
<h1>Edit Car</h1>
<p>
    <c:if test='${requestScope["message"]!= null}'>
        <span class="message">${requestScope["message"]}</span>
    </c:if>
</p>
<p>
    <a href="/showroom?action=list">Back to Car list</a>
</p>
<form method="post">
    <fieldset>
        <legend>Car information</legend>
        <table>
            <tr>
                <td>Name: </td>
                <td>
                    <input type="text" name="name" id="name" value="${car.make}">
                    <input type="hidden" name="id" id="id" value="${car.id}">
                </td>
            </tr>
            <tr>
                <td>Model: </td>
                <td>
                    <input type="text" name="model" id="model" value="${car.model}">
                </td>
            </tr>
            <tr>
                <td>Price :</td>
                <td>
                    <input type="text" name="price" id="price" value="${car.price}">
                </td>
            </tr>
            <tr>
                <td>Color :</td>
                <td>
                    <input type="text" name="color" id="color" value="${car.color}">
                </td>
            </tr>
            <tr>
                <td>Quantity :</td>
                <td>
                    <input type="text" name="quantity" id="quantity" value="${car.quantity}">
                </td>
            </tr>
            <tr>
                <td></td>
                <td>
                    <input type="submit" value="Edit car">
                </td>
            </tr>
        </table>
    </fieldset>
</form>
</body>
</html>