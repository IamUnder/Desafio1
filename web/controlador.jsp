<%-- 
    Document   : controlador
    Created on : 04-oct-2019, 11:55:10
    Author     : IamUnder
--%>

<%@page import="Auxiliar.ReCaptcha"%>
<%@page import="java.util.Enumeration"%>
<%@page import="java.util.HashMap"%>
<%@page import="Auxiliar.Bitacora"%>
<%@page import="java.util.LinkedList"%>
<%@page import="Modelo.ConexionEstatica"%>
<%@page import="Modelo.Usuarios"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>

<%
    //  Paso por login
    if (request.getParameter("login") != null) {
        String mail = request.getParameter("email");
        String pass = request.getParameter("pass");
        session.setAttribute("email", mail);
        
        // Varible de el Capcha
        boolean valid = true;
        
        if (session.getAttribute("true") != null) {
            String gRecaptchaResponse = request.getParameter("g-recaptcha-response");
            System.out.println(gRecaptchaResponse);
            
            valid = ReCaptcha.verificar(gRecaptchaResponse);
        }
        
        
        
        ConexionEstatica.nueva();
        Usuarios u = ConexionEstatica.existeUsuario(mail, pass);
        if (u != null && valid) {
            session.removeAttribute("true");
            session.setAttribute("user", u);
            
            if (u.getRol() == 0) {
                //  Es un usuario normal
                response.sendRedirect("Vistas/normal.jsp");
            }else{
                //  Es un admin
                LinkedList usuarios = ConexionEstatica.recuperarUsers();
                session.setAttribute("users", usuarios);
                response.sendRedirect("Vistas/admin.jsp?valor=0");
            }
        }else{
            response.sendRedirect("index.jsp");
        }
    }
    
    // Paso por registro
    if (request.getParameter("signin") != null) {
        response.sendRedirect("registro.jsp");
    }
    
    //  Registro de usuario
    if (request.getParameter("mail") != null) {
        String mail = request.getParameter("email");
        String pass = request.getParameter("pass");
        String nombre = request.getParameter("nombre");
        String sexo = request.getParameter("sexo");
        
        ConexionEstatica.nueva();
        ConexionEstatica.Insertar_Dato(mail, pass, nombre, sexo);
        response.sendRedirect("index.jsp");
    }
    

    if (request.getParameter("loss") != null) {
        response.sendRedirect("pass.jsp");
    }
%>
