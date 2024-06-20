<%-- 
    Document   : StudentPage
    Created on : Jun 4, 2024, 5:36:26 PM
    Author     : vanmi
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Home Page</title>
        <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.5.2/css/all.min.css">
        <style>
            .center-text {
                display: flex;
                justify-content: center;
                padding: 5px;
            }

            .category {
                border: 1px solid black;
                width: 20%
            }

            .product {
                border: 1px solid black;
                width: 80%
            }
            .search-input {
                height: 28px;
                width: 250px;
                border: 2px solid orangered;
                border-radius: 15px
            }

            .search-button {
                height: 34px;
                width: 100px;
                border: 2px solid orangered;
                border-radius: 15px;
                font-weight: bold;
                background-color: #fff;
                cursor: pointer;
            }

        </style>
    </head>
    <body>

        <c:if test="${sessionScope.user eq null}">
            <div style="display: flex; justify-content: right; margin: 10px">
                <a href="login">
                    <button class="search-button">
                        Login
                        <i class="fa fa-sign-in" aria-hidden="true"></i>
                    </button>
                </a>
            </div>
        </c:if>


        <c:if test="${sessionScope.user ne null}">
            <div style="display: flex; justify-content: right; margin: 10px">
                <p style="color: green">
                    Welcome ${sessionScope.user.fullname}
                </p>
            </div>

            <div style="display: flex; justify-content: right; margin: 10px">
                <a href="logout">
                    <button class="search-button">
                        Logout
                        <i class="fa fa-sign-out" aria-hidden="true"></i>
                    </button>
                </a>
            </div>
        </c:if>
        
        <h1 class="center-text">System Management</h1>

        <div style="display: flex">
            <div class="category">
                <h2 class="center-text">Filter</h2>
                <h3>Category</h3>
                <ul style="padding: 0">
                    <c:forEach items="${categories}" var="c">
                        <li class="center-text">
                            <a href="main?service=filter-by-category&cid=${c.id}">${c.name}</a>
                        </li>
                    </c:forEach>
                </ul>

                <h3>Price</h3>
                <ul style="padding: 0">
                    <li class="center-text">
                        <input type="radio" name="price" style="margin: 0 10px"
                               onchange="
                                       window.location.href = 'main?service=filter-by-price&start=10000&end=15000'
                               "
                               <c:if test="${start == 10000 && end == 15000}">checked</c:if>
                                   />
                               <span>
                                   10000 - 15000
                               </span>
                        </li>
                        <li class="center-text">
                            <input type="radio" name="price" style="margin: 0 10px"
                                   onchange="
                                           window.location.href = 'main?service=filter-by-price&start=15000&end=20000'
                                   "
                            <c:if test="${start == 15000 && end == 20000}">checked</c:if>
                                />
                            <span>
                                15000 - 20000
                            </span>
                        </li>
                        <li class="center-text">
                            <input type="radio" name="price" style="margin: 0 10px"
                                   onchange="
                                           window.location.href = 'main?service=filter-by-price&start=20000&end=100000000000'
                                   "
                            <c:if test="${start == 20000}">checked</c:if>
                                />
                            <span>
                                20000+
                            </span>
                        </li>
                    </ul>
                </div>
                <div class="product">
                    <h2 class="center-text">Products</h2>
                    <div style="display: flex; justify-content: center; margin: 10px">

                        <a href="main?service=pre-add" style="text-decoration: none;">
                            <button style="width: 200px; height: 50px; cursor: pointer">ADD A NEW PRODUCT</button>
                        </a>

                    </div>


                    <div class="center-text">
                        <form action="main">
                            <input type="hidden" value="search" name="service"/>
                            <input type="text" name="keywords" placeholder="Search by product name..."
                                   class="search-input" value="${keywords}"
                                   />

                            <button type="submit" class="search-button">
                                Search
                                <i class="fa fa-search" aria-hidden="true"></i>
                            </button>

                        </form>
                    </div>

                    <div style="display: flex; justify-content: right">
                        <a href="main?service=sortByPrice&type=asc">
                            <button class="search-button">Ascending Price</button>
                        </a> 

                        <a href="main?service=sortByPrice&type=desc">
                            <button class="search-button">Descending Price</button>
                        </a>
                    </div>

                    <p style="color: green; font-weight: bold">${actionOK}</p>
                <table border="1">
                    <thead>
                    <th>ID</th>
                    <th>Name</th>
                    <th>Quantity</th>
                    <th>Price</th>
                    <th>Release Date</th>
                    <th>Describe</th>
                    <th>Image</th>
                    <th>Category</th>
                    <th colspan="2">Action</th>
                    </thead>
                    <tbody>
                        <tr>
                            <td colspan="9">
                                ${emptylist}
                            </td>
                        </tr>
                        <c:forEach items="${products}" var="p">
                            <tr>
                                <td>${p.id}</td>
                                <td>${p.name}</td>
                                <td>${p.quantity}</td>
                                <td>${p.price}</td>
                                <td>${p.releaseDate}</td>
                                <td>${p.describe}</td>
                                <td><img src="${p.image}" alt="alt" style="width: 50%"/></td>
                                <td>${p.category.name}</td>
                                <td>
                                    <a href="main?service=preUpdate&pid=${p.id}">Update</a>
                                </td>
                                <td>
                                    <a href="#" onclick="return confirm('Bạn có chắc chắn muốn xoá dữ liệu này?')
                                                    ? window.location.href = 'main?service=delete&pid=${p.id}' : false;">Delete</a>
                                </td>
                            </tr>
                        </c:forEach>
                    </tbody>
                </table>
            </div>
        </div>
    </body>
</html>
