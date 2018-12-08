/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package Visitor;

import model.Drzava;
import model.Kontakt;

/**
 *
 * @author Korisnik
 */
public interface Visitor {
    
    public void dodajPodatak(Kontakt kontakt);
    public void dodajPodatak(Drzava drzava);
    

}
