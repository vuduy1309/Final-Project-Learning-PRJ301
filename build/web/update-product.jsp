<%-- 
    Document   : update-product
    Created on : Jun 9, 2024, 2:29:03 PM
    Author     : vanmi
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
    </head>
    <body>

        <c:if test="${user ne null}">
            <div style="display: flex; justify-content: right; margin: 10px">
                <p style="color: green">
                    Welcome ${sessionScope.user.fullname}
                </p>
            </div>
        </c:if>

        <h1>Update Product</h1>
        <form action="main" method="GET">
            <input type="hidden" name="service" value="update">

            <label>Product ID</label> <br>
            <input type="text" name="id" value="${pu.id}" readonly> <br>

            <label>Product name</label> <br>
            <input type="text" name="name" value="${pu.name}"> <br>

            <label>Price</label> <br>
            <input type="number" name="price" value="${pu.price}"> <br>

            <label>Quantity</label> <br>
            <input type="number" name="quantity" value="${pu.quantity}"> <br>

            <label>Release Date</label> <br>
            <input type="text" name="rd" value="${pu.releaseDate}"> <br>

            <label>Describe</label> <br>
            <input type="text" name="describe" value="${pu.describe}"> 
            <br>

            <label>Image</label> <br>
            <input type="text" name="image" value="${pu.image}">
            <img src="${pu.image}" alt="alt" width="50px" height="50px"/>
            <br>

            <label>Category</label> <br>
            <select style="width: 174px" name="cid">
                <c:forEach items="${categories}" var="c">
                    <option value="${c.id}" 
                            <c:if test="${pu.category.id == c.id}">selected</c:if>
                            >${c.name}</option>
                </c:forEach>
            </select> <br>

            <input type="submit" value="UPDATE PRODUCT"/>

        </form>
    </body>
</html>
