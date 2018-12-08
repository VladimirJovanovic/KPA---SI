<%-- 
    Document   : Kontakti
    Created on : Nov 19, 2018, 12:28:08 PM
    Author     : Korisnik
--%>

<%@page import="Visitor.DodavanjePodataka"%>
<%@page import="Facade.AzuriranjeKontakataFacade"%>
<%@page import="model.AzuriranjeBaze"%>
<%@page import="model.Drzava"%>
<%@page import="model.Korisnik"%>
<%@page import="model.ListaPodataka"%>
<%@page import="java.util.ArrayList"%>
<%@page import="model.Kontakt"%>
<%

    ArrayList<Kontakt> lstKontaktiKorisnika = new ArrayList<Kontakt>();
    String korisnickoImePrijavljenog = ListaPodataka.prijavljenKorisnikKorIme;
    ArrayList<String> lstIdDrzava=new ArrayList<String>();
    
    
    
    for(Drzava dr : ListaPodataka.listaDrzava){
        lstIdDrzava.add(Integer.toString(dr.getId()));
    }
    int idPrijavlejnog = 0;
    
    for(Korisnik k : ListaPodataka.listaKorisnika){
        if(k.getUsername().equals(korisnickoImePrijavljenog))
            idPrijavlejnog=k.getId();
    }
    
    
    
    AzuriranjeKontakataFacade azuriranjeKontakata = new AzuriranjeKontakataFacade();
    
    boolean pokrenutoAzuriranje=false;
    boolean uspesnoDodavanje=true;
    
    int id=0, fkKorisnik=0, fkDrzava=0;
    String ime="", prezime="", email="", telefon="",opis="";
    
    if(request.getParameter("idKontakt")!=null)
        id=Integer.parseInt(request.getParameter("idKontakt").toString());
    if(request.getParameter("selectIdDrzava")!=null)
        fkDrzava=Integer.parseInt(request.getParameter("selectIdDrzava").toString());
    if(request.getParameter("ime")!=null)
        ime=request.getParameter("ime");
    if(request.getParameter("prezime")!=null)
        prezime=request.getParameter("prezime");
    if(request.getParameter("email")!=null)
        email=request.getParameter("email");
    if(request.getParameter("telefon")!=null)
        telefon=request.getParameter("telefon");
    if(request.getParameter("opis")!=null)
        opis=request.getParameter("opis");
    
    String rbOdabirFunkcije=request.getParameter("odabirFunkcije");
    if(rbOdabirFunkcije!=null){
        
        if(rbOdabirFunkcije.equals("upis")){
            
            if(fkDrzava!=0 && !ime.equals("") && !prezime.equals("")){
                
                int noviId=0;
                for(Kontakt k:ListaPodataka.listaKontakata)
                    if(k.getId()>noviId)
                        noviId=k.getId();
                noviId++;
                //(int id, int fkKorisnik, int fkDrzava, String ime, String prezime, String email, String telefon, String opis)
                Kontakt kontakt = new Kontakt(noviId, idPrijavlejnog, fkDrzava, ime, prezime, email, telefon, opis);
                AzuriranjeBaze.dodajKontakt(kontakt);
                DodavanjePodataka dodavanjePodataka=new DodavanjePodataka();
                dodavanjePodataka.dodajPodatak((Kontakt)kontakt);
                
            }
        }else if(rbOdabirFunkcije.equals("izmena")){
            if(id!=0 && fkDrzava!=0 && !ime.equals("") && !prezime.equals("")){
            
                Kontakt kontakt = new Kontakt(id, idPrijavlejnog, fkDrzava, ime, prezime, email, telefon, opis);
                AzuriranjeBaze.izmeniKontakt((Kontakt)kontakt);
                
            }
            
        }else if(rbOdabirFunkcije.equals("brisanje")){
            String sqlNaredba = "DELETE FROM KONTAKTI WHERE ID="+id+";";
            AzuriranjeBaze.brisiPodatakTabele(sqlNaredba);
           
        }
        
    }
    
     ListaPodataka.listaKontakata=AzuriranjeBaze.ucitajKontakte();
    for(Kontakt kt : ListaPodataka.listaKontakata){
        if(kt.getFkKorisnik()==idPrijavlejnog){
            lstKontaktiKorisnika.add(kt);
        }
    }
    
     
    /*
    Kontakt noviKontakt = new  Kontakt(ListaPodataka.generisiIdKontakta(),1, 2, "Milan", "Milanovic", "milan@milan.com", "064d123567", "Milan je radnik");
    boolean uspesnoDodavanje=AzuriranjeKontakataFacade.dodajKontakt(noviKontakt);
    */
    
    
