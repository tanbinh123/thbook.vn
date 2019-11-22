<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@taglib prefix = "fmt" uri = "http://java.sun.com/jsp/jstl/fmt" %>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
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
        <body class="hold-transition sidebar-mini">
            <div class="wrapper">  
            <jsp:include page="../include/nav.jsp"/>
            <jsp:include page="../include/aside.jsp"/>
            <div class="content-wrapper">
                <div class="phanhai">
                    <div class="container">
                        <div class="row">
                            <div class="col-3">

                            </div>
                            <div class="col-5">
                                <form action="" method="POST" accept-charset="utf-8">
                                    <br>
                                    <br>
                                    <h3>Thêm sản phẩm</h3>
                                    <br>
                                    <table border="0" class="table">
                                        <thead>
                                            <tr>
                                                <td><span>Tên sản phẩm</span></td>
                                                <td><input type="text" name="name" class="form-control" placeholder="Tên sản phẩm"></td>
                                            </tr>
                                        </thead>
                                        <tbody>
                                            <tr>
                                                <td><span>Giá</span></td>
                                                <td><span><input type="number" name="price" class="form-control" placeholder="Giá"></span></td>
                                            </tr>

                                            <tr>
                                                <td><span>Mô tả</span></td>
                                                <td>  <input type="text" name="description" class="form-control" placeholder="Mô tả"></td>
                                            </tr>
                                            <tr>
                                                <td><span>Thể loại</span></td>

                                                <td>  
                                                    <div class="form-group">
                                                        <select class="form-control" id="exampleFormControlSelect1" name="categoryName">
                                                            <c:forEach var="category" items="${categorys}">
                                                                <option value="${category.id}">${category.name}</option>
                                                            </c:forEach>
                                                        </select>
                                                    </div>
                                                </td>
                                            </tr>
                                            <tr>
                                                <td><span>Link ảnh</span></td>
                                                <td><input type="text" name="images" class="form-control" placeholder="Link ảnh"></td>
                                            </tr>
                                            <tr>
                                                <td></td>
                                                <td>  
                                                    <button type="submit" class="btn btn-primary btn-block btn-flat">Thêm sản phẩm</button>
                                                </td>
                                            </tr>
                                        </tbody>
                                    </table>
                                </form>
                            </div>
                        </div>
                    </div>
                </div>
            </div>

            <jsp:include page="../include/footer.jsp"/>
        </div>

    </body>
</html>
