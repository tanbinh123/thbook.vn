<%-- 
    Document   : login
    Created on : Oct 18, 2019, 3:57:55 AM
    Author     : USER
--%>

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta charset="utf-8">
        <meta http-equiv="X-UA-Compatible" content="IE=edge">
        <title>AdminLTE 3 | Log in</title>
        <!-- Tell the browser to be responsive to screen width -->
        <meta name="viewport" content="width=device-width, initial-scale=1">

        <!-- Font Awesome -->
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
		.login-page {
		  width: 360px;
		  padding: 8% 0 0;
		  margin: auto;
                  height: 100%;
		}
		.form {
		  position: relative;
		  z-index: 1;
		  background: #FFFFFF;
		  max-width: 360px;
		  margin: 0 auto 100px;
		  padding: 45px;
		  text-align: center;
		  box-shadow: 0 0 20px 0 rgba(0, 0, 0, 0.2), 0 5px 5px 0 rgba(0, 0, 0, 0.24);
		}
		.form input {
		  font-family: "Roboto", sans-serif;
		  outline: 0;
		  background: #f2f2f2;
		  width: 100%;
		  border: 0;
		  margin: 0 0 15px;
		  padding: 15px;
		  box-sizing: border-box;
		  font-size: 14px;

}

	</style>
        <body class="hold-transition login-page">
          
            <div class="login-page">
	  <div class="form">
	    <form action="<c:url value="j_spring_security_check"/>" method="post">
	      <input type="text" name="username"  placeholder="Username">
	       <input type="password" name="password" placeholder="Password">
	      <input type="submit" style="background: green; color: white;" />
              
              <p>Already have an account? <a href="register.html">Sign up</a>.</p>
           
	    </form>
                </div>
           </div>
        <!-- /.login-box -->

        <!-- jQuery -->
        <script src="<c:url value="/resources/plugins/jquery/jquery.min.js"></c:url>"></script>
            <!-- Bootstrap 4 -->
            <script src="<c:url value="/resources/plugins/bootstrap/js/bootstrap.bundle.min.js"></c:url>"></script>
            <!-- AdminLTE App -->
            <script src="<c:url value="/resources/dist/js/adminlte.min.js"></c:url>"></script>

    </body>
</html>
