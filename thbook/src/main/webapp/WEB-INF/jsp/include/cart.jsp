<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@ taglib prefix = "fmt" uri = "http://java.sun.com/jsp/jstl/fmt" %>
<%@ page session="true" %>
<!-- Modal -->
<div class="modal fade" id="exampleModalLong" tabindex="-1" role="dialog" aria-labelledby="exampleModalLongTitle" aria-hidden="true">
    <div class="modal-xl  modal-dialog-centered" role="document">
        <div class="modal-content">
            <div class="modal-header">
                <h2 class="modal-title" id="exampleModalLongTitle"> <i class="fa fa-cart-plus"></i>  Giỏ hàng  </h2>
                <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                    <span aria-hidden="true">&times;</span>
                </button>
            </div>
            <div class="modal-body">
                <div class="container"> 
                    <c:if test="${sessionScope.order != null}" >
                        <form method="POST" action="/thbook/updateBookOnCart/">

                            <table id="cart" class="table table-hover table-condensed"> 
                                <thead> 
                                    <tr> 
                                        <th style="width:50%">Tên sản phẩm</th> 
                                        <th style="width:10%">Giá</th> 
                                        <th style="width:8%">Số lượng</th> 
                                        <th style="width:22%" class="text-center">Thành tiền</th> 
                                        <th style="width:10%"> </th> 
                                    </tr> 
                                </thead> 
                                <tbody>
                                    <c:forEach var="orderDetail" items="${sessionScope.order.orderDetails}"> 
                                        <tr> 
                                            <td data-th="Product"> 
                                                <div class="row"> 
                                                    <div class="col-sm-2 hidden-xs"><img  height="42" width="42" src="${orderDetail.product.images}">
                                                    </div> 
                                                    <div class="col-sm-10"> 
                                                        <h4 class="nomargin">${orderDetail.product.name}</h4> 
                                                        <p>${orderDetail.product.name}</p> 
                                                    </div> 
                                                </div> 
                                            </td> 

                                            <td data-th="Price">
                                                <fmt:formatNumber type = "number" maxFractionDigits  = "3" value = "${orderDetail.product.price}"/> 
                                            </td> 
                                            <td data-th="Quantity">
                                                <input placeholder="5" class="text-center" name="quantity" value="${orderDetail.quantity}" type="number">
                                            </td> 
                                            <td data-th="Subtotal" class="text-center"> 
                                                <fmt:formatNumber type = "number" maxFractionDigits  = "3" value = "${orderDetail.total}" /> đ
                                            </td> 
                                            <td class="actions" data-th="">
                                               
                                                    <a href="/thbook/deteteBookOnCart/${orderDetail.product.id}"><i style="background-color: green; padding: 2px;" class="fa fa-trash" aria-hidden="true"></i>
</a>
                                           
                                            </td> 
                                        </tr> 
                                    </c:forEach>
                                </tbody>
                                <tfoot> 
                                    <tr> 
                                        <td>
                                            <a href="/thbook" class="btn btn-warning">
                                                <i class="fa fa-angle-left"></i> 
                                                Tiếp tục mua hàng
                                            </a>
                                        </td> 
                                        <td colspan="1" class="hidden-xs"></td> 
                                        <td>
                                            <button type="submit" class="btn btn-success btn-block">Cập nhật giỏ hàng</button>
                                        </td> 
                                        <td class="hidden-xs text-center">
                                            <strong>

                                                Tổng tiền <fmt:formatNumber type = "number" maxFractionDigits  = "3" value = "${sessionScope.order.total}" /> đ
                                            </strong>
                                        </td> 
                                        <td>
                                            <a href="/thbook/checkout/" class="btn btn-success btn-block">
                                                Thanh toán 
                                                <i class="fa fa-angle-right"></i>
                                            </a>
                                        </td> 
                                    </tr> 
                                </tfoot> 
                            </table>
                        </c:if>
                    </form>
                </div>
            </div>
        </div>
    </div>
</div>
