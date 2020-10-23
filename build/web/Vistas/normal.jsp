<%-- 
    Document   : normal
    Created on : 14-oct-2020, 11:04:34
    Author     : IamUnder
--%>

<%@page import="Modelo.Usuarios"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Finder</title>
        <link rel="stylesheet" href="rejilla.css">
        <link rel="stylesheet" href="cabecera.css">
    </head>
    <body>
        <header>
            <nav>
                <img src="../img/logo.png" alt="logo finder" class="logo">
                <ul>
                    <li><a href="../controlador.jsp?radar=radar">Radar</a></li>
                    <li><a href="../controlador.jsp?amigos=amigos">Amigos</a></li>
                    <li><a href="../controlador.jsp?msg=msg">Mensajes</a></li>
                </ul>
                <ul>
                    <li>Usuarios conectados: </li>
                    <li>Amigos conectados: </li>
                </ul>
            </nav>
        </header>
        <main class="row alto">
            <div class="col-l-1 col-m-0 alto"></div>
            <section class="col-l-8 col-m-10 alto">
                <%
                    Usuarios u = (Usuarios) session.getAttribute("user");
                    out.println("<h1> Bienvenido " + u.getNombre() + "</h1>");
                %>
            </section>
            <div class="col-l-1 col-m-0 alto"></div>
        </main>
        <footer>
            <h2>Pagina desarollada por <b>Jorge Olmo Villa</b></h2>
        </footer>
    </body>
</html>
