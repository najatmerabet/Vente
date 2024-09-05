<%@ page language="java" contentType="text/html; charset=ISO-8859-1" pageEncoding="ISO-8859-1" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %>
<%@page import="Tables.Users" %>
<%@page import="DAO.ProduitDaolmp" %>
<html>
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1" />
    <title>Insert title here</title>
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
    <link href="style1.css" rel="stylesheet">
    <!-- link to script css -->

</head>
<body>
<jsp:include page="header.jsp"></jsp:include>
       <!--recuperer la session -->
                     <% ProduitDaolmp dao=new ProduitDaolmp();
                        Users user=new Users() ;

                        String name =(String)session.getAttribute("Username");
                    %>

                       <% int id=(Integer)session.getAttribute("id") ; %>

                    <div>
                        <!--formulair pour update des utilisateur-->
                        <h1 style="margin-top: 80px; margin-left: 450px; color: #d43f3a!important; font-family: inherit;">Update your Profile</h1>
                        <div style="background-color: #c0c0c0; padding-top: 10px; padding-left: 20px; margin-left: 400px; margin-bottom: 200px; margin-top: 40px; padding-bottom: 20px; padding-left: 20px; padding-right: 20px; border-radius: 15px; border-color: #d2d2d2; border-width: 50px; color: white; width: 600px; box-shadow: 0 1px 0 #cfcfcf;">
                            <form action="profile" method="post">
                                <div class="col-md-8 col-10 my-51">
                                    <div class="cllasse">
                                        <label style="font-size: 20px; margin-left: 80px; color: black;">Edit your Username:</label>
                                        <input type="text" name="username" style="font-size: 20px; margin-left: 60px; color: #000!important;" class="form-control input-sm chat-input" required="" cssClass="inputfield_pass" placeholder="username"/>
                                        <label style="font-size: 20px; margin-left: 80px; color: black;">Edit your Email:</label><br/>
                                        <input type="text" name="email" style="font-size: 20px; margin-left: 60px; color: black;" class="form-control input-sm chat-input" placeholder="email"/>
                                        </label>
                                        <input type="hidden" name="id" value="<%= id %>"/>
                                        <label style="font-size: 20px; margin-left: 80px; color: black;">Your new pass-word:</label>
                                        <input type="password" name="newpassword" required="" style="font-size: 20px; margin-left: 60px; color: black;" class="form-control input-sm chat-input" placeholder="nouveau mot de passe"/>
                                        <label style="font-size: 20px; margin-left: 80px; color: black;">Conferm your new pass-word:</label><br/>
                                        <input type="password" name="confirmnewpassword" required="" style="font-size: 20px; margin-left: 60px; color: black;" class="form-control input-sm chat-input" placeholder="confirmer nouveau mot de passe"/>
                                        <div class="wrapper"><br/>
                        <span class="group-btn">
                            <p><input type="submit" value="Modifier" style="color: #fff; background-color: #d9534f; border-color: #d43f3a; margin-left: 100px;"/></p>
                        </span>
                                        </div>
                                    </div>
                                </div>
                            </form>
                        </div>
                    </div>
</div>
                    <jsp:include page="footer.jsp"></jsp:include>
</body>
</html>