<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>

<aside class="main-sidebar sidebar-dark-primary elevation-4">
    <!-- Brand Logo -->
    <a href="/thbook" class="brand-link">
        <img src="<c:url value="/resources/dist/img/AdminLTELogo.png"></c:url>" alt="AdminLTE Logo" class="brand-image img-circle elevation-3"
             style="opacity: .8">
            <span class="brand-text font-weight-light">TH BOOK</span>
        </a>

        <!-- Sidebar -->
        <div class="sidebar">
            <!-- Sidebar user panel (optional) -->
            <div class="user-panel mt-3 pb-3 mb-3 d-flex">
                <div class="image">
                    <img src="<c:url value="/resources/dist/img/user2-160x160.jpg"></c:url>" class="img-circle elevation-2" alt="User Image">
            </div>
            <div class="info">
                <a href="#" class="d-block">Alexander Pierce</a>
            </div>
        </div>

        <!-- Sidebar Menu -->
        <nav class="mt-2">
            <ul class="nav nav-pills nav-sidebar flex-column" data-widget="treeview" role="menu" data-accordion="false">
                <!-- Add icons to the links using the .nav-icon class
                     with font-awesome or any other icon font library -->
                <li class="nav-item has-treeview menu-open">
                    <a href="/thbook/admin/dashboard" class="nav-link active">
                        <i class="nav-icon fas fa-tachometer-alt"></i>
                        <p>
                            Bảng Điều Khiển
                        </p>
                    </a>
                </li>
                <li class="nav-item">
                    <a href="/thbook/admin/product-manager" class="nav-link">
                        <i class="far fa-circle nav-icon"></i>
                        <p>
                            Quản Lý Sách
                        </p>
                    </a>
                </li>    
                <li class="nav-item">
                    <a href="/thbook/admin/order-manager" class="nav-link">
                        <i class="nav-icon fas fa-chart-pie"></i>
                        <p>
                            Quản Lý Đơn Hàng
                        </p>
                    </a>
                </li>  
                <li class="nav-item">
                    <a href="/thbook/admin/account-manager" class="nav-link">
                        <i class="nav-icon fas fa-th"></i>
                        <p>
                            Quản Lý Người Dùng
                        </p>
                    </a>
                </li>  
            </ul>   
        </nav>
        <!-- /.sidebar-menu -->
    </div>
    <!-- /.sidebar -->
</aside>