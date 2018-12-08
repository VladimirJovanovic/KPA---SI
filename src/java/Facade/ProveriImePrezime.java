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
public class ProveriImePrezime {
    
    private String imePrezime;

    public ProveriImePrezime(String imePrezime) {
        this.imePrezime = imePrezime;
    }

    
    public boolean validnoImePrezime(){
        
        if(imePrezime.length()<3)
            return false;
        for(int i=0; i<imePrezime.length(); i++)
            if(Character.isDigit(imePrezime.charAt(i)))
                return false;
        return true;
    }
}
