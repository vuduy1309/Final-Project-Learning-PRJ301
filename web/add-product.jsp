<%-- 
    Document   : add-product
    Created on : Jun 6, 2024, 7:45:58 PM
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

        <h1>Add Product</h1>
        <form action="main" method="GET">
            <input type="hidden" name="service" value="add">

            <label>Product ID</label> <br>
            <input type="text" name="id"> <br>

            <label>Product name</label> <br>
            <input type="text" name="name"> <br>

            <label>Price</label> <br>
            <input type="number" name="price"> <br>

            <label>Quantity</label> <br>
            <input type="number" name="quantity"> <br>

            <label>Release Date</label> <br>
            <input type="text" name="rd"> <br>

            <label>Describe</label> <br>
            <input type="text" name="describe"> <br>

            <label>Image</label> <br>
            <input type="text" name="image"> <br>

            <label>Category</label> <br>
            <select style="width: 174px" name="cid">
                <c:forEach items="${categories}" var="c">
                    <option value="${c.id}" >${c.name}</option>
                </c:forEach>
            </select> <br>

            <input type="submit" value="ADD NEW PRODUCT"/>

            <p style="color: red; font-weight: bold">${insertFail}</p>
        </form>
    </body>
</html>
