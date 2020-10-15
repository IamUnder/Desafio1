<%-- 
    Document   : pass
    Created on : 15-oct-2020, 18:18:14
    Author     : IamUnder
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Finder Recuperar contraseña</title>
        <link rel="stylesheet" href="cabecera.css">
    </head>
    <body>
        <form action="enviar.jsp" method="post" class="form-box animated fadeInUp">
            <h1 class="form-title">Recuperar contraseña</h1>
            <input type="text" name="email" placeholder="Email" autofocus>
            <button type="submit" name="mail">
                Enviar recuperación
            </button>
        </form>
    </body>
</html>
