/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package Facade;

/**
 *
 * @author Korisnik
 */
public class ProveriEmail {
 
    private String email;

    public ProveriEmail(String email) {
        this.email = email;
    }
    public boolean validanEmail() {
        boolean postoji=false;
        for(int i=0; i<email.length(); i++)
            if(email.charAt(i)=='@'){
                postoji=true;
            }
        
        
        return postoji;

    }
}
