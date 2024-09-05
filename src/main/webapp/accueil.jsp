<%@ page language="java" contentType="text/html; charset=ISO-8859-1" pageEncoding="ISO-8859-1" %>
<%@page import="DAO.ProduitDaolmp" %>
<%@page import="Tables.Articles_Stock" %>
<%@page import="java.util.List" %>
<%@page import="Tables.Articles_Prix" %>
<%@page import="Tables.Users" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1" />
<title>Listes Produits</title>

<link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.4.1/css/bootstrap.min.css" 
    integrity="sha384-Vkoo8x4CGsO3+Hhxv8T/Q5PaXtkKtu6ug5TOeNV6gBiFeWPGFN9MuhOf23Q9Ifjh" crossorigin="anonymous">
	<link rel="stylesheet" href="https://unpkg.com/bootstrap-table@1.16.0/dist/bootstrap-table.min.css">
    <link rel="stylesheet" href="style.css"/>

</head>
<body >
<jsp:include page="header.jsp"></jsp:include>

<div style="background-color: #f4f4f4;">
<div style="display:flex;">
   <label><% HttpSession rsession = (HttpSession) request.getSession();
   if(rsession==null ||rsession.getAttribute("id") == null){
	   HttpServletResponse httpResponse = (HttpServletResponse) response;
	    httpResponse.sendRedirect("Index.jsp");
	    return; // Terminer le traitement de la page après la redirection
   }
  int id=(Integer)rsession.getAttribute("id");
  Users user=new Users();
  ProduitDaolmp dao=new ProduitDaolmp();
  user=dao.getuser(id);
  %>
</div>
  <h3 class="text-center" style="color:#d43f3a!important;font-family: inherit;"> Product List</h3>
  <div class="container">
		<div class="row">
         	<div class="col-12">
                <table class="table" data-toggle="table" data-search="true" data-show-columns="true" data-pagination="true">
    <thead class="thead-dark">
        <tr>
            <th>code Article</th>
            <th>nom Article</th>
            <th>prix Article</th>
            <th>Quantite de l'article</th>
            <!-- <th>Image</th> -->
            <th>Panier</th>
        </tr>
    </thead>
    <%
    List<Articles_Stock> articles;
    dao = new ProduitDaolmp();
    articles = dao.getAllp();
    Articles_Prix p;
    for (Articles_Stock item : articles) {
        int idi = item.getCodeArt();
        p = dao.getprodById(idi);
    %>

    <tr>
        <td><%= item.getCodeArt() %></td>
        <td><%= p.getNomArt() %></td>
        <td><%= p.getPrixArt() %></td>
        <td><%= item.getQteArt() %></td>
        <td><a href="panier.jsp?idproduit=<%= item.getCodeArt() %>">Plus de detail</a></td>
    </tr>
    <% } %>
</table>
            </div>
           </div>
           </div>
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
  	<script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.16.0/umd/popper.min.js"></script>
    <script src="https://code.jquery.com/jquery-3.4.1.slim.min.js" integrity="sha384-J6qa4849blE2+poT4WnyKhv5vZF5SrPo0iEjwBvKU7imGFAV0wwj1yYfoRSJoZ+n" crossorigin="anonymous"></script>
    <script src="https://cdn.jsdelivr.net/npm/popper.js@1.16.0/dist/umd/popper.min.js" integrity="sha384-Q6E9RHvbIyZFJoft+2mJbHaEWldlvI9IOYy5n3zV9zzTtmI3UksdQRVvoxMfooAo" crossorigin="anonymous"></script>
    <script src="https://stackpath.bootstrapcdn.com/bootstrap/4.4.1/js/bootstrap.min.js" integrity="sha384-wfSDF2E50Y2D1uUdj0O3uMBJnjuUD4Ih7YwaYd1iqfktj0Uod8GCExl3Og8ifwB6" crossorigin="anonymous"></script>
	<script src="https://unpkg.com/bootstrap-table@1.16.0/dist/bootstrap-table.min.js"></script>
	<script src="https://unpkg.com/bootstrap-table@1.16.0/dist/locale/bootstrap-table-fr-FR.min.js"></script>
</div>



</body>

</html>