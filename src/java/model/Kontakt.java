/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package model;

import Visitor.Visitable;
import Visitor.Visitor;

/**
 *
 * @author Korisnik
 */
public class Kontakt{
    private int id, fkKorisnik, fkDrzava;
    private String ime, prezime, email, telefon,opis;

    public Kontakt(int id, int fkKorisnik, int fkDrzava, String ime, String prezime, String email, String telefon, String opis) {
        this.id = id;
        this.fkKorisnik = fkKorisnik;
        this.fkDrzava = fkDrzava;
        this.ime = ime;
        this.prezime = prezime;
        this.email = email;
        this.telefon = telefon;
        this.opis = opis;
    }

    public int getId() {
        return id;
    }

    public void setId(int id) {
        this.id = id;
    }

    public int getFkKorisnik() {
        return fkKorisnik;
    }

    public void setFkKorisnik(int fkKorisnik) {
        this.fkKorisnik = fkKorisnik;
    }

    public int getFkDrzava() {
        return fkDrzava;
    }

    public void setFkDrzava(int fkDrzava) {
        this.fkDrzava = fkDrzava;
    }

    public String getIme() {
        return ime;
    }

    public void setIme(String ime) {
        this.ime = ime;
    }

    public String getPrezime() {
        return prezime;
    }

    public void setPrezime(String prezime) {
        this.prezime = prezime;
    }

    public String getEmail() {
        return email;
    }

    public void setEmail(String email) {
        this.email = email;
    }

    public String getTelefon() {
        return telefon;
    }

    public void setTelefon(String telefon) {
        this.telefon = telefon;
    }

    public String getOpis() {
        return opis;
    }

    public void setOpis(String opis) {
        this.opis = opis;
    }


    
    
    
}
