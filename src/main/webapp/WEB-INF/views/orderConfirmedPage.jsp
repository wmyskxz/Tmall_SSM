<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8" isELIgnored="false"%>

<%@include file="include/header.jsp" %>
<%@include file="include/top.jsp" %>
<%@include file="include/mini-search.jsp" %>

<style>
    div.orderFinishDiv{
        border: 1px solid #E5E5E5;
        padding: 40px;
        max-width: 1013px;
        margin: 10px auto;
    }
    div.orderFinishDiv span{
        font-size: 14px;
        color: black;
        font-weight: bold;
        margin-left: 20px;
        padding-top: 20px;
    }
</style>

<div class="orderFinishDiv">
    <div class="orderFinishTextDiv">
        <img src="img/fore/orderFinish.png">
        <span>交易已经成功，卖家将收到您的货款。</span>
    </div>
</div>

<%@include file="include/footer.jsp" %>