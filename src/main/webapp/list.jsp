<%@ page import="Tables.Articles_Stock" %>
<%@ page import="DAO.ProduitDaolmp" %>
<%@ page import="java.util.*" %>
<%@ page import="Tables.Users" %>
<%@ page import="Tables.commande" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<html>
<head>
<title>commande</title>
<link rel="stylesheet" href="styles.css">
<style>
    .quantite-depasse {
        border-color: red; /* Changer la couleur de la bordure de l'input en rouge */
    }
</style>
</head>
<body>
<header>
<nav>
<ul>
    <li><a href="accueil.jsp">Produit</a></li>
    <li><a href="singup.jsp">Singup</a></li>
    <li><a href="home.jsp">home</a></li>
    <li><a href="Index.jsp">Login</a></li>
</ul>
</nav>
</header>

<%
ProduitDaolmp dao = new ProduitDaolmp();
if(session==null ||session.getAttribute("id")==null ){
	HttpServletResponse httpResponse = (HttpServletResponse) response;
    httpResponse.sendRedirect("Index.jsp");
    return; // Terminer le traitement de la page après la redirection
}
int id = (Integer) session.getAttribute("id");
Users user = dao.getuser(id);
List<Articles_Stock> list =new ArrayList<>();
List<commande>listc=new ArrayList<>();
 list = (List<Articles_Stock>) session.getAttribute("list");
if (list != null) {
    out.println("la liste est remplie");
}
%>
<div>
<label><%= user.getLogin() %></label><br>
<label>Vos produits ajoutés au panier</label>
</div>
<form action="passercommande" method="post">
  <table border="1">
    <tr>
      <th>Code</th>
      <th>Nom</th>
      <th>Prix</th>
      <th>Quantité</th>
    </tr>
    
    <c:forEach var="item" items="${sessionScope.list}">
      <tr>
        <td><c:out value="${item.codeArt}"></c:out></td>
        <td><c:out value="${item.nomArt}"></c:out></td>
        <td><c:out value="${item.prixArt}"></c:out></td>
        <td>
          <input type="hidden" name="idarticle[${item.codeArt}]" value="${item.codeArt}" />
          <input type="number" name="quantite[${item.codeArt}]" value="${item.qteArt}" onchange="validateQuantite(this.value, ${item.qteArt})" />
        </td>
      </tr>
    </c:forEach>
    
  </table>
   <button type="submit">Commander</button>
</form>

<br/>   
<a href="accueil.jsp">Ajouter un autre produit</a>
</br>
<c:out value="ffff"></c:out>
<c:forEach var="j" begin="1" end="3">  
   Item <c:out value="${j}"></c:out><p>  
</c:forEach>
<script type="text/javascript">
function validateQuantite(quantite, stockDisponible) {
    quantite = parseInt(quantite);

    if (quantite > stockDisponible) {
        alert("Vous avez atteint le stock maximum disponible pour cet article.");
    }
}

// Restaurer les valeurs saisies lors du chargement de la page
window.addEventListener("load", function() {
    var savedQuantite = JSON.parse(localStorage.getItem("savedQuantite")) || {};
    for (var inputId in savedQuantite) {
        var inputElement = document.getElementById(inputId);
        if (inputElement) {
            inputElement.value = savedQuantite[inputId];
        }
    }
});

function myValidateFunction(codeArt, stockDisponible) {
    var inputId = "quantiteInput" + codeArt;
    var inputValue = document.getElementById(inputId).value;
    var qte = 0; // Valeur par défaut si l'input est vide

    if (inputValue !== "") {
        qte = parseInt(inputValue);
        if (isNaN(qte)) {
            // La valeur saisie n'est pas un nombre valide
            // Vous pouvez afficher un message d'erreur à l'utilisateur
            console.error("La valeur saisie n'est pas un nombre valide.");
            return;
        }
    }
    console.log("Quantité saisie :", qte);
    // Stocker la valeur dans la liste listc pour le produit correspondant
    // Ici, vous devez trouver l'objet commande correspondant dans listc en utilisant le codeArt,
    // puis mettre à jour sa propriété qteCmd avec la valeur qte.

    // Exemple de code pour mettre à jour la propriété qteCmd pour l'objet commande correspondant
    var commandeToUpdate = listc.find(function(item) {
        return item.getCodeArt() === codeArt;
    });

    if (commandeToUpdate) {
        commandeToUpdate.setQteCmd(qte);
    } else {
        // L'objet commande correspondant n'a pas été trouvé dans listc
        // Vous pouvez afficher un message d'erreur ou gérer cette situation selon vos besoins
        console.error("Objet commande correspondant non trouvé dans listc.");
    }
}
</script>

</body>
</html>