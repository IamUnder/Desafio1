<%-- 
    Document   : pref
    Created on : 22-oct-2020, 22:08:49
    Author     : IamUnder
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Finder Seleccion de preferencias</title>
        <link rel="stylesheet" href="../cabecera.css">
    </head>
    <body>
        <form action="controlador.jsp" class="form-box animated fadeInUp" novalidate>
        <h1 class="form-title">Preferencias</h1>
        <input type="text" placeholder="Email" name="email" id="email"> <!-- hay que cambiarlo por el select -->
        <!-- <small id="emailError" class="form-text error" aria-live="polite"></small> -->
        <label for="deportes">Deportes: 
        <input type="number" name="deportes" id="deportes" min="0" max="100"> </label>
        <label for="deportes">Arte: 
        <input type="number" name="arte" id="arte" min="0" max="100"> </label>
        <label for="deportes">Politica: 
        <input type="number" name="politica" id="politica" min="0" max="100"> </label>
        <!-- <small id="passError" class="form-text error" aria-live="polite"></small> -->
        
        <input type="text" placeholder="Email" name="email" id="email"> <!-- cambiar por selects de hijos -->
        <input type="text" placeholder="Email" name="email" id="email"> <!-- cambiar por selects de intereses -->
        <!-- añadir captcha -->
        <button type="submit" name="login">
            Login
        </button>
    </body>
</html>
