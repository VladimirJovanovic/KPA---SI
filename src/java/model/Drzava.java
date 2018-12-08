/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package model;

/**
 *
 * @author Korisnik
 */
public class Drzava {
    private int id;
    private String naziv, pozivniBroj;

    public Drzava(int id, String naziv, String pozivniBroj) {
        this.id = id;
        this.naziv = naziv;
        this.pozivniBroj = pozivniBroj;
    }

    public int getId() {
        return id;
    }

    public void setId(int id) {
        this.id = id;
    }

    public String getNaziv() {
        return naziv;
    }

    public void setNaziv(String naziv) {
        this.naziv = naziv;
    }

    public String getPozivniBroj() {
        return pozivniBroj;
    }

    public void setPozivniBroj(String pozivniBroj) {
        this.pozivniBroj = pozivniBroj;
    }
    
    
}
