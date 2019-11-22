<%-- 
    Document   : register
    Created on : Oct 19, 2019, 4:28:19 AM
    Author     : USER
--%>

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta charset="utf-8">
        <meta http-equiv="X-UA-Compatible" content="IE=edge">
        <title>Registration Page</title>
        <!-- Tell the browser to be responsive to screen width -->
        <meta name="viewport" content="width=device-width, initial-scale=1">
        <link rel="stylesheet" href="<c:url value="/resources/plugins/fontawesome-free/css/all.min.css"></c:url>">
            <!-- Ionicons -->
            <link rel="stylesheet" href="https://code.ionicframework.com/ionicons/2.0.1/css/ionicons.min.css">
            <!-- icheck bootstrap -->
            <link rel="stylesheet" href="<c:url value="/resources/plugins/icheck-bootstrap/icheck-bootstrap.min.css"></c:url>">
            <!-- Theme style -->
            <link rel="stylesheet" href="<c:url value="/resources/dist/css/adminlte.min.css"></c:url>">

            <!-- Google Font: Source Sans Pro -->
            <link href="https://fonts.googleapis.com/css?family=Source+Sans+Pro:300,400,400i,700" rel="stylesheet">


        </head>
        <style>
body {
  font-family: Arial, Helvetica, sans-serif;
  background-color: white;
}

* {
  box-sizing: border-box;
}

/* Add padding to containers */
.container {
  padding: 16px;
  background-color: white;
}

/* Full-width input fields */
input[type=text], input[type=password], input[type=email],input[type=date], input[type=number] {
  width: 100%;
  padding: 15px;
  margin: 5px 0 22px 0;
  display: inline-block;
  border: none;
  background: #f1f1f1;
}

input[type=text]:focus, input[type=password]:focus {
  background-color: #ddd;
  outline: none;
}

/* Overwrite default styles of hr */

/* Set a style for the submit button */
.registerbtn {
  background-color: #4CAF50;
  color: white;
  padding: 16px 20px;
  margin: 8px 0;
  border: none;
  cursor: pointer;
  width: 100%;
  opacity: 0.9;
}

.registerbtn:hover {
  opacity: 1;
}

/* Add a blue text color to links */
a {
  color: dodgerblue;
}

/* Set a grey background color and center the text of the "sign in" section */
.signin {
  background-color: #f1f1f1;
  text-align: center;
}

form{
    width: 600px;
    margin: auto;
    border: 1px solid gray;
}

h1{
    text-align: center;
}
</style>
        <body>
          
        
         <form action="${pageContext.request.getContextPath()}/register" modelAttribute="account" id="registerform" method="post" >
            <div class="container">
              <h1>ĐĂNG KÝ</h1>
              


              <label for="username"><b>Username</b></label>
               <input type="text" name="username" class="form-control" placeholder="Username">

              <label for="password1"><b>Password</b></label>
              <input type="password" name="password1" class="form-control" placeholder="Password">

              <label for="password2"><b>Repeat Password</b></label>
              <input type="password" name="password2" class="form-control" placeholder="Retype password">
              
               <label for="fullName"><b>Full name</b></label>
               <input type="text" name="fullName" class="form-control" placeholder="Full name">
               
                <label for="email"><b>Email</b></label>
                 <input type="email" name="email" class="form-control" placeholder="Email">
                
                 <label for="birthday"><b>Birthday</b></label>
                 <input type="date" name="birthday" class="form-control" placeholder="Birthday">
                 
                  <label for="address"><b>Địa chỉ</b></label>
                  <input type="text" name="address" class="form-control" placeholder="Address">
                  
                  <label for="phone"><b>Phone</b></label>
                    <input type="number" name="phone" class="form-control" placeholder="Tetephonenumer">
       
              

              <button type="submit" class="registerbtn">Register</button>
            </div>

            <div class="container signin">
              <p>Already have an account? <a href="login.html">Sign in</a>.</p>
            </div>
          </form>


        <!-- jQuery -->
        <script src="<c:url value="/resources/plugins/jquery/jquery.min.js"></c:url>"></script>
            <!-- Bootstrap 4 -->
            <script src="<c:url value="/resources/plugins/bootstrap/js/bootstrap.bundle.min.js"></c:url>"></script>
            <!-- AdminLTE App -->
            <script src="<c:url value="/resources/dist/js/adminlte.min.js"></c:url>"></script>

    </body>
</html>
