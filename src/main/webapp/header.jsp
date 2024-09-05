<%@ page language="java" contentType="text/html; charset=ISO-8859-1" pageEncoding="ISO-8859-1" isELIgnored="false" %>
<%@ taglib prefix="s" uri="/struts-tags" %>
<%@ page import="DAO.ProduitDaolmp" %>
<%@ page import="Tables.Articles_Stock" %>
<%@ page import="java.util.List" %>
<%@ page import="Tables.Articles_Prix" %>
<%@ page import="Tables.Users" %>
<%@ taglib prefix="h" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<!DOCTYPE html>
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
    <link href="https://fonts.googleapis.com/css2?family=Poppins:wght@300;400;500;600;700;800;900&display=swap" rel="stylesheet">
    <link href="style1.css" rel="stylesheet">

    <link href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.15.3/css/all.min.css" rel="stylesheet">
</head>
<body>
<header style="margin-bottom: 10px; width: 100px;">
    <div style="display: flex; align-items: center;">
        <img src="photos/photos/logo.png" class="img-fluid" style="margin-left: 40px; width:1000px ;min-height: 100px;" alt="">
        <hr/>
        <nav id="navbar" class="navbar" style="margin-left: 500px;">
            <ul>
                <li><a href="home.jsp">Home</a></li>
                <li>
                    <a href="Profile.jsp">
                            Profile

                            <%
                                HttpSession rsession = (HttpSession) request.getSession();

                                int id = (Integer) rsession.getAttribute("id");
                                Users user = new Users();
                                ProduitDaolmp dao = new ProduitDaolmp();
                                user = dao.getuser(id);
                            %>
                    </a>
                </li>
                <li><a href="logout">Logout</a></li>
                <li><a href="accueil.jsp">Produit</a></li>
                <li >
                           <span class="user-icon" style="width: 10px;margin-left: 10px;">
                    <i class="fa fa-user" style="font-size: medium; " > <br>
                        <%= user.getLogin() %>
                    </i>
                    </span>

                </li>
            </ul>

        </nav><!-- .navbar -->
    </div>
</header>
</body>
</html>
