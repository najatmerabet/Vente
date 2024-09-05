<%@ page import="Tables.Articles_Stock" %>
<%@ page import="DAO.ProduitDaolmp" %>
<%@ page import="java.util.*" %>
<%@ page import="Tables.Users" %>
<%@ page import="Tables.commande" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<html>
<head>
    <title>commande</title>
    <link rel="stylesheet" href="style.css">
    <link rel="stylesheet" href="commande.css">
    <script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
    <script type="text/javascript">
        $(document).ready(function() {
            // Ajouter une classe pour mettre en surbrillance les lignes de quantité dépassée
            $('input[type="number"]').change(function() {
                var quantiteInput = $(this);
                var stockDisponible = parseInt(quantiteInput.attr('max'));
                var quantite = parseInt(quantiteInput.val());

                if (quantite > stockDisponible) {
                    quantiteInput.addClass('quantite-depasse');
                } else {
                    quantiteInput.removeClass('quantite-depasse');
                }
            });

            // Restaurer les valeurs saisies lors du chargement de la page
            var savedQuantite = JSON.parse(localStorage.getItem('savedQuantite')) || {};
            for (var inputId in savedQuantite) {
                $('#' + inputId).val(savedQuantite[inputId]);
            }

            // Enregistrer les valeurs saisies lors de la soumission du formulaire
            $('form').submit(function() {
                var savedQuantite = {};
                $('input[type="number"]').each(function() {
                    var inputId = $(this).attr('id');
                    var inputValue = $(this).val();
                    savedQuantite[inputId] = inputValue;
                });
                localStorage.setItem('savedQuantite', JSON.stringify(savedQuantite));
            });
        });
    </script>
</head>
<body>
<jsp:include page="header.jsp"></jsp:include>
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
        System.out.println("la liste est vide");
    }
%>
<section id="comm">
    <h2> Product to commande </h2>
<form action="passercommande" method="post">
    <table class="mytable" data-toggle="table" data-search="true" data-show-columns="true" data-pagination="true">
        <tr>
            <th>Code</th>
            <th>Name</th>
            <th>Price</th>
            <th>Quantite</th>
            <th></th>
        </tr>

        <c:forEach var="item" items="${sessionScope.list}">
            <tr>
                <td><c:out value="${item.codeArt}"></c:out></td>
                <td><c:out value="${item.nomArt}"></c:out></td>
                <td><c:out value="${item.prixArt}"></c:out></td>
                <td>
                    <input type="hidden" name="idarticle[${item.codeArt}]" value="${item.codeArt}" />
                    <input type="number" name="quantite[${item.codeArt}]" value="${item.qteArt}" id="quantiteInput${item.codeArt}" onchange="validateQuantite(${item.codeArt}, ${item.qteArt})" />
                </td>
                <td>
                    <form action="delete" method="post">
                        <input type="hidden" name="idp" value="${item.qteArt}"/>
                        <input type="submit" value="Delete"/>
                    </form>
                </td>
            </tr>
        </c:forEach>
    </table>
    <br/>
    <button type="submit">Commander</button>
</form>
<br/>
    <br/>
<span>
  <a href="accueil.jsp">add another product</a>
</span>
</section>
</body>
</html>
