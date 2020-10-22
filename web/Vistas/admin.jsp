<%-- 
    Document   : admin
    Created on : 14-oct-2020, 11:10:23
    Author     : IamUnder
--%>

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
                    <li><a href="admin.jsp?valor=0">Ver usuarios</a></li>
                    <li><a href="admin.jsp?valor=1">Ver administradores</a></li>
                    <li><a href="normal.jsp">Usuario Normal</a></li>
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
                    int v = Integer.parseInt(request.getParameter("valor"));        
                    LinkedList<Usuarios> users = (LinkedList) session.getAttribute("users");
                    
                    for (Usuarios uaux : users) {
                        if (uaux.getRol() == v ) {
                          %>
                            
                            <form name="for" action="../controlador.jsp" method="POST">
                                <input type="text" name ="email" value='<%= uaux.getMail() %>' readonly>
                                <input type="text" name ="nombre" value='<%= uaux.getNombre() %>' readonly>
                                <input type="text" name ="sexo" value='<%= uaux.getSexo() %>' readonly>
                                <input type="text" name ="rol" value='<%= uaux.getRol()%>' readonly>
                                <input type="text" name ="activo" value='<%= uaux.getActivo()%>' readonly>
                                <input type="submit" name="actCRUD" value="Activar/Desactivar Usuario">
                                <input type="submit" name="rolCRUD" value="Cambiar rol">
                                <input type="submit" name="supCRUD" value="Eliminar Usuario">
                            </form>
                            
                            <%      
                        }        
                    }
                %>
            </section>
            <div class="col-l-1 col-m-0 alto"></div>
        </main>
    </body>
</html>
