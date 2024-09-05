<%@ page import="javax.servlet.http.HttpSession" %>
<%@ page import="DAO.ProduitDaolmp" %>
<%@ page import="java.util.*" %>
<%@ page import="Tables.Articles_Stock" %>
<%@ page import="Tables.Users" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<%@ page import="action.commander"%>
<html>
<head>
    <meta />
    <link rel="stylesheet" href="style.css"/>
    <link rel="stylesheet" href="payer.css">
</head>
<body>
<jsp:include page="header.jsp"></jsp:include>
    <div>
        <% 
        if(session==null ||  session.getAttribute("id")==null){
        	HttpServletResponse httpResponse = (HttpServletResponse) response;
            httpResponse.sendRedirect("Index.jsp");
            return; // Terminer le traitement de la page apr�s la redirection
        }
        ProduitDaolmp dao = new ProduitDaolmp();
        int id = (Integer) session.getAttribute("id");
        Users user = dao.getuser(id);
       System.out.println("Vous etes " + user.getLogin());
        List<Articles_Stock> list = new ArrayList<>();
        list = (List<Articles_Stock>) session.getAttribute("list");
        float prixfacture = 0;
        %>
    </div>

    <table class="table">
        <tr>
            <th>Product name</th>
            <th>Quantite of product</th>
            <th>Price of product</th>
            <th>Total price of product</th>
        </tr>

                <% for (Articles_Stock item : list) { %>
        <tr>
            <td><%= item.getNomArt() %></td>
            <td><%= request.getAttribute("quantite") %></td>
            <td><%= item.getPrixArt() %></td>
            <td><%= request.getAttribute("prixtotal") %></td>
            <% prixfacture += Float.parseFloat(request.getAttribute("prixtotal").toString()); %>
        </tr>
        <% } %>

    </table>
    <div> Total price of your order:<%= prixfacture %></div>
    <form action="telecharger" method="post">
        <input type="submit" value="Dowload invoice"/>
    </form>
</body>
</html>
