<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8" isELIgnored="false" %>
<%@include file="include/header.jsp" %>
<%@include file="include/top.jsp" %>
<%@include file="include/mini-search.jsp" %>

<style>
    .page {
        width: 990px;
        margin: 90px auto;
        color: #3c3c3c;
        font: 400 12px/1.6 arial, 'Hiragino Sans GB', 宋体, sans-serif;
    }

    .content {
        border-top: 2px solid #e6e6e6;
        padding: 50px 0;
    }

    .form-main-list {
        width: 720px;
    }

    .form-list {
        margin: 0 auto;
        font-size: 14px;
    }

    .form-group {
        padding: 10px 0;
    }

    .form-item input {
        float: left;
        width: 300px;
        border: 1px solid #dedede;
        height: 37px;
        line-height: 37px;
        padding: 9px;
        font-size: 14px;
        _margin-left: -3px;
    }

    .registerSuccessMessage {
        width: 300px;
        margin: 20px auto;
        text-align: center;
    }
</style>
<%--<div class="page">--%>
    <%--<div class="content">--%>
        <%--<div class="form-list form-main-list">--%>
            <%--<div class="form-group">--%>

            <%--</div>--%>
        <%--</div>--%>
    <%--</div>--%>
<%--</div>--%>
<div style="margin-top: 90px;height: 0;"></div>
<div class="registerSuccessMessage">
    <div class="alert alert-success">
        <span class="glyphicon glyphicon-ok-sign"></span>
        恭喜注册成功
    </div>
</div>
<%@include file="include/footer.jsp" %>
