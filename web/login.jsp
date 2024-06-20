<%-- 
    Document   : login
    Created on : Jun 13, 2024, 7:15:02 PM
    Author     : vanmi
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
    </head>
    <body>
        <h1>Login</h1>

        <form action="login" method="POST">
            <label>Username</label> <br>
            <input type="text" name="username"/> <br>

            <label>Password</label> <br>
            <input type="password" name="password"/> <br>
            
            <input type="submit" value="LOGIN">
            
            <p style="color:red">${requestScope.loginFail}</p>
        </form>
    </body>
</html>
