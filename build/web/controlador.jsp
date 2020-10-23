<%-- 
    Document   : controlador
    Created on : 04-oct-2019, 11:55:10
    Author     : IamUnder
--%>

<%@page import="Modelo.Pref"%>
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
                if (u.getActivo()== 1) { 
                    Pref p = ConexionEstatica.pref(u.getMail());
                    if (p != null) {
                        session.setAttribute("pref", p);
                        response.sendRedirect("Vistas/normal.jsp");    
                    }else{
                        response.sendRedirect("Vistas/pref.jsp");
                    }
                } else {
                    response.sendRedirect("Vistas/error.jsp");   
                };
                
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
    

   
    //  Cambiar el rol en el crud
    if (request.getParameter("rolCRUD") != null) {
        String email = request.getParameter("email");
        int rol = Integer.parseInt(request.getParameter("rol"));
        
        ConexionEstatica.nueva();
        if (rol == 0) {
            ConexionEstatica.cambiarRol(email,1);
            LinkedList usuarios = ConexionEstatica.recuperarUsers();
            session.setAttribute("users", usuarios);
            response.sendRedirect("Vistas/admin.jsp?valor=1");
        } else {
            ConexionEstatica.cambiarRol(email,0);
            LinkedList usuarios = ConexionEstatica.recuperarUsers();
            session.setAttribute("users", usuarios);
            response.sendRedirect("Vistas/admin.jsp?valor=0");
        }
    }
    
    //  Activar o desactivar los usuarios
    if (request.getParameter("actCRUD") != null) {
        String email = request.getParameter("email");
        int rol = Integer.parseInt(request.getParameter("rol"));
        int activo = Integer.parseInt(request.getParameter("activo"));

        ConexionEstatica.nueva();
        if (activo == 0) {
            ConexionEstatica.cambiarEstado(email,1);
            LinkedList usuarios = ConexionEstatica.recuperarUsers();
            session.setAttribute("users", usuarios);
            
        } else {
            ConexionEstatica.cambiarEstado(email,0);
            LinkedList usuarios = ConexionEstatica.recuperarUsers();
            session.setAttribute("users", usuarios);
            
        }
        
        if (rol == 0) {
           response.sendRedirect("Vistas/admin.jsp?valor=0");     
        }else{
            response.sendRedirect("Vistas/admin.jsp?valor=1");
        }
    }
    
    //  Eliminar usuarios en el crud
    if (request.getParameter("supCRUD") != null) {
        String email = request.getParameter("email");
        int rol = Integer.parseInt(request.getParameter("rol"));

        ConexionEstatica.nueva();
        
        ConexionEstatica.borrarUser(email);
        LinkedList usuarios = ConexionEstatica.recuperarUsers();
        session.setAttribute("users", usuarios);
        
        if (rol == 0) {
           response.sendRedirect("Vistas/admin.jsp?valor=0");     
        }else{
            response.sendRedirect("Vistas/admin.jsp?valor=1");
        }
    }
    

    // Rejistro de preferencias
    if (request.getParameter("pref") != null) {
        Usuarios u = (Usuarios) session.getAttribute("user");
        String relacion = request.getParameter("relacion");
        int deportes = Integer.parseInt(request.getParameter("deportes"));
        int arte = Integer.parseInt(request.getParameter("arte"));
        int politica = Integer.parseInt(request.getParameter("politica"));
        String hijos = request.getParameter("hijos");
        String interes = request.getParameter("interes");
        
        ConexionEstatica.nueva();
        Pref aux = new Pref(u.getMail(),relacion,deportes,arte,politica,hijos,interes);
        ConexionEstatica.Insertar_Pref(aux);
        response.sendRedirect("Vistas/normal.jsp");
        
    }

%>
