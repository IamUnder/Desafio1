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
public class Pref {
    private String mail;
    private String relacion;
    private int deportes;
    private int arte;
    private int politica;
    private String hijos;
    private String interes;

    public Pref(String mail, String relacion, int deportes, int arte, int politica, String hijos, String interes) {
        this.mail = mail;
        this.relacion = relacion;
        this.deportes = deportes;
        this.arte = arte;
        this.politica = politica;
        this.hijos = hijos;
        this.interes = interes;
    }

    public String getMail() {
        return mail;
    }

    public String getRelacion() {
        return relacion;
    }

    public int getDeportes() {
        return deportes;
    }

    public int getArte() {
        return arte;
    }

    public int getPolitica() {
        return politica;
    }

    public String getHijos() {
        return hijos;
    }

    public String getInteres() {
        return interes;
    }
    
    
}
