<%@ page language="java" contentType="text/html; charset=ISO-8859-1" pageEncoding="ISO-8859-1" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
   <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
    <meta name="keywords"
          content="unique login form,leamug login form,boostrap login form,responsive login form,free css html login form,download login form">
    <meta name="author" content="leamug">
    <title>Formulaire de connexion </title>
    <link href="css/style.css" rel="stylesheet" id="style">
    <!-- Bootstrap core Library -->
    <link href="//netdna.bootstrapcdn.com/bootstrap/3.2.0/css/bootstrap.min.css" rel="stylesheet" id="bootstrap-css">
    <script src="//netdna.bootstrapcdn.com/bootstrap/3.2.0/js/bootstrap.min.js"></script>
    <script src="//code.jquery.com/jquery-1.11.1.min.js"></script>
    <!-- Google font -->
    <link href="https://fonts.googleapis.com/css?family=Dancing+Script" rel="stylesheet">
    <!-- Font Awesome-->
    	        <link rel="stylesheet" type="text/css" href="singup.css">
    <%@taglib  uri="/struts-tags" prefix="s" %>
    
    <link href="//maxcdn.bootstrapcdn.com/font-awesome/4.2.0/css/font-awesome.min.css" rel="stylesheet">
</head>
<body  >
<div class="logo">
  <img src="photos/photos/logo.png" alt="" class="logo" />
</div>
<!-- Page Content -->
<div class="container">
    <div class="row">
        <div class="col-md-offset-5 col-md-4 text-center">
            <h1 class='text-white'>LOGIN</h1>
              <div class="form-login"><br/>
               <!-- formulaire pour le login-->
    <form action="login" method="post" cssStyle="width:100%; align-content:center;">
    
        <input type="text" name="username" class="form-control input-sm chat-input" required   cssClass="inputfield_pass" placeholder="Username"/> </br>
         <br />
        
        <input type="password" name="password" required  class="form-control input-sm chat-input" placeholder="Password"/>
        <br/>
        <div class="wrapper">
                        <span class="group-btn" >
                                <p>   <s:submit value="Connexion" class="btn btn-danger btn-md" />
                                   
                                <br/><br/><a href="singup.jsp" class="btn btn-danger btn-md">Signup <i class="fa fa-sign-in"></i></a>

                     </p> </span>
              
                </div>
             <s:fielderror fieldName="login" cssClass="error" />
    </form>
      </div>
        </div>

</div>
</div>
</body>
</html>