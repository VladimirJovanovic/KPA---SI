/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package Facade;

import model.Korisnik;
import model.ListaPodataka;

/**
 *
 * @author Korisnik
 */
public class ProveriIDKorisnika {
    int idKorisnika;

    public ProveriIDKorisnika(int idKorisnika) {
        this.idKorisnika = idKorisnika;
    }
    
    public boolean validanIdKorisnika(){
        for(Korisnik k : ListaPodataka.listaKorisnika){
            if(k.getId()==idKorisnika){
                return true;
            }
            
        }
        return false;
}
}
