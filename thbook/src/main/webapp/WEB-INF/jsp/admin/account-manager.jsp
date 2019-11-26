<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
        <link rel="stylesheet" href="<c:url value="/resources/plugins/fontawesome-free/css/all.min.css"></c:url>">

            <link rel="stylesheet" href="<c:url value="/resources/plugins/icheck-bootstrap/icheck-bootstrap.min.css"></c:url>">
        <link rel="stylesheet" href="<c:url value="/resources/dist/css/adminlte.min.css"></c:url>">
            <link rel="stylesheet" href="https://code.ionicframework.com/ionicons/2.0.1/css/ionicons.min.css">
            <link href="https://fonts.googleapis.com/css?family=Source+Sans+Pro:300,400,400i,700" rel="stylesheet">
        </head>
        <body class="hold-transition sidebar-mini">
            <div class="wrapper">  
            <jsp:include page="../include/nav.jsp"/>
            <jsp:include page="../include/aside.jsp"/>
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
                                    <h3 class="card-title">Data Table with default features</h3>
                                </div>
                                <!-- /.card-header -->
                                <div class="card-body">
                                    <table id="example1" class="table table-bordered table-striped">
                                        <thead>
                                            <tr>
                                                <th>Username</th>
                                                <th>Số điện thoại</th>
                                                <th>Tên</th>
                                                <th>Email</th>
                                                <th>Ngày Sinh</th>
                                                <th>Địa Chỉ</th>
                                                <th>ROLE</th>
                                                <th>Hành Động</th>
                                            </tr>
                                        </thead>
                                        <tbody>

                                            <c:forEach var="accounts" items="${accounts}" varStatus="status">
                                                <tr>
                                                    <td>${accounts.username}</td>
                                                    <td>${accounts.phone}</td>
                                                    <td>${accounts.fullName}</td>
                                                    <td>${accounts.email}</td>
                                                    <td>${accounts.birthday}</td>
                                                    <td>${accounts.address}</td>
                                                    <td>


                                                        <form action="/thbook/admin/updateAccount" method="POST">
                                                            <c:forEach var="role" items="${accounts.accountRoles}">
                                                              

                                                                <select name="role">
                                                                    <c:forEach var="roleStatus" items="${roles}">
                                                                        <c:if test="${role.roles!=roleStatus}">
                                                                            <option>
                                                                                ${roleStatus}
                                                                            </option>
                                                                        </c:if>
                                                                            <c:if test="${role.roles==roleStatus}">
                                                                                <option selected="ok">
                                                                                ${roleStatus}
                                                                            </option>
                                                                        </c:if>
                                                                    </c:forEach>
                                                                </c:forEach>

                                                                <input type="hidden" id="custId" name="id" value="${accounts.id}">
                                                            </select>
                                                            <button type="submit" class="btn btn-warning">update</button>   
                                                        </form>

                                                    </td>
                                                    <td>
                                                        <form action="/thbook/admin/delete" method="POST">
                                                            <input type="hidden" id="custId" name="id" value="${accounts.id}">
                                                            <button type="submit" class="btn btn-danger">Xóa</button>   
                                                        </form>
                                                    </td>
                                                </tr> 
                                            </c:forEach>   


                                        </tbody>
                                        <tfoot>
                                            <tr>
                                                <th>Username</th>
                                                <th>Số điện thoại</th>
                                                <th>Tên</th>
                                                <th>Email</th>
                                                <th>Ngày Sinh</th>
                                                <th>Địa Chỉ</th>
                                                <th>ROLE</th>
                                                <th>Hành Động</th>
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
