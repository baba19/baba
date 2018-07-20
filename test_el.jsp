<%@ page import="java.util.List, java.util.Set, java.util.Map, java.util.HashMap" %>
<!DOCTYPE html>
<html>
    <head>
        <meta charset="utf-8" />
        <title>Test des expressions EL</title>
    </head>
    <body>
    <p>
        <!-- Initialisation d'un bean de type Coyote avec une action standard, pour l'exemple : -->
        <jsp:useBean id="coyote" class="com.sdzee.beans.Coyote" />
        <!-- Initialisation de sa propri�t� 'pr�nom' : -->
        <jsp:setProperty name="coyote" property="prenom" value="Wile E."/>
        <!-- Et affichage de sa valeur : <jsp:getProperty name="coyote" property="prenom" />-->
        
        ${ coyote.prenom }
        
        <!-- Syntaxe conseill�e pour r�cup�rer la propri�t� 'prenom' du bean 'coyote'. -->
        ${ coyote.prenom }

		<!-- Syntaxe correcte, car il est possible d'expliciter la m�thode d'acc�s � la propri�t�. Pr�f�rez toutefois la notation pr�c�dente. -->
		${ coyote.getPrenom() }
		
				<!-- Comparaison d'�galit� entre la propri�t� prenom et la cha�ne "Jean-Paul" -->
		${ coyote.prenom == "Jean-Paul" }
		
		<!-- V�rification si la propri�t� prenom est vide ou nulle -->
		${ empty coyote.prenom }
		
		<!-- Condition ternaire qui affiche la propri�t� pr�nom si elle n'est ni vide ni nulle, et la cha�ne "Veuillez pr�ciser un pr�nom" sinon -->
		${ !empty coyote.prenom ? coyote.prenom : "Veuillez pr�ciser un pr�nom" }
		
				
				<!-- La scriptlet suivante affiche "null" si la propri�t� "prenom" n'a pas �t� initialis�e, 
		et provoque une erreur � la compilation si l'objet "coyote" n'a pas �t� initialis� : -->
		<%= coyote.getPrenom() %>
		
		<!-- L'action suivante affiche "null" si la propri�t� "prenom" n'a pas �t� initialis�e, 
		et provoque une erreur � l'ex�cution si l'objet "coyote" n'a pas �t� initialis� : -->
		<jsp:getProperty name="coyote" property="prenom" />
		
		<!-- L'expression EL suivante n'affiche rien si la propri�t� "prenom" n'a pas �t� initialis�e,
		et n'affiche rien si l'objet "coyote" n'a pas �t� initialis� : -->
		${ coyote.prenom }
    </p>
    
    <p>
     <h5>collection</h5>
        <% 
    	/* Cr�ation d'une liste de l�gumes et insertion de quatre �l�ments */
    	java.util.List<String> legumes = new java.util.ArrayList<String>();
        legumes.add( "poireau" );
        legumes.add( "haricot" );
        legumes.add( "carotte");
        legumes.add( "pomme de terre" );
        request.setAttribute( "legumes" , legumes );
        %>

        <!-- Les quatre syntaxes suivantes retournent le deuxi�me �l�ment de la liste de l�gumes  -->
        ${ legumes.get(1) }<br />
        ${ legumes[1] }<br />
        ${ legumes['1'] }<br />
        ${ legumes["1"] }<br />
    </p>
    
     <p>
     <h5>tableau</h5>
        <% 
        /* Cr�ation d'un tableau */
        String[] animaux = {"chien", "chat", "souris", "cheval"};
        request.setAttribute("animaux" , animaux);
        %>
        
        <!-- Les trois syntaxes suivantes retournent le troisi�me �l�ment du tableau  -->
        ${ animaux[2] }<br />
        ${ animaux['2'] }<br />
        ${ animaux["2"] }<br />
    </p>
    
    <p>
    <h5>Map</h5>
        <% 
        /* Cr�ation d'une Map */
        java.util.Map<String,Integer> desserts = new java.util.HashMap<String, Integer>();
        desserts.put("cookies", 8);
        desserts.put("glaces", 3);
        desserts.put("muffins", 6);
        desserts.put("tartes aux pommes", 2);
        
        request.setAttribute("desserts" , desserts);
        %>
        
        <!-- Les quatre syntaxes suivantes retournent la valeur associ�e � la cl� "cookies" de la Map de desserts  -->
        ${ desserts.cookies }<br />
        ${ desserts.get("cookies") }<br />
        ${ desserts['cookies'] }<br />
        ${ desserts["cookies"] }<br />

        <% 
        /* Cr�ation d'une cha�ne nomm�e "element" et contenant le mot "cookies" */
        String element = "cookies"; 
        request.setAttribute("element",element);
        %>
        <!-- Il est �galement possible d'utiliser un objet au lieu d'initialiser la cl� souhait�e directement dans l'expression -->
        ${ desserts[element] }<br />
    </p>
    </body>
</html>