<%-- 
    Document   : index
    Created on : 04-oct-2019, 11:52:37
    Author     : IamUnder
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Finder</title>
        <link rel="stylesheet" href="cabecera.css">
        <script src="https://www.google.com/recaptcha/api.js"></script>
    </head>
    <body>
        
        <form action="controlador.jsp" class="form-box animated fadeInUp">
        <h1 class="form-title">LogIn</h1>
        <input type="text" placeholder="Email" name="email" autofocus>
        <input type="password" placeholder="Password" name="pass">
        
        <%
            int n = ((int)(Math.random()*10))+1;
            if (n < 5 || session.getAttribute("true") != null) {
                session.setAttribute("true", "true");
                out.println("<div name='captcha' class='g-recaptcha' data-sitekey='6LdF9NgZAAAAANJwYPfjvh_vZzTrABKDBpXQcfBx'></div>");
            }
        
        %>
        
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
