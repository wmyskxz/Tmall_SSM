<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8" isELIgnored="false" %>


<%-- 顶部导航栏 --%>
<nav id="site-nav" role="navigation">
    <div class="workArea">

        <%-- 导航栏左半部分
         如果取不到用户信息则显示如下： --%>
        <c:if test="${empty sessionScope.user}">
            <span>喵，欢迎来天猫</span>
            <span><a href="/loginPage">请登录</a></span>
            <span><a href="/registerPage">免费注册</a></span>
        </c:if>
        <%-- 如果用户成功登录，则显示如下： --%>
        <c:if test="${!empty sessionScope.user}">
            <span>Hi，${sessionScope.user.name}</span>
            <span><a href="nowhere">积分 <strong>1251</strong></a></span>
            <span><a href="/logout">退出</a></span>
        </c:if>


        <%-- 导航栏右半部分：
             使用Bootstrap的pull-right类 --%>
        <span class="pull-right">
            <a href="bought">我的订单</a>
            <a href="cart">
                <span class="glyphicon glyphicon-shopping-cart redColor"></span>
                购物车<strong id="cartTotalItemNumber">${cartTotalItemNumber}</strong>件
            </a>
        </span>
    </div>
</nav>
