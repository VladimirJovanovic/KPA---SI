<%-- 
    Document   : index.jsp
    Created on : Nov 18, 2018, 12:29:26 PM
    Author     : Korisnik
--%>
<%@page import="model.Administrator"%>
<%@page import="model.Kontakt"%>
<%@page import="model.ListaPodataka"%>
<%@page import="model.Korisnik"%>
<%@page import="model.Drzava"%>
<%@page import="model.AzuriranjeBaze"%>

<%
    //Drzava d = new Drzava(2,"Srbija", "+381");
    //AzuriranjeBaze.dodajDrzavu(d);
    
    //u AzuriranjeBaze napraviti metodu da ucita listu podataka iz baze
    
    /*
    Korisnik k1 = new Korisnik(2, "Milos", "Markovic", "milosmarko", "123");
    ListaPodataka.listaKorisnika.add(k1);
    
    Drzava d1 = new Drzava(3,"Rumunija","+352");
    ListaPodataka.listaDrzava.add(d1);
    
    Kontakt kt1 = new Kontakt(1,2,3,"Petar", "Mitrovic", "pm@email.com", "+381 64 133789", "Petar je student");
    Kontakt kt2 = new Kontakt(2,2,3,"Milan", "Petrovic", "mp@email.com", "+381 64 123789", "Milan je student");
    ListaPodataka.listaKontakata.add(kt1);
    ListaPodataka.listaKontakata.add(kt2);
*/
    
    ListaPodataka.listaAdministratora.add(new Administrator("admin", "admin"));
    
    ListaPodataka.listaKorisnika=AzuriranjeBaze.ucitajKorisnike();
    ListaPodataka.listaKontakata=AzuriranjeBaze.ucitajKontakte();
    ListaPodataka.listaDrzava=AzuriranjeBaze.ucitajDrzave();
    
    String korisnickoImePodatak="";
    String lozinkaPodatak="";
    
    boolean pronadjenKorisnik=false;
    

    //provera da li su unete vrednosti u input type text
    if(request.getParameter("korisnickoIme")!=null && request.getParameter("lozinka")!=null){
    
        korisnickoImePodatak=request.getParameter("korisnickoIme");
        lozinkaPodatak=request.getParameter("lozinka");
         
        if(!korisnickoImePodatak.equals("") && !lozinkaPodatak.equals("")){
            for(Korisnik k : ListaPodataka.listaKorisnika){
                if(k.getUsername().equals(korisnickoImePodatak)
                        && k.getPassword().equals(lozinkaPodatak))
                    pronadjenKorisnik=true;
            }
            
            
        }
    }
    
    boolean prijavljenAdmin=false;
    if(korisnickoImePodatak.equals("admin") && lozinkaPodatak.equals("admin"))
        prijavljenAdmin=true;
    
    

%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>

<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <link rel="stylesheet" type="text/css" href="stilovi.css">
        <title>Prijava korisnika</title>
        
        <style>
            .centrirajLogin {
                width: 300px;
                height: 80px;
                background-color: lightcyan;

                position:absolute;
                left:0; right:0;
                top:0; bottom:0;
                margin:auto;

                max-width:100%;
                max-height:100%;
                overflow:auto;
                
                border:1px solid green;
            }
            input{
                border-radius:10px;
            }
            
            html,body {
                background: url(imenik.jpg) no-repeat center center fixed;
                -webkit-background-size: cover; /* WebKit*/
                -moz-background-size: cover;    /* Mozilla*/
                -o-background-size: cover;      /* Opera*/
                background-size: cover;         /* Generic*/
            }
        </style>
    </head>
    
    <body>
        
        <%if(prijavljenAdmin){%>
            <script>
                window.location="Korisnici.jsp";
            </script>
        <%}%>
        
        <%
            if(pronadjenKorisnik==true){
                
                ListaPodataka.prijavljenKorisnikKorIme=request.getParameter("korisnickoIme");
        %>
            <script>
                window.location="Kontakti.jsp";
            </script>
        <%
            }else if(pronadjenKorisnik==false){
        %>
            <script>
                document.getElementById('idValidacija').style.visibility="visible";
            </script>
        <%
            }
        %>
        
        
        <div class="centrirajLogin">
            <form action="index.jsp" method="post" name="prijavaKorisnika">
                <table>
                    <tr> 
                        <td>Korisnicko ime: </td>
                        <td><input type="text" name="korisnickoIme"></td>
                    </tr>
                    <tr>
                        <td>
                            Lozinka: 
                        </td>
                        <td><input type="password" name="lozinka"></td>   
                    </tr>
                    <!--
                    <tr>
                        <td colspan="2"><p id="idValidacija" class="validacija">Uneli ste pogresno korisnicko ime i/ili lozinku!</p></td>
                    </tr>
                    -->
                   
                    <tr>
                        <td></td>
                        <td>
                            <input type="submit" value="Prijava" style="background-color:#4CAF50; color:#f2f2f2;">
                        </td>
                    </tr>
                </table>
            </form>
        </div>
        
    </body>
</html>