%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <link rel="stylesheet" type="text/css" href="stilovi.css">
        <title>Profil korisnika</title>
        
        <style>
            input, textarea, select{
                border-radius:10px;
            }
            
            html,body {
                background: url(imenik.jpg) no-repeat center center fixed;
                -webkit-background-size: cover; /* WebKit*/
                -moz-background-size: cover;    /* Mozilla*/
                -o-background-size: cover;      /* Opera*/
                background-size: cover;         /* Generic*/
            }
            
            table {
                border-collapse: collapse;
                width: 100%;
            }

            th, td {
              text-align: left;
              padding: 8px;
            }

            tr:nth-child(even){background-color: #f2f2f2}

            th {
              background-color: #4CAF50;
              color: white;
            }
        </style>
    </head>
    <body>
        <br>
        <br>
        
        <%
            if(!uspesnoDodavanje){
                %>
                    <script>
                        alert("Podaci nisu validni!");
                    </script>
                <%
            }
        %>
        
        <center>
        <div style="border:1px solid green; width:40%; background-color: lightcyan;">
        <table border="1">
            <caption><h3 style="color:green;">PRIKAZ KONTAKATA</h3></caption>
            <tr>
                <th>ID</th>
                <th>Drzava</th>
                <th>Ime</th>
                <th>Prezime</th>
                <th>Email</th>
                <th>Telefon</th>
                <th>Opis</th>                  
            </tr>
            
            <%
                for(Kontakt kontakt: lstKontaktiKorisnika){
                %>
                    <tr>
                        <td>
                            <%out.println(kontakt.getId());%>
                        </td>
                        
                        <td>
                            <%
                                //out.println(kontakt.getFkDrzava());
                                
                                for(Drzava d: ListaPodataka.listaDrzava){
                                    if(d.getId()==kontakt.getFkDrzava()){
                                        out.println(d.getNaziv());
                                    }
                                }
                            %>
                        </td>
                        
                        
                        <td><%out.println(kontakt.getIme());%></td>
                        <td><%out.println(kontakt.getPrezime());%></td>
                        <td><%out.println(kontakt.getEmail());%></td>
                        <td><%out.println(kontakt.getTelefon());%></td>
                        <td><%out.println(kontakt.getOpis());%></td>
                    </tr>
                <%
                }
            %>
        </table>
        <br><br>
        
        <form action="Kontakti.jsp" method="post" name="azurirajKontakte">
            
            <input type="radio" name="odabirFunkcije" value="upis" checked>Upis<br>
            <input type="radio" name="odabirFunkcije" value="izmena">Izmena<br>
            <input type="radio" name="odabirFunkcije" value="brisanje">Brisanje<br>
            <br>
            
            <!--
            Id kontakta:
            <input type="text" name="idKontakt" size="3"><br><br>
            -->
            
            Id kontakta:
            <select name="idKontakt">
                <%for(int i=0; i<lstKontaktiKorisnika.size(); i++){%>
                <option  value="<%=Integer.toString(lstKontaktiKorisnika.get(i).getId())%>">
                    <%=Integer.toString(lstKontaktiKorisnika.get(i).getId())%>
                </option>
                <%}%>
            </select>
            <br><br>
            
            Drzava:
            <select name="selectIdDrzava">
                <%for(int i=0; i<ListaPodataka.listaDrzava.size(); i++){%>
                <option  value="<%=Integer.toString(ListaPodataka.listaDrzava.get(i).getId())%>">
                    <%=ListaPodataka.listaDrzava.get(i).getNaziv()%>
                </option>
                <%}%>
            </select>
            <br><br>
            
            
            
            Ime:
            <input type="text" name="ime" size="15">
            <br><br>
            Prezime:
            <input type="text" name="prezime" size="15">
             <br><br>
            Email:
            <input type="text" name="email" size="15">
             <br><br>
              Telefon
            <input type="text" name="telefon" size="15">
             <br><br>
             Opis:<br>
             <textarea rows="4" cols="30" name="opis">
             </textarea>
            <br><br>
            
            <input type="submit" value="Azuriraj" style="background-color:#4CAF50; color:#f2f2f2;">

        </form>
            <br><br>
            <a href="index.jsp" style="color:#4CAF50;">Odjava</a>
        
        </div>
        </center>
        
    </body>
</html>
