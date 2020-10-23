<%-- 
    Document   : registro
    Created on : 14-oct-2020, 12:10:46
    Author     : IamUnder
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Finder Registro</title>
        <link rel="stylesheet" href="cabecera.css">
    </head>
    <body onload="validar()">
        <form action="controlador.jsp" method="post" class="form-box animated fadeInUp">
            <h1 class="form-title">Registro</h1>
            <input type="text" placeholder="Mail" name="email" required>
            <input type="text" placeholder="Nombre Completo" name="nombre" required>
            <input type="password" placeholder="Password" name="pass" required>

            <label for="hombre">Hombre
                <input type="radio" id="hombre" name="sexo" value="hombre" checked >
            </label>
            <label for="mujer">Mujer:
                <input type="radio" id="mujer" name="sexo" value="mujer">
            </label>

            <!-- captcha matematico -->
            <canvas id="captcha"></canvas>
            <input type="text" id="txtInput"/>

            <button type="submit" name="mail">
                Registrarse
            </button>
        </form>

        <script src="js/valReg.js"></script>
    </body>
</html>
