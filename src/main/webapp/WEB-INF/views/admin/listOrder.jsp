<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8" isELIgnored="false" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<html>
<head>
    <meta charset="utf-8"/>
    <meta name="viewport" content="width=device-width, initial-scale=1.0"/>
    <title>模仿天猫-后台</title>
    <!-- Bootstrap Styles-->
    <link href="../assets/css/bootstrap.css" rel="stylesheet"/>
    <!-- FontAwesome Styles-->
    <link href="../assets/css/font-awesome.css" rel="stylesheet"/>
    <!-- Morris Chart Styles-->

    <!-- Custom Styles-->
    <link href="../assets/css/custom-styles.css" rel="stylesheet"/>
    <!-- Google Fonts-->
    <link href='https://fonts.googleapis.com/css?family=Open+Sans' rel='stylesheet' type='text/css'/>
    <!-- TABLE STYLES-->
    <link href="../assets/js/dataTables/dataTables.bootstrap.css" rel="stylesheet"/>
</head>
<body>
<div id="wrapper">
    <nav class="navbar navbar-default top-navbar" role="navigation">
        <div class="navbar-header">
            <button type="button" class="navbar-toggle" data-toggle="collapse" data-target=".sidebar-collapse">
                <span class="sr-only">Toggle navigation</span>
                <span class="icon-bar"></span>
                <span class="icon-bar"></span>
                <span class="icon-bar"></span>
            </button>
            <a class="navbar-brand" href="listCategory">Tmall</a>
        </div>
    </nav>

    <!--/. NAV TOP  -->
    <nav class="navbar-default navbar-side" role="navigation">
        <div class="sidebar-collapse">
            <ul class="nav" id="main-menu">

                <li>
                    <a href="listCategory"><i class="fa fa-bars"></i> 分类管理</a>
                </li>
                <li>
                    <a href="listUser"><i class="fa fa-user"></i> 用户管理</a>
                </li>
                <li>
                    <a class="active-menu" href="listOrder"><i class="fa fa-list-alt"></i> 订单管理</a>
                </li>
                <li>
                    <a href="listLink"><i class="fa fa-link"></i> 推荐链接管理</a>
                </li>
            </ul>
        </div>

    </nav>
    <!-- /. NAV SIDE  -->
    <div id="page-wrapper">
        <div id="page-inner">
            <div class="row">
                <div class="col-md-12">
                    <h1 class="page-header">
                        订单管理
                        <small></small>
                    </h1>
                </div>
            </div>

            <div class="row">
                <div class="col-md-12">
                    <!-- Advanced Tables -->
                    <div class="panel panel-default">
                        <div class="panel-heading">
                            订单管理表
                        </div>
                        <div class="panel-body">
                            <div class="table-responsive">
                                <table class="table table-striped table-bordered table-hover" id="dataTables-example">
                                    <thead>
                                    <tr>
                                        <th>订单id</th>
                                        <th>订单号</th>
                                        <th>收货地址</th>
                                        <th>邮编</th>

                                        <th>收货人姓名</th>
                                        <th>手机号码</th>
                                        <th>用户备注</th>

                                        <th>订单创建时间</th>
                                        <th>订单支付时间</th>
                                        <th>订单发货时间</th>
                                        <th>确认收货时间</th>
                                        <th>订单状态</th>
                                        <th>操作</th>

                                    </tr>
                                    </thead>
                                    <tbody>
                                    <c:forEach items="${orders}" var="o">
                                        <tr>
                                            <td>${o.id}</td>
                                            <td>${o.order_code}</td>
                                            <td>${o.address}</td>
                                            <td>${o.post}</td>

                                            <td>${o.receiver}</td>
                                            <td>${o.mobile}</td>
                                            <td>${o.user_message}</td>

                                            <td>${o.create_date}</td>
                                            <td>${o.pay_date}</td>
                                            <td>${o.delivery_date}</td>
                                            <td>${o.pay_date}</td>
                                            <td>${o.status}</td>
                                            <td>
                                                <%--<form action="updateOrder" role="form">--%>
                                                    <%-- 表单隐藏信息 --%>
                                                    <input type="hidden" name="id" value="${o.id}">
                                                    <input type="hidden" name="order_code" value="${o.order_code}">
                                                    <input type="hidden" name="address" value="${o.address}">
                                                    <input type="hidden" name="post" value="${o.post}">

                                                    <input type="hidden" name="receiver" value="${o.receiver}">
                                                    <input type="hidden" name="mobile" value="${o.mobile}">
                                                    <input type="hidden" name="user_message" value="${o.user_message}">

                                                    <input type="hidden" name="create_date" value="${o.create_date}">
                                                    <input type="hidden" name="pay_date" value="${o.pay_date}">
                                                    <input type="hidden" name="delivery_date" value="${o.delivery_date}">
                                                    <input type="hidden" name="pay_date" value="${o.pay_date}">

                                                    <%-- 更改表单状态 --%>
                                                        <c:if test="${o.status=='waitDelivery'}">
                                                            <a href="orderDelivery?order_id=${o.id}">
                                                                <button class="btn btn-primary btn-xs">发货</button>
                                                            </a>
                                                        </c:if>
                                                    <%--<select name="status" class="form-control">--%>
                                                        <%--<option>待付款</option>--%>
                                                        <%--<option>已发货</option>--%>
                                                        <%--<option>订单完成</option>--%>
                                                    <%--</select>--%>
                                                    <%--<input type="submit" class="form-control" value="提交">--%>
                                                <%--</form>--%>
                                            </td>
                                        </tr>
                                    </c:forEach>
                                    </tbody>
                                </table>
                            </div>

                        </div>
                    </div>
                    <!--End Advanced Tables -->
                </div>
            </div>

        </div>
    </div>
    <!-- /. PAGE WRAPPER  -->
</div>
<!-- /. WRAPPER  -->
<!-- JS Scripts-->
<!-- jQuery Js -->
<script src="../assets/js/jquery-1.10.2.js"></script>
<!-- Bootstrap Js -->
<script src="../assets/js/bootstrap.min.js"></script>
<!-- Metis Menu Js -->
<script src="../assets/js/jquery.metisMenu.js"></script>
<!-- DATA TABLE SCRIPTS -->
<script src="../assets/js/dataTables/jquery.dataTables.js"></script>
<script src="../assets/js/dataTables/dataTables.bootstrap.js"></script>
<script>
    $(document).ready(function () {
        $('#dataTables-example').dataTable();
    });
</script>
<!-- Custom Js -->
<script src="../assets/js/custom-scripts.js"></script>


</body>
</html>
