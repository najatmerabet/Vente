<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
         pageEncoding="ISO-8859-1" isELIgnored="false"%>
<%@ taglib prefix="s" uri="/struts-tags"%>
<%@page import="DAO.ProduitDaolmp" %>
<%@page import="Tables.Articles_Stock" %>
<%@page import="java.util.List" %>
<%@page import="Tables.Articles_Prix" %>
<%@page import="Tables.Users" %>
<%@ taglib prefix="h" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<html>
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
    <title>Ray-ban</title>
    <!-- Vendor CSS Files -->
    <link href="vendor/animate.css/animate.min.css" rel="stylesheet">
    <link href="vendor/bootstrap/css/bootstrap.min.css" rel="stylesheet">
    <link href="vendor/bootstrap-icons/bootstrap-icons.css" rel="stylesheet">
    <link href="vendor/boxicons/css/boxicons.min.css" rel="stylesheet">
    <link href="vendor/glightbox/css/glightbox.min.css" rel="stylesheet">
    <link href="vendor/remixicon/remixicon.css" rel="stylesheet">
    <link href="vendor/swiper/swiper-bundle.min.css" rel="stylesheet">
    <link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
    <link href="https://fonts.googleapis.com/css2?family=Poppins:wght@300;400;500;600;700;800;900&display=swap"
          rel="stylesheet">
    <link href="style.css" rel="stylesheet">
    <link href="produit.css" rel="stylesheet">
    <link href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.15.3/css/all.min.css" rel="stylesheet">
    <meta charset="ISO-8859-1">


</head>
<jsp:include page="header.jsp"></jsp:include>
<body style=" font-family: Arial, sans-serif;   margin: 0; padding: 0;background-size: cover; background-position: center center;">
<section id="section" style="background-color: #f4f4f4;">
<div class="container" style=" max-width: 800px; margin-top: 20px;padding: 20px; background-color: burlywood; box-shadow: 0 0 10px rgba(0, 0, 0, 0.1); position: center;
">

        <% HttpSession rsession = (HttpSession) request.getSession();
            int idu=(Integer)session.getAttribute("id");
            Users user=new Users();
            ProduitDaolmp dao=new ProduitDaolmp();
            user=dao.getuser(idu);
        %>


    <% String idProduit = request.getParameter("idproduit");
        int id=0;
        if(idProduit!=null){
            id=Integer.parseInt(idProduit);
        }else{
          System.out.println("le id est vide");
        } %>



    <%
        Articles_Stock p = dao.getById(id);
        Articles_Prix pro = dao.getprodById(id);

        if(p != null){
          System.out.println("remplis" + p.getNomArt());
        }else{
           System.out.println("vide");
        }
    %>

    <div>
        <p>
            <label>le nom de l'article:    <%= (p != null) ? p.getNomArt() : "" %></label>
            <label>la description du produit: <%= (pro != null) ? pro.getDescArt() : "" %></label>
            <label>le prix de l'article: <%= (p != null) ? p.getPrixArt() : "" %></label>
            <label>la quantite du produit est: <%= (p != null) ? p.getQteArt() : "" %></label>
        </p>

        <form action="ajouterpanier" method="post">
           <input type="hidden" name="id" value="<%= id %>" />
            <input type="submit" value="add to panier" style=" background-color: #4caf50; color: #fff;  border: none; padding: 10px 20px;
            cursor: pointer;"/>
        </form>
    </div>
</div>

<script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
<script>
    $(document).ready(function() {

        // Example: Hide the "Add to Panier" button when the form is submitted
        $("form").submit(function() {
            $(this).find("input[type='submit']").hide();
        });
    });
</script>
</section>
</body>
</html>
