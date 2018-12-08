/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package Facade;

import model.Drzava;
import model.ListaPodataka;

/**
 *
 * @author Korisnik
 */
public class ProveriIDDrzave {
    int idDRzave;

    public ProveriIDDrzave(int idDRzave) {
        this.idDRzave = idDRzave;
    }
    
    public boolean validanIDDrzave(){
    
    for(Drzava d : ListaPodataka.listaDrzava){
        if(d.getId()==idDRzave){
            return true;
        }
    }
    return false;
}
    
}
