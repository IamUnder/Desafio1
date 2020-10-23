<%-- 
    Document   : admin
    Created on : 14-oct-2020, 11:10:23
    Author     : IamUnder
--%>

<%@page import="Modelo.Petis"%>
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
                <h1>Peticiones por aceptar</h1>
                <%
                    Usuarios u = (Usuarios) session.getAttribute("user");
                    LinkedList<Petis> sol = (LinkedList) session.getAttribute("sol");
                    for (Petis paux : sol) {
                %>



                <%
                    if (paux.getAceptada() == 0) {
                %>

                <form name="for" action="../controlador.jsp" method="POST" class="crud">
                    <%
                        if (u.getMail().equals(paux.getMail1())) {
                            out.println("<input type='text' name ='email2' value=" + paux.getMail2() + " readonly>");
                        } else {
                            out.println("<input type='text' name ='email1' value=" + paux.getMail1() + " readonly>");
                        }
                    %>
                    <input type="submit" name="ySol" value="Aceptar">
                    <input type="submit" name="nSol" value="Rechazar">
                </form>

                <%
                        }
                    }
                %>
                <h1>Peticiones aceptadas</h1> 
                <%
                    for (Petis paux : sol) {
                        if (paux.getAceptada() == 1) {
                %>
                <form name="for" action="../controlador.jsp" method="POST" class="crud">
                    <%
                        if (u.getMail().equals(paux.getMail1())) {
                            out.println("<input type='text' name ='email2' value=" + paux.getMail2() + " readonly>");
                        } else {
                            out.println("<input type='text' name ='email1' value=" + paux.getMail1() + " readonly>");
                        }
                    %>  

                    <input type="submit" name="send" value="Enviar Mensaje">
                    <input type="submit" name="nSol" value="Eliminar amigo">
                </form> 
                <%
                        }

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
