<%-- 
    Document   : admin
    Created on : 14-oct-2020, 11:10:23
    Author     : IamUnder
--%>

<%@page import="Modelo.Pref"%>
<%@page import="Modelo.Usuarios"%>
<%@page import="java.util.LinkedList"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Crud Administrador</title>
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
                <form name="for" action="../controlador.jsp" method="POST" class="crud">
                    <input type="text" name ="email" placeholder="USUARIO" readonly>
                    <input type="text" name ="nombre" placeholder="AFINIDAD" readonly>
                </form>
                <%
                    LinkedList<Pref> prefs = (LinkedList) session.getAttribute("prefs");
                    LinkedList afi = (LinkedList) session.getAttribute("afi");
                    Usuarios u = (Usuarios) session.getAttribute("user");
                    int i = 0;
                    for (Pref paux : prefs) {
                        if (!paux.getMail().equals(u.getMail())) {


                %>

                <form name="for" action="../controlador.jsp" method="POST" class="crud">
                    <input type="text" name ="email" value='<%= paux.getMail()%>' readonly>
                    <input type="text" name ="nombre" value='<%= afi.get(i)%>' readonly>
                    <input type="submit" name="peticion" value="Enviar peticion amistad">
                </form>

                <%
                        }
                        i++;
                    }
                %>
            </section>
            <div class="col-l-1 col-m-0 alto"></div>
        </main>
        <footer>
            <h2>Pagina desarollada por <b>Jorge Olmo Villa</b></h2>
        </footer>
    </body>
</html>
