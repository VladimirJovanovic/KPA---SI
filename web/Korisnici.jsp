


<%@page import="model.AzuriranjeBaze"%>
<%@page import="model.Korisnik"%>
<%@page import="model.ListaPodataka"%>
<%@page import="java.util.ArrayList"%>

<%

    
    
%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <link rel="stylesheet" type="text/css" href="stilovi.css">
        <title>Profil administratora</title>
        
        <style>
            .centrirajDiv {
                width: 40%;
                background-color: lightcyan;
                border: 1px solid green; 

                position:absolute;
                left:0; right:0;
                top:0; bottom:0;
                margin:auto;

                max-width:100%;
                max-height:100%;
                overflow:auto;
                
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
        
       
        <center>
            
        <div class="centrirajDiv">
        <table border="1">
            <caption><h3 style="color:green;">PRIKAZ KORISNIKA</h3></caption>
            <tr>
                <th>ID</th>
                <th>Ime</th>
                <th>Prezime</th>
                <th>Username</th>
                <th>Lozinka</th>
            </tr>
            
            <%
                for(Korisnik k: ListaPodataka.listaKorisnika){
                %>
                    <tr>
                        <td><%out.println(k.getId());%></td>
                        <td><%out.println(k.getIme());%></td>
                        <td><%out.println(k.getPrezime());%></td>
                        <td><%out.println(k.getUsername());%></td>
                        <td><%out.println(k.getPassword());%></td>
                    </tr>
                <%
                }
            %>
        </table>
        <br><br>
        <a href="index.jsp" style="color:#4CAF50;">Odjava</a>
        
        
        </center>
        
    </body>
</html>
