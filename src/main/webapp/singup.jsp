<%@ page language="java" contentType="text/html; charset=ISO-8859-1" pageEncoding="ISO-8859-1" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<link href="//maxcdn.bootstrapcdn.com/bootstrap/4.0.0/css/bootstrap.min.css" rel="stylesheet" id="bootstrap-css">
<script src="//maxcdn.bootstrapcdn.com/bootstrap/4.0.0/js/bootstrap.min.js"></script>
<script src="//cdnjs.cloudflare.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
    <meta name="keywords"
          content="unique login form,leamug login form,boostrap login form,responsive login form,free css html login form,download login form">
    <meta name="author" content="leamug">
    <title>Formulaire de inscription</title>
    <link href="singup.css" rel="stylesheet" id="style">
    <!-- Bootstrap core Library -->
    <link href="//netdna.bootstrapcdn.com/bootstrap/3.2.0/css/bootstrap.min.css" rel="stylesheet" >
    <script src="//netdna.bootstrapcdn.com/bootstrap/3.2.0/js/bootstrap.min.js"></script>
    <script src="//code.jquery.com/jquery-1.11.1.min.js"></script>
    <!-- Google font -->
    <link href="https://fonts.googleapis.com/css?family=Dancing+Script" rel="stylesheet">
    <!-- Font Awesome-->
    	        <link rel="stylesheet" type="text/css" href="singup.css">
    
    <link href="//maxcdn.bootstrapcdn.com/font-awesome/4.2.0/css/font-awesome.min.css" rel="stylesheet">
</head>
<body style="background-image: url('photos/photos/background.jpeg');">
<div class="logo">
  <img src="photos/photos/logo.png" alt="" class="logo" />
</div>
<div class="container">

    <div class="row">
        <div class="col-md-offset-5 col-md-4 text-center">
            <h1 class='text-white'>Sign-up</h1>
              <div class="form-login"></br>
               <!--   <h4>inscription</h4>
                </br> --> 
    <form action="Register" method="post" cssStyle="width:100%; align-content:center;">
       <!-- <label for="username">Username:</label> -->
        <input type="text" name="username" class="form-control input-sm chat-input" placeholder="Username" required/> </br>
        
    </br>
       <!-- <label for="password">Password:</label>-->
        <input type="password" name="password" class="form-control input-sm chat-input"   placeholder="Password" required  /> </br>
         
 </br>
   <!--<label for="email">votre email:</label>-->
        <input type="text" name="email" class="form-control input-sm chat-input" placeholder="Email" required/> </br>
         
      </br>   
     <!--   <label for="tel">tel:</label>-->
        <input type="tel" name="tel" class="form-control input-sm chat-input" placeholder="Phone number"/> </br>
      </br>   
        <div class="wrapper">
                    <p>   
                        <span class="group-btn" >
                            <input type="submit" value="Sign-up"  Class="btn btn-danger btn-md"/>

                      </span></p>
                </div>
               
    </form>
     </div>
        </div>
    </div>
    
    </div></br></br>
     <!--footer-->
    <div class="footer text-black text-center">
        <p><a>© 2023 Formulaire de connexion unique. | Rayban</a></p>
    </div>
    <!--//footer-->
</body>
</html>
