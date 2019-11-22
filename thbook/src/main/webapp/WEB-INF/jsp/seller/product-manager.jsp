<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@ taglib prefix = "fmt" uri = "http://java.sun.com/jsp/jstl/fmt" %>
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
            <jsp:include page="../include/aside_seller.jsp"/>
            <div class="content-wrapper">
                <!-- Content Header (Page header) -->
                <section class="content-header">
                    <div class="container-fluid">
                        <div class="row mb-2">
                            <div class="col-sm-6">
                                <h1>DataTables</h1>
                            </div>
                            <div class="col-sm-6">
                                <ol class="breadcrumb float-sm-right">
                                    <li class="breadcrumb-item"><a href="#">Home</a></li>
                                    <li class="breadcrumb-item active">DataTables</li>
                                </ol>
                            </div>
                        </div>
                    </div><!-- /.container-fluid -->
                </section>
                <!-- Main content -->
                <section class="content">
                    <div class="row">
                        <div class="col-12">
                            <div class="card">
                                <div class="card-header">
                               
                                </div>

                                <!-- /.card-header -->
                                <div class="card-body">
                                    <table id="example1" class="table table-bordered table-striped">
                                        <thead>
                                            <tr>
                                                <th>id</th>
                                                <th>Ảnh</th>
                                                <th>Tên</th>
                                                <th>Giá</th>
                                                <th>Giới Thiệu</th>
                                                <th>Thể Loại</th>
                                           
                                            </tr>
                                        </thead>
                                        <tbody>

                                            <c:forEach var="products" items="${products}" varStatus="status">
                                                <tr>
                                                    <td>${products.id}</td>
                                                    <td><img src="${products.images}" style="width:82px; height:86px" title="White flower" alt="Flower"></td>
                                                    <td>${products.name}</td>
                                                    <td>
                                                        <fmt:formatNumber type = "number" maxFractionDigits  = "3" value = "${products.price}" /> VNĐ
                                                    </td>
                                                    <td>${products.description}</td>
                                                    <td>${products.category.description}</td>

                                                    
                                                </tr> 
                                            </c:forEach>   
                                        </tbody>
                                        <tfoot>
                                            <tr>
                                                <th>id</th>
                                                <th>Ảnh</th>
                                                <th>Tên</th>
                                                <th>Giá</th>
                                                <th>Giới Thiệu</th>
                                                <th>Thể Loại</th>
                           
                                            </tr>
                                        </tfoot>
                                    </table>
                                </div>
                                <!-- /.card-body -->
                            </div>
                            <!-- /.card -->
                        </div>
                        <!-- /.col -->
                    </div>
                    <!-- /.row -->
                </section>
                <!-- /.content -->
            </div>

            <jsp:include page="../include/footer.jsp"/>
        </div>
        <script>
            $(function () {
                $("#example1").DataTable();
                $('#example2').DataTable({
                    "paging": true,
                    "lengthChange": false,
                    "searching": false,
                    "ordering": true,
                    "info": true,
                    "autoWidth": false,
                });
            });
        </script>
    </body>
</html>
