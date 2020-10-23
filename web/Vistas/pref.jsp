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
        <form action="../controlador.jsp" class="form-box animated fadeInUp" novalidate>
            <h1 class="form-title">Preferencias</h1>

            <h2>Tipo de relacion:</h2>
            <label for="seria">
                <input type="radio" id="seria" name="relacion" value="seria">
                Seria
            </label>
            <label for="exporadica"> 
                <input type="radio" id="exporadica" name="relacion" value="exporadica">
                Exporadica
            </label>

            <h2>Interes en:</h2>
            <label for="deportes">Deportes: 
                <input type="number" name="deportes" id="deportes" min="0" max="100"> </label>
            <label for="arte">Arte: 
                <input type="number" name="arte" id="arte" min="0" max="100"> </label>
            <label for="politica">Politica: 
                <input type="number" name="politica" id="politica" min="0" max="100"> </label>


            <h2>Hijos: </h2>
            <label for="tiene">
                <input type="radio" id="quieres" name="hijos" value="tiene">
                Tienes
            </label>
            <label for="quieres"> 
                <input type="radio" id="quieres" name="hijos" value="quieres">
                Quieres
            </label>


            <h2>Interesado en: </h2>
            <label for="hombress">
                <input type="radio" id="hombres" name="interes" value="hombres">
                Hombres
            </label>
            <label for="mujeres"> 
                <input type="radio" id="mujeres" name="interes" value="mujeres">
                Mujeres
            </label>
            <label for="ambos"> 
                <input type="radio" id="ambos" name="interes" value="ambos">
                Ambos
            </label>
            <button type="submit" name="pref">
                Enviar
            </button>
        </form>
    </body>
</html>
