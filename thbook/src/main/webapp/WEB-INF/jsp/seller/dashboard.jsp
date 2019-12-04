<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
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
                <div class="content-header">
                    <div class="container-fluid">
                        <div class="row mb-2">
                            <div class="col-sm-6">
                                <h1 class="m-0 text-dark">Dashboard v3</h1>
                            </div><!-- /.col -->
                            <div class="col-sm-6">
                                <ol class="breadcrumb float-sm-right">
                                    <li class="breadcrumb-item"><a href="#">Home</a></li>
                                    <li class="breadcrumb-item active">Dashboard v3</li>
                                </ol>
                            </div><!-- /.col -->
                        </div><!-- /.row -->
                    </div><!-- /.container-fluid -->
                </div>
                <!-- /.content-header -->

                <!-- Main content -->
                <div class="content">
                    <div class="container-fluid">
                        <div class="row">
                            <div class="col-lg-6">


                                <div class="card">
                                    <div class="card-header border-0">
                                        <h3 class="card-title">Products</h3>
                                        <div class="card-tools">
                                            <a href="#" class="btn btn-tool btn-sm">
                                                <i class="fas fa-download"></i>
                                            </a>
                                            <a href="#" class="btn btn-tool btn-sm">
                                                <i class="fas fa-bars"></i>
                                            </a>
                                        </div>
                                    </div>
                                    <div class="card-body p-0">
                                        <table class="table table-striped table-valign-middle">
                                            <thead>
                                                <tr>
                                                    <th>Product</th>
                                                    <th>Price</th>
                                                    <th>sales</th>
                                                    <th>More</th>
                                                </tr>
                                            </thead>
                                            <tbody>
                                                <tr>
                                                    <td>
                                                        <img src="dist/img/default-150x150.png" alt="Product 1" class="img-circle img-size-32 mr-2">
                                                        Some Product
                                                    </td>
                                                    <td>$13 USD</td>
                                                    <td>
                                                        <small class="text-success mr-1">
                                                            <i class="fas fa-arrow-up"></i>
                                                            12%
                                                        </small>
                                                        12,000 Sold
                                                    </td>
                                                    <td>
                                                        <a href="#" class="text-muted">
                                                            <i class="fas fa-search"></i>
                                                        </a>
                                                    </td>
                                                </tr>
                                                <tr>
                                                    <td>
                                                        <img src="dist/img/default-150x150.png" alt="Product 1" class="img-circle img-size-32 mr-2">
                                                        Another Product
                                                    </td>
                                                    <td>$29 USD</td>
                                                    <td>
                                                        <small class="text-warning mr-1">
                                                            <i class="fas fa-arrow-down"></i>
                                                            0.5%
                                                        </small>
                                                        123,234 Sold
                                                    </td>
                                                    <td>
                                                        <a href="#" class="text-muted">
                                                            <i class="fas fa-search"></i>
                                                        </a>
                                                    </td>
                                                </tr>
                                                <tr>
                                                    <td>
                                                        <img src="dist/img/default-150x150.png" alt="Product 1" class="img-circle img-size-32 mr-2">
                                                        Amazing Product
                                                    </td>
                                                    <td>$1,230 USD</td>
                                                    <td>
                                                        <small class="text-danger mr-1">
                                                            <i class="fas fa-arrow-down"></i>
                                                            3%
                                                        </small>
                                                        198 Sold
                                                    </td>
                                                    <td>
                                                        <a href="#" class="text-muted">
                                                            <i class="fas fa-search"></i>
                                                        </a>
                                                    </td>
                                                </tr>
                                                <tr>
                                                    <td>
                                                        <img src="dist/img/default-150x150.png" alt="Product 1" class="img-circle img-size-32 mr-2">
                                                        Perfect Item
                                                        <span class="badge bg-danger">NEW</span>
                                                    </td>
                                                    <td>$199 USD</td>
                                                    <td>
                                                        <small class="text-success mr-1">
                                                            <i class="fas fa-arrow-up"></i>
                                                            63%
                                                        </small>
                                                        87 Sold
                                                    </td>
                                                    <td>
                                                        <a href="#" class="text-muted">
                                                            <i class="fas fa-search"></i>
                                                        </a>
                                                    </td>
                                                </tr>
                                            </tbody>
                                        </table>
                                    </div>
                                </div>
                                <!-- /.card -->
                            </div>
                            <!-- /.col-md-6 -->
                            <div class="col-lg-6">
                                <div class="card">
                                    <div class="card-header border-0">
                                        <div class="d-flex justify-content-between">
                                            <h3 class="card-title">Sales</h3>
                                            <a href="javascript:void(0);">View Report</a>
                                        </div>
                                    </div>
                                    <div class="card-body">
                                        <div class="d-flex">
                                            <p class="d-flex flex-column">
                                                <span class="text-bold text-lg">$18,230.00</span>
                                                <span>Sales Over Time</span>
                                            </p>
                                            <p class="ml-auto d-flex flex-column text-right">
                                                <span class="text-success">
                                                    <i class="fas fa-arrow-up"></i> 33.1%
                                                </span>
                                                <span class="text-muted">Since last month</span>
                                            </p>
                                        </div>
                                        <!-- /.d-flex -->

                                        <div class="position-relative mb-4">
                                            <canvas id="sales-chart" height="200"></canvas>
                                        </div>

                                        <div class="d-flex flex-row justify-content-end">
                                            <span class="mr-2">
                                                <i class="fas fa-square text-primary"></i> This year
                                            </span>

                                            <span>
                                                <i class="fas fa-square text-gray"></i> Last year
                                            </span>
                                        </div>
                                    </div>
                                </div>
                                <!-- /.card -->
                            </div>
                            <!-- /.col-md-6 -->
                        </div>
                        <!-- /.row -->
                    </div>
                    <!-- /.container-fluid -->
                </div>
                <!-- /.content -->
            </div>
            <jsp:include page="../include/footer.jsp"/>
            </div>
    </body>
</html>
