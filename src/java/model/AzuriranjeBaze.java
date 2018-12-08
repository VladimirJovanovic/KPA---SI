/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package model;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.ArrayList;

/**
 *
 * @author Korisnik
 */
public class AzuriranjeBaze {
    
    /*
    public static String mysqlDriverString="com.mysql.jdbc.Driver";
    public static String mysqlUrlString="jdbc:mysql://localhost:3306/webkontakti";;
    //Class.forName("com.mysql.jdbc.Driver").newInstance();
    public static String mysqlUser="root";
    public static String mysqPass="root";
*/
    
    public static void dodajDrzavu(Drzava d) throws SQLException, ClassNotFoundException{
    
        //Connection conn=DriverManager.getConnection(mysqlUrlString, mysqlUser, mysqPass);
        Class.forName("com.mysql.jdbc.Driver");
        String connString="jdbc:mysql://localhost/webkontakti?" + 
                                   "user=root&password=root";
        Connection conn=DriverManager.getConnection(connString);
        
        String insertNaredba="insert into drzava(id, naziv,pozivniBroj) values(?,?,?);";
        PreparedStatement ps=conn.prepareStatement(insertNaredba);
        
        ps.setInt(1, d.getId());
        ps.setString(2, d.getNaziv());
        ps.setString(3, d.getPozivniBroj());
        
        ps.executeUpdate();
        
    }
    
     public static void dodajKontakt(Kontakt k) throws SQLException, ClassNotFoundException{

        Class.forName("com.mysql.jdbc.Driver");
        String connString="jdbc:mysql://localhost/webkontakti?" + 
                                   "user=root&password=root";
        Connection conn=DriverManager.getConnection(connString);
        
        String insertNaredba="insert into kontakti(id,  fkKorisnik,  fkDrzava,  ime,  prezime,  email,  telefon,  opis) values(?,?,?,?,?,?,?,?);";
        PreparedStatement ps=conn.prepareStatement(insertNaredba);
        
        ps.setInt(1, k.getId());
        ps.setInt(2, k.getFkKorisnik());
        ps.setInt(3, k.getFkDrzava());
        ps.setString(4, k.getIme());
        ps.setString(5, k.getPrezime());
        ps.setString(6, k.getEmail());
        ps.setString(7, k.getTelefon());
        ps.setString(8, k.getOpis());
        
        
        ps.executeUpdate();
        
    }
     
     public static void izmeniKontakt(Kontakt k) throws ClassNotFoundException, SQLException{
     
        Class.forName("com.mysql.jdbc.Driver");
        String connString="jdbc:mysql://localhost/webkontakti?" + 
                                   "user=root&password=root";
        Connection conn=DriverManager.getConnection(connString);
        
        String sqlIzmena="update kontakti set fkDrzava=?,ime=?,  prezime=?,  email=?,  telefon=?,  opis=?  where ID=" + k.getId() + ";";
        PreparedStatement ps=conn.prepareStatement(sqlIzmena);
        
        ps.setInt(1, k.getFkDrzava());
        ps.setString(2, k.getIme());
        ps.setString(3, k.getPrezime());
        ps.setString(4, k.getEmail());
        ps.setString(5, k.getTelefon());
        ps.setString(6, k.getOpis());
        
        ps.executeUpdate();
        
        
     }
    
    public static ArrayList<Korisnik> ucitajKorisnike() throws ClassNotFoundException, SQLException{
    
        Class.forName("com.mysql.jdbc.Driver");
        String connString="jdbc:mysql://localhost/webkontakti?" + 
                                   "user=root&password=root";
        Connection conn=DriverManager.getConnection(connString);
        String upit="SELECT * FROM KORISNIK;";
        
        Statement st=conn.createStatement();
        ResultSet rs=st.executeQuery(upit);
        
        //(int id, String ime, String prezime, String username, String password)
        ArrayList<Korisnik> listaKorisnika = new ArrayList<>();
        Korisnik k;
        while(rs.next()){
        
            int id = rs.getInt("ID");
            String ime=rs.getString("Ime");
            String prezime=rs.getString("Prezime");
            String username = rs.getString("Username");
            String password = rs.getString("Password");
            k = new Korisnik(id, ime, prezime, username, password);
            listaKorisnika.add(k);
            
        }
        return listaKorisnika;
    }
    //int id, int fkKorisnik, int fkDrzava, String ime, String prezime, String email, String telefon, String opis
    
     public static ArrayList<Kontakt> ucitajKontakte() throws ClassNotFoundException, SQLException{
    
        Class.forName("com.mysql.jdbc.Driver");
        String connString="jdbc:mysql://localhost/webkontakti?" + 
                                   "user=root&password=root";
        Connection conn=DriverManager.getConnection(connString);
        String upit="SELECT * FROM KONTAKTI;";
        
        Statement st=conn.createStatement();
        ResultSet rs=st.executeQuery(upit);

        ArrayList<Kontakt> listaKontakata= new ArrayList<>();
        Kontakt kt;
        while(rs.next()){
        
            int id = rs.getInt("ID");
            int fkKorisnik = rs.getInt("fkKorisnik");
            int fkDrzava = rs.getInt("fkDrzava");
            String ime=rs.getString("Ime");
            String prezime=rs.getString("Prezime");
            String email = rs.getString("email");
            String telefon = rs.getString("telefon");
            String opis=rs.getString("opis");
            kt = new Kontakt(id, fkKorisnik, fkDrzava, ime, prezime, email, telefon, opis);
            
            listaKontakata.add(kt);
            
        }
        return listaKontakata;
    }
     
     public static ArrayList<Drzava> ucitajDrzave() throws ClassNotFoundException, SQLException{
    
        Class.forName("com.mysql.jdbc.Driver");
        String connString="jdbc:mysql://localhost/webkontakti?" + 
                                   "user=root&password=root";
        Connection conn=DriverManager.getConnection(connString);
        String upit="SELECT * FROM DRZAVA;";
        
        Statement st=conn.createStatement();
        ResultSet rs=st.executeQuery(upit);
        
        //int id, String naziv, String pozivniBroj
        ArrayList<Drzava> listaDrzava = new ArrayList<>();
        Drzava d;
        while(rs.next()){
        
            int id = rs.getInt("ID");
            String naziv=rs.getString("Naziv");
            String pozivniBroj=rs.getString("PozivniBroj");
            d = new Drzava(id, naziv, pozivniBroj);
            listaDrzava.add(d);
            
        }
        return listaDrzava;
        

    }
    public static void brisiPodatakTabele(String sqlNaredba) throws ClassNotFoundException, SQLException{
        Class.forName("com.mysql.jdbc.Driver");
        String connString="jdbc:mysql://localhost/webkontakti?" + 
                                   "user=root&password=root";
        Connection conn=DriverManager.getConnection(connString);
        
        PreparedStatement ps = conn.prepareStatement(sqlNaredba);
        ps.execute();
        conn.close();
        
        }
    
}
