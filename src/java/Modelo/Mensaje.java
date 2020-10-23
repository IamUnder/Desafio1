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
public class Mensaje {
    private String user1;
    private String user2;
    private String texto;

    public Mensaje(String user1, String user2, String texto) {
        this.user1 = user1;
        this.user2 = user2;
        this.texto = texto;
    }

    public String getUser1() {
        return user1;
    }

    public String getUser2() {
        return user2;
    }

    public String getTexto() {
        return texto;
    }

    public Mensaje() {
    }
    
    
}
