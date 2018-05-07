<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8" isELIgnored="false"%>

<%-- 首页搜索栏和Tmall图标 --%>
<div class="header">
    <div class="headerLayout workArea">

        <%-- 图片logo --%>
        <div class="logo">
            <a href="${context}">
                <img src="img/fore/tmall-logo.png">
            </a>
        </div>

        <%-- 搜索框 --%>
        <form class="mallSearch-input" action="/searchProduct">
            <input name="keyword" type="text" placeholder="搜索 天猫 商品/品牌/店铺">
            <button type="submit" class="searchButton">搜索</button>
            <ul class="hot-query">
                <li>
                    <a href="searchProduct?keyword=针织衫">针织衫</a>
                </li>
                <li class="hot-query-li">
                    <a href="">连衣裙</a>
                </li>
                <li class="hot-query-li">
                    <a href="">四件套</a>
                </li>
                <li class="hot-query-li">
                    <a href="">摄像头</a>
                </li>
                <li class="hot-query-li">
                    <a href="">客厅灯</a>
                </li>
                <li class="hot-query-li">
                    <a href="">口红</a>
                </li>
                <li class="hot-query-li">
                    <a href="">手机</a>
                </li>
                <li class="hot-query-li">
                    <a href="">运动鞋</a>
                </li>
                <li class="hot-query-li">
                    <a href="">牛奶</a>
                </li>
            </ul>
        </form>
    </div>
</div>

<div style="clear: both;"/>

<%-- 分类信息栏 --%>
<div class="main-nav">
    <div class="workArea">
        <span class="category-type">
            <span class="glyphicon glyphicon-th-list category-type-icon"></span>
            <span class="category-type-text">商品分类</span>
        </span>
        <span>
            <a href="">
                <img src="img/fore/tmall-shop.png">
            </a>
            <a href="">
                <img src="img/fore/tmall-international.png">
            </a>
            <c:forEach items="${links}" var="link">
                <a href="${link.link}">${link.text}</a>
            </c:forEach>
        </span>
    </div>
</div>