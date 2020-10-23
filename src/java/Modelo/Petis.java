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
public class Petis {
    private String mail1;
    private String mail2;
    private int aceptada;

    public Petis(String mail1, String mail2, int aceptada) {
        this.mail1 = mail1;
        this.mail2 = mail2;
        this.aceptada = aceptada;
    }

    public String getMail1() {
        return mail1;
    }

    public String getMail2() {
        return mail2;
    }

    public int getAceptada() {
        return aceptada;
    }
    
    
}
