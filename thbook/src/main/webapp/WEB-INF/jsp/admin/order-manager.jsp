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
                                    <form action="/thbook/admin/filter" method="POST" >
                                    <label>LỌC THEO ĐƠN HÀNG :  </label>
  <select name="filter">
<!--  <option value="all">Tất Cả</option>-->
  <option value="ctv">Đơn hàng của cộng tác viên</option>
<!--  <option value="customer">Đơn hàng của khách</option>-->
 </select>    
                                    <input class="btn btn-success" type="submit" value="submit" name="submit">
                                    </form>
                                </div>
                                <!-- /.card-header -->
                                <div class="card-body">
                                    <table id="example1" class="table table-bordered">
                                        <thead>
                                            <tr>
                                                <th>Mã Người Đặt</th>
                                                <th>Mã Đơn Hàng</th>
                                                <th>Tên Người Mua</th>
                                                <th>Địa Chỉ</th>
                                                <th>Ngày Mua</th>
                                                <th>Trạng Thái</th>
                                                <th>Giá</th>
                                                <th>Hành Động</th>
                                            </tr>
                                        </thead>                     
                                        <tbody>
                                            <c:forEach var="order" items="${orders}" varStatus="status">
                                                <tr class="clickable" data-toggle="collapse" data-target="#group-of-rows-${order.id}" aria-expanded="false" aria-controls="group-of-rows-${order.id}">
                                                   <td>${order.username}</td>
                                                    <td>${order.id}&ensp;	
                                                        <button type="button" class="btn btn-primary">Xem Chi Tiết </button>

                                                    </td>
                                                    <td>${order.fullName}</td>
                                                    <td>
                                                        ${order.address}
                                                    </td>
                                                    <td>${order.orderDate}</td>
                                                    <td>
                                                        <form action="/thbook/admin/updateOrder" method="POST">
                                                            <select name="status">
                                                                <c:forEach var="status" items="${orderStatus}">
                                                                    <c:if test="${order.status==status}">
                                                                        <option selected>
                                                                            ${status}
                                                                        </option>
                                                                    </c:if>
                                                                    <c:if test="${order.status!=status}">
                                                                        <option>
                                                                            ${status}
                                                                        </option>
                                                                    </c:if>
                                                                </c:forEach>
                                                                <input type="hidden" id="custId" name="id" value="${order.id}">
                                                            </select>
                                                            <button type="submit" class="btn btn-warning">update</button>   
                                                        </form>
                                                    </td>
                                                    <td>
                                                        <fmt:formatNumber type = "number" maxFractionDigits  = "3" value = "${order.total}" />
                                                    </td>
                                                    <td>




                                                        <form action="/thbook/admin/deleteOrder" method="POST">
                                                            <input type="hidden" id="custId" name="id" value="${order.id}">
                                                            <button type="submit" class="btn btn-danger">Xóa</button>  
                                                        </form>
                                                    </td>
                                                </tr>
                                                <tr id="group-of-rows-${order.id}" class="collapse">
                                                    <td colspan="7">
                                                        <table class="table table-bordered">
                                                            <thead>
                                                                <tr>
                                                                    <th>Đơn Hàng</th>
                                                                    <th>Số Lượng</th>
                                                                    <th>Giá</th>
                                                                </tr>
                                                            </thead>    
                                                            <tbody>
                                                                <c:forEach var="orderDetail" items="${order.orderDetails}">
                                                                    <tr>
                                                                        <td>${orderDetail.product.name}</td>
                                                                        <td><c:out value="${orderDetail.quantity}"/> </td>
                                                                        <td>
                                                                            <fmt:formatNumber type = "number" maxFractionDigits  = "3" value = "${orderDetail.product.price}" />
                                                                        </td>
                                                                    </tr>
                                                                </c:forEach>  
                                                            </tbody>
                                                            <tbody>
                                                                <tr>
                                                                    <td></td>
                                                                    <td>Tổng Giá</td>
                                                                    <td>
                                                                        <fmt:formatNumber type = "number" maxFractionDigits  = "3" value = "${order.total}" />
                                                                    </td>
                                                                </tr>

                                                            </tbody>
                                                        </table>

                                                    </td>

                                                </tr>
                                            </c:forEach>   
                                        </tbody>
                                        <tfoot>
                                            <tr>
                                                <th>Mã Đơn Hàng</th>
                                                <th>Tên Người Mua</th>
                                                <th>Địa Chỉ</th>
                                                <th>Ngày Mua</th>
                                                <th>Trạng Thái</th>
                                                <th>Giá</th>
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
