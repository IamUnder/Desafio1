<%-- 
    Document   : index
    Created on : 13-oct-2020, 13:18:38
    Author     : IamUnder
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Login</title>
        <link rel="stylesheet" href="css/cabecera.css">
    </head>
    <body>        
        <form action="controlador.jsp" class="form-box animated fadeInUp">
            <h1 class="form-title">LogIn</h1>
            <input type="text" placeholder="Email" name="email" autofocus>
            <input type="password" placeholder="Password" name="pass">
            <button type="submit" name="login">
                Login
            </button>
            <button type="submit" name="loss">
                Forgot Pass
            </button>
            <button type="submit" name="signin">
                SignIn
            </button>
        </form>
    </body>
</html>
