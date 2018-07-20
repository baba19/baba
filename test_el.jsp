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
        <!-- Initialisation de sa propriété 'prénom' : -->
        <jsp:setProperty name="coyote" property="prenom" value="Wile E."/>
        <!-- Et affichage de sa valeur : <jsp:getProperty name="coyote" property="prenom" />-->
        
        ${ coyote.prenom }
        
        <!-- Syntaxe conseillée pour récupérer la propriété 'prenom' du bean 'coyote'. -->
        ${ coyote.prenom }

		<!-- Syntaxe correcte, car il est possible d'expliciter la méthode d'accès à la propriété. Préférez toutefois la notation précédente. -->
		${ coyote.getPrenom() }
		
				<!-- Comparaison d'égalité entre la propriété prenom et la chaîne "Jean-Paul" -->
		${ coyote.prenom == "Jean-Paul" }
		
		<!-- Vérification si la propriété prenom est vide ou nulle -->
		${ empty coyote.prenom }
		
		<!-- Condition ternaire qui affiche la propriété prénom si elle n'est ni vide ni nulle, et la chaîne "Veuillez préciser un prénom" sinon -->
		${ !empty coyote.prenom ? coyote.prenom : "Veuillez préciser un prénom" }
		
				
				<!-- La scriptlet suivante affiche "null" si la propriété "prenom" n'a pas été initialisée, 
		et provoque une erreur à la compilation si l'objet "coyote" n'a pas été initialisé : -->
		<%= coyote.getPrenom() %>
		
		<!-- L'action suivante affiche "null" si la propriété "prenom" n'a pas été initialisée, 
		et provoque une erreur à l'exécution si l'objet "coyote" n'a pas été initialisé : -->
		<jsp:getProperty name="coyote" property="prenom" />
		
		<!-- L'expression EL suivante n'affiche rien si la propriété "prenom" n'a pas été initialisée,
		et n'affiche rien si l'objet "coyote" n'a pas été initialisé : -->
		${ coyote.prenom }
    </p>
    
    <p>
     <h5>collection</h5>
        <% 
    	/* Création d'une liste de légumes et insertion de quatre éléments */
    	java.util.List<String> legumes = new java.util.ArrayList<String>();
        legumes.add( "poireau" );
        legumes.add( "haricot" );
        legumes.add( "carotte");
        legumes.add( "pomme de terre" );
        request.setAttribute( "legumes" , legumes );
        %>

        <!-- Les quatre syntaxes suivantes retournent le deuxième élément de la liste de légumes  -->
        ${ legumes.get(1) }<br />
        ${ legumes[1] }<br />
        ${ legumes['1'] }<br />
        ${ legumes["1"] }<br />
    </p>
    
     <p>
     <h5>tableau</h5>
        <% 
        /* Création d'un tableau */
        String[] animaux = {"chien", "chat", "souris", "cheval"};
        request.setAttribute("animaux" , animaux);
        %>
        
        <!-- Les trois syntaxes suivantes retournent le troisième élément du tableau  -->
        ${ animaux[2] }<br />
        ${ animaux['2'] }<br />
        ${ animaux["2"] }<br />
    </p>
    
    <p>
    <h5>Map</h5>
        <% 
        /* Création d'une Map */
        java.util.Map<String,Integer> desserts = new java.util.HashMap<String, Integer>();
        desserts.put("cookies", 8);
        desserts.put("glaces", 3);
        desserts.put("muffins", 6);
        desserts.put("tartes aux pommes", 2);
        
        request.setAttribute("desserts" , desserts);
        %>
        
        <!-- Les quatre syntaxes suivantes retournent la valeur associée à la clé "cookies" de la Map de desserts  -->
        ${ desserts.cookies }<br />
        ${ desserts.get("cookies") }<br />
        ${ desserts['cookies'] }<br />
        ${ desserts["cookies"] }<br />

        <% 
        /* Création d'une chaîne nommée "element" et contenant le mot "cookies" */
        String element = "cookies"; 
        request.setAttribute("element",element);
        %>
        <!-- Il est également possible d'utiliser un objet au lieu d'initialiser la clé souhaitée directement dans l'expression -->
        ${ desserts[element] }<br />
    </p>
    </body>
</html>