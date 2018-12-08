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
public class ProveriTelefon {
    String telefon;

    public ProveriTelefon(String telefon) {
        this.telefon = telefon;
    }
    
    
    
    public boolean validanTelefon(){

        for(int i=0; i<telefon.length(); i++){
            
            if(!Character.isDigit(telefon.charAt(i)) && telefon.charAt(i)!= '+')
                return false;
            
            if(telefon.charAt(i)== '+' && i!=0)
                return false;
        }
          
       
        return true;
    }
}
