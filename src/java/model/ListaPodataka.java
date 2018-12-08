/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package model;

import java.util.ArrayList;

/**
 *
 * @author Korisnik
 */
public class ListaPodataka {
    
    public static ArrayList<Korisnik> listaKorisnika = new ArrayList<>();
    public static ArrayList<Kontakt> listaKontakata = new ArrayList<>();
    public static ArrayList<Drzava> listaDrzava = new ArrayList<>();
    
    public static ArrayList<Administrator> listaAdministratora=new ArrayList<Administrator>();
    
    public static String prijavljenKorisnikKorIme="";
    
    public static int generisiIdKontakta(){
    
        int noviId=0;
        for(Kontakt k : listaKontakata){
            if(k.getId()>noviId)
                noviId=k.getId();
        }
        noviId++;
        return noviId;
    }
    
    
}
