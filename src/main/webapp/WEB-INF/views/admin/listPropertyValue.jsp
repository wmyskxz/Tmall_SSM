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
                    <a class="active-menu" href="listCategory"><i class="fa fa-bars"></i> 分类管理</a>
                </li>
                <li>
                    <a href="listUser"><i class="fa fa-user"></i> 用户管理</a>
                </li>
                <li>
                    <a href="listOrder"><i class="fa fa-list-alt"></i> 订单管理</a>
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
                        分类管理
                        <small> - ${product.name} - 属性值管理</small>
                    </h1>
                </div>
            </div>

            <div class="row">
                <div class="col-md-3">
                    <a href="javascript:history.back()" class="btn btn-success">返回上一页</a>
                </div>
            </div>
            <br>

            <div class="row">
                <div class="col-md-12">
                    <!-- Advanced Tables -->
                    <div class="panel panel-default">
                        <div class="panel-heading">
                            属性值管理表
                        </div>
                        <div class="panel-body">
                            <div class="table-responsive">
                                <table class="table table-striped table-bordered table-hover" id="dataTables-example">
                                    <thead>
                                    <tr>
                                        <th>属性值名称</th>
                                        <th>属性值</th>
                                        <th>编辑属性值</th>
                                        <th>删除属性值</th>
                                    </tr>
                                    </thead>
                                    <tbody>
                                    <c:forEach items="${propertyValues}" var="pv">
                                        <%--<c:forEach items="${properties}" var="p" end="exitId">--%>
                                        <%--<c:if test="${pv.property_id==p.id}">--%>
                                        <tr>
                                            <td>${pv.property.name}</td>
                                            <td>${pv.value}</td>
                                            <td><a href="editPropertyValue?id=${pv.id}"><span
                                                    class="glyphicon glyphicon-edit"></span></a></td>
                                            <td>
                                                <a href="deletePropertyValue?id=${pv.id}&category_id=${product.category_id}"><span
                                                        class="glyphicon glyphicon-trash"></span></a></td>
                                        </tr>
                                        <%--</c:if>--%>
                                        <%--</c:forEach>--%>
                                    </c:forEach>
                                    <%--<c:forEach items="${propertyValues}" var="pv">--%>
                                    <%--<tr>--%>
                                    <%--<td>--%>
                                    <%--<c:forEach items="${properties}" var="p">--%>
                                    <%--<c:if test="${pv.product_id==product.id&&pv.property_id==p.id}">${p.name}</c:if>--%>
                                    <%--</c:forEach>--%>
                                    <%--</td>--%>
                                    <%--<td>${pv.value}</td>--%>
                                    <%--<td><a href="editPropertyValue?id=${pv.id}"><span--%>
                                    <%--class="glyphicon glyphicon-edit"></span></a></td>--%>
                                    <%--<td>--%>
                                    <%--<a href="deletePropertyValue?id=${pv.id}&category_id=${product.category_id}"><span--%>
                                    <%--class="glyphicon glyphicon-trash"></span></a></td>--%>
                                    <%--</tr>--%>
                                    <%--</c:forEach>--%>
                                    </tbody>
                                </table>
                            </div>

                        </div>
                    </div>
                    <!--End Advanced Tables -->
                </div>
            </div>

            <%-- 属性增加表单 --%>
            <div class="row">
                <div class="col-md-4"></div>
                <div class="col-md-4">
                    <div class="panel panel-primary">
                        <div class="panel-heading">
                            增加属性值
                        </div>
                        <div class="panel-body">
                            <form action="addPropertyValue" role="form" name="addPropertyValueForm">
                                <input type="hidden" name="id" value="">
                                <input type="hidden" name="product_id" value="${product.id}">
                                <label>属性名称：</label>
                                <select class="form-control"
                                        onchange="document.addPropertyValueForm.property_id.value=this.value">
                                    <c:forEach var="p" items="${properties}">
                                        <option value="${p.id}">${p.name}</option>
                                    </c:forEach>
                                </select>
                                <input type="hidden" name="property_id" value="">
                                <label>属性值：</label>
                                <input type="text" name="value" class="form-control" placeholder="请在这里输入属性值"><br>
                                <input type="submit" class="btn btn-default pull-right" value="添加">
                            </form>
                        </div>
                    </div>
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
