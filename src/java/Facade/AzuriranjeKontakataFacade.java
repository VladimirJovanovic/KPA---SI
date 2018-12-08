/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package Facade;

import java.sql.SQLException;
import model.AzuriranjeBaze;
import model.Kontakt;
import model.ListaPodataka;

/**
 *
 * @author Korisnik
 */
public class AzuriranjeKontakataFacade {
    
    
//(int id, int fkKorisnik, int fkDrzava, String ime, String prezime, String email, String telefon, String opis)
    public static boolean dodajKontakt(Kontakt kontakt) throws SQLException, ClassNotFoundException{
    
        ProveriIDKorisnika proveriIdKorisnika=new ProveriIDKorisnika(kontakt.getFkKorisnik());
        ProveriIDDrzave proveriIDDrzave = new ProveriIDDrzave(kontakt.getFkDrzava());
        
        ProveriImePrezime proveriIme = new ProveriImePrezime(kontakt.getIme());
        ProveriImePrezime proveriPrezime = new ProveriImePrezime(kontakt.getPrezime());
        
        ProveriEmail proveriEmail = new ProveriEmail(kontakt.getEmail());
        ProveriTelefon proveriTelefon = new ProveriTelefon(kontakt.getTelefon());
        
        if(
            proveriIdKorisnika.validanIdKorisnika()&&
            proveriIDDrzave.validanIDDrzave() &&
            proveriEmail.validanEmail() &&
            proveriIme.validnoImePrezime() &&
            proveriPrezime.validnoImePrezime() &&
            proveriTelefon.validanTelefon()
            ){
            
            ListaPodataka.listaKontakata.add(kontakt);
            AzuriranjeBaze.dodajKontakt(kontakt);
        
            return true;
        }
        
        return false;
            
    }
}
