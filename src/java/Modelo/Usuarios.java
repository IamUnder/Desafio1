/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package Modelo;

/**
 *
 * @author IamUnder
 */
public class Usuarios {
    private String mail;
    private String pass;
    private String nombre;
    private String sexo;
    private int rol;
    private int activo;

    public Usuarios(String mail, String pass, String nombre, String sexo) {
        this.mail = mail;
        this.pass = pass;
        this.nombre = nombre;
        this.sexo = sexo;
        this.rol = 0;
        this.activo = 0;
    }

    public Usuarios(String mail, String pass, String nombre, String sexo, int rol, int activo) {
        this.mail = mail;
        this.pass = pass;
        this.nombre = nombre;
        this.sexo = sexo;
        this.rol = rol;
        this.activo = activo;
    }

    public int getRol() {
        return rol;
    }

    public int getActivo() {
        return activo;
    }

    public String getPass() {
        return pass;
    }
    
    
    
    
}
