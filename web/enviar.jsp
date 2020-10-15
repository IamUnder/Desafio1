<%-- 
    Document   : enviar
    Created on : 06-oct-2020, 23:16:48
    Author     : IamUnder
--%>

<%@page import="Modelo.Usuarios"%>
<%@page import="Modelo.ConexionEstatica"%>
<%@page import="Paq.Email"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
    </head>
    <body>
        <%
            
            ConexionEstatica.nueva();
            
            String mail = request.getParameter("email");
            
            Usuarios u = ConexionEstatica.existeUsuario(mail);
            
            if (u != null) {
                Email email = new Email();
                
                String de = "auxiliardaw2@gmail.com";
                String clave = "Chubaca20";
                String para = mail;
                String mensaje= "La contraseña de su cuenta es: " + u.getPass();
                String asunto = "Recuperar contraseña";


                email.enviarCorreo(de, clave, para, mensaje, asunto);
                out.println("Correo enviado");
            }else{
                out.println("Datos incorrectos");
            }
            
            out.println("<br/> <a href='../index.jsp'><button>Volver a Inicio</button></a>");
            

        %>
    </body>
</html>
