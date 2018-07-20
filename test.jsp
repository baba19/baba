<%@ page pageEncoding="UTF-8" %>
<%@ page import="java.util.List, java.lang.Integer" %>
<!DOCTYPE html>
<html>
    <head>
        <meta charset="utf-8" />
        <title>Test</title>
    </head>

    <body>
        <p>Ceci est une page générée depuis une JSP.</p>
        <p>
            <% 
            String attribut = (String) request.getAttribute("test");
            out.println(attribut);
            out.println("baba camara");
            String parametre = request.getParameter( "auteur" );
            out.println( parametre );
            %>
        </p>
         <p>
            Récupération du bean class:
            <%	
	    com.sdzee.beans.Coyote notreBean = (com.sdzee.beans.Coyote) request.getAttribute("coyote");
	    out.println( notreBean.getPrenom() );
            out.println( notreBean.getNom() );
            %>
        </p>
        <p>
            Récupération du bean :
            <jsp:useBean id="coyote" class="com.sdzee.beans.Coyote" scope="request" />
            <jsp:getProperty name="coyote" property="prenom" />
            <jsp:getProperty name="coyote" property="nom" />
        </p>
         <p>Ceci est une page générée depuis une JSP EL.</p>
        <p>
            ${test}
            ${param.auteur}
            
        </p>
        <p>
            Récupération du bean :
            ${coyote.prenom}
            ${coyote.nom}
        </p>
        <p>
            Récupération de la liste :
            <%
            List<String> listes = (List<String>) request.getAttribute( "liste" );
	        for(int i = 0; i < 4; i++){
	              	out.println(listes.get(i) + " : ");	
	       	       }
      //      for( String i : listes ){
      //          out.println(i + " : ");	
     //        }
      //      List<Integer> listes = (List<Integer>) request.getAttribute( "liste" );
	//       for(int i = 0; i < 4; i++){
	 //       	out.println(listes.get(i) + " : ");	
	//        }
       //    for( Integer i : listes ){
       //         out.println(i + " : ");	
      //      }
            %>
        </p>
        <p>
            Récupération du jour du mois :
            <%
            Integer jourDuMois = (Integer) request.getAttribute( "jour" );
            if ( jourDuMois % 2 == 0 ){
                out.println("Jour pair : " + jourDuMois);
            } else {
                out.println("Jour impair : " + jourDuMois);
            }
            %>
        </p>
         
    </body>
</html>