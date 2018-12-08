/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package Visitor;

import Facade.AzuriranjeKontakataFacade;
import java.sql.SQLException;
import java.util.logging.Level;
import java.util.logging.Logger;
import model.Drzava;
import model.Kontakt;

/**
 *
 * @author Korisnik
 */
public class DodavanjePodataka implements Visitor{

    @Override
    public void dodajPodatak(Kontakt kontakt) {
        try {
            AzuriranjeKontakataFacade.dodajKontakt(kontakt);
        } catch (SQLException ex) {
            Logger.getLogger(DodavanjePodataka.class.getName()).log(Level.SEVERE, null, ex);
        } catch (ClassNotFoundException ex) {
            Logger.getLogger(DodavanjePodataka.class.getName()).log(Level.SEVERE, null, ex);
        }
    }

    @Override
    public void dodajPodatak(Drzava drzava) {
        throw new UnsupportedOperationException("Not supported yet."); //To change body of generated methods, choose Tools | Templates.
    }
    
}
