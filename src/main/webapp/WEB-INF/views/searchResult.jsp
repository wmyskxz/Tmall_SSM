<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8" isELIgnored="false" %>

<%@include file="include/header.jsp" %>
<%@include file="include/top.jsp" %>
<%@include file="include/mini-search.jsp" %>


<style>
    div.searchProducts {
        margin-top: 80px;
        padding-left: 5px;
        padding-right: 5px;
    }

    .filter {
        boder-top: 1px solid #e5e5e5;
        margin: 10px 0;
        padding: 5px;
        position: relative;
        z-index: 10;
        background: #faf9f9;
        color: #806f66;
    }

    .fSort:hover, a.fSort-cur, a.fType-cur {
        color: #FF0036;
        background-color: #F1EDEC;
    }

    .fSort {
        display: inline-block;
        margin-left: -1px;
        overflow: hidden;
        padding: 0 15px 0 5px;
        float: left;
        height: 22px;
        line-height: 20px;
        border: 1px solid #CCCCCC;
        z-index: 10;
    }
</style>

<div class="workArea">
    <div class="searchProducts">
        <div class="filter">
            <a class="fSort"
               <c:if test="${'all'==param.sort||empty param.sort}">class="fSort-cur"</c:if>
               href="/sortProduct?sort=all&keyword=${param.keyword}">综合</a>
            <a class="fSort"
               <c:if test="${'reviewCount'==param.sort}">class="fSort-cur"</c:if>
               href="/sortProduct?sort=reviewCount&keyword=${param.keyword}">人气</a>
            <a class="fSort"
               <c:if test="${'date'==param.sort}">class="fSort-cur"</c:if>
               href="/sortProduct?sort=date&keyword=${param.keyword}">新品</a>
            <a class="fSort"
               <c:if test="${'sale'==param.sort}">class="fSort-cur"</c:if>
               href="/sortProduct?sort=sale&keyword=${param.keyword}">销量</a>
            <a class="fSort"
               <c:if test="${'price'==param.sort}">class="fSort-cur"</c:if>
               href="/sortProduct?sort=price&keyword=${param.keyword}">价格</a>
        </div>
        <div style="clear: both;"></div>


        <%--<style>--%>
        <%--.grid {--%>
        <%--margin-left: 13px;--%>
        <%--text-align: center;--%>
        <%--}--%>

        <%--.productItem {--%>
        <%--display: block;--%>
        <%--float: left;--%>
        <%--width: 233px;--%>
        <%--height: 300px;--%>
        <%--border: 1px solid #FFFFFF;--%>
        <%--}--%>

        <%--.productItem:hover {--%>
        <%--border: 1px solid #FF0036;--%>
        <%--}--%>

        <%--.floor-item-img {--%>
        <%--margin-top: 20px;--%>
        <%--position: relative;--%>
        <%--width: 185px;--%>
        <%--height: 185px;--%>
        <%--}--%>

        <%--.floor-item-title {--%>
        <%--width: 135px;--%>
        <%--height: 40px;--%>
        <%--font-size: 14px;--%>
        <%--color: #333333;--%>
        <%--line-height: 20px;--%>
        <%--overflow: hidden;--%>
        <%--margin: 8px auto;--%>
        <%--}--%>

        <%--.floor-price {--%>
        <%--font-size: 18px;--%>
        <%--color: #FF0036;--%>
        <%--line-height: 18px;--%>
        <%--margin: 10px auto;--%>
        <%--}--%>
        <%--</style>--%>
        <%--<c:forEach items="${products}" var="p" varStatus="st">--%>
        <%--<c:if test="${st.count<=5}">--%>
        <%--<a class="grid" href="showProduct?product_id=${p.id}">--%>
        <%--<div class="productItem">--%>
        <%--<img class="floor-item-img" src="img/product/${p.id}/1.jpg">--%>
        <%--<div class="floor-item-title">${p.name}</div>--%>
        <%--<div class="floor-price">${p.price}</div>--%>
        <%--</div>--%>
        <%--</a>--%>
        <%--</c:if>--%>
        <%--</c:forEach>--%>


        <%--<c:forEach items="${products}" var="p">--%>
        <%--<div class="productUnit" price="${p.price}">--%>
        <%--<a href="foreproduct?pid=${p.id}">--%>
        <%--<img class="productImage" src="img/product/${p.id}/1.jpg">--%>
        <%--</a>--%>
        <%--<span class="productPrice">¥<fmt:formatNumber type="number" value="${p.price}"--%>
        <%--minFractionDigits="2"/></span>--%>
        <%--<a class="productLink" href="foreproduct?pid=${p.id}">--%>
        <%--${fn:substring(p.name, 0, 50)}--%>
        <%--</a>--%>

        <%--<a class="tmallLink" href="foreproduct?pid=${p.id}">天猫专卖</a>--%>

        <%--<div class="productInfo">--%>
        <%--<span class="monthDeal ">月成交 <span class="productDealNumber">${p.sale}笔</span></span>--%>
        <%--<span class="productReview">评价<span class="productReviewNumber">${p.reviewCount}</span></span>--%>
        <%--<span class="wangwang"><img src="img/site/wangwang.png"></span>--%>
        <%--</div>--%>

        <%--</div>--%>
        <%--</c:forEach>--%>


        <style>
            .product {
                margin-top: 40px;
                margin-right: 20px;
                margin-bottom: 20px;
                width: 220px;
                height: 290px;
                position: relative;
                float: left;
                padding: 0;
                /*margin: 0 0 20px;*/
                line-height: 1.5;
                overflow: visible;
                z-index: 1;
            }

            .product-hover .product-iWrap, .product:hover .product-iWrap {
                height: auto;
                margin: -3px;
                border: 4px solid #ff0036;
                border-radius: 0;
                -webkit-transition: border-color .2s ease-in;
                -moz-transition: border-color .2s ease-in;
                -ms-transition: border-color .2s ease-in;
                -o-transition: border-color .2s ease-in;
                transition: border-color .2s ease-in;
            }

            .product:hover {
                overflow: visible;
                z-index: 3;
                background: #fff;
            }

            .product-iWrap {
                min-height: 98%;
                width: 210px;
                position: absolute;
                background-color: #fff;
                margin: 0;
                padding: 4px 4px 0;
                font-size: 12px;
                border: 1px solid #f5f5f5;
                border-radius: 3px;
            }

            .productImg-wrap a, .productImg-wrap img {
                max-width: 100%;
                max-height: 210px;
            }

            .productPrice {
                font-family: arial, verdana, sans-serif !important;
                color: #ff0036;
                font-size: 14px;
                height: 30px;
                line-height: 30px;
                margin: 0 0 5px;
                letter-spacing: normal;
                overflow: inherit !important;
                white-space: nowrap;
            }

            .productPrice em {
                float: left;
                font-family: arial;
                font-weight: 400;
                font-size: 20px;
                color: #ff0036;
            }

            .productPrice em b {
                margin-right: 2px;
                font-weight: 700;
                font-size: 14px;
                vertical-align: middle;
            }

            .productTitle {
                display: block;
                color: #666;
                height: 14px;
                line-height: 12px;
                margin-bottom: 3px;
                word-break: break-all;
                position: relative;
                overflow: hidden;

            }

            .productTitle a {
                color: #333;
                font-family: 微软雅黑;
                line-height: 14px;
                font-size: 12px;
            }

            .productStatus {
                position: relative;
                height: 33px;
                border: none;
                border-top: 1px solid #eee;
                margin-bottom: 0;
                color: #999;
                display: block;
                overflow: hidden;
            }

            .productStatus em {
                color: #b57c5b;
            }

            .productStatus a, .productStatus em {
                margin-top: -8px;
                font-family: arial;
                font-size: 12px;
                font-weight: 700;
            }

            em {
                font-style: normal;
            }

            .productStatus span {
                float: left;
                display: inline-block;
                border-right: 1px solid #eee;
                width: 39%;
                padding: 10px 1px;
                margin-right: 6px;
                line-height: 12px;
                text-align: left;
                white-space: nowrap;
            }

            .productStatus a {
                color: #38b;
            }

            .productStatus .ww-light {
                border-right: none;
                width: 11%;
                text-align: center;
            }

            .productStatus .ww-light a {
                background: url(/img/fore/ww-online.png) center center no-repeat !important;
                background-size: 16px !important;
                position: relative;
                width: 16px;
                height: 16px;
                margin-top: -3px;
                overflow: hidden;
                display: inline-block;
                vertical-align: text-bottom;
            }
        </style>


        <c:forEach items="${products}" var="p">
            <div class="product">
                <div class="product-iWrap">
                    <div class="productImg-wrap">
                        <a class="productImg" href="/showProduct?product_id=${p.id}">
                            <img src="/img/product/${p.id}/1.jpg">
                        </a>
                    </div>
                    <div style="clear: both;"></div>
                    <p class="productPrice">
                        <em title="${p.price}">
                            <b>￥</b>${p.price}
                        </em>
                    </p>
                    <div style="clear: both;"></div>
                    <p class="productTitle">
                        <a href="/showProduct?product_id=${p.id}">${p.name}</a>
                    </p>
                    <p class="productStatus">
                        <span>销量<em>${p.sale}</em></span>
                        <span>评价<a href="#nowhere">${p.reviewCount}</a></span>
                        <span class="ww-light"><a></a></span>
                    </p>
                </div>
            </div>
        </c:forEach>


        <style>
            .nrt {
                background: url(/img/fore/no-product.png) 35px center no-repeat #fff8f6;
                color: #595959;
                margin-bottom: 10px;
                padding: 20px 0 20px 123px;
                line-height: 27px;
                font-size: 14px;
                border: 1px solid #F7EAE7;
                margin-top: 25px;
            }
        </style>

        <c:if test="${empty products}">
            <div class="nrt">
                <p>
                    喵~没找到与
                    <em>" ${param.keyword} "</em>
                    相关的商品哦。
                </p>
            </div>
        </c:if>
        <div style="clear:both"></div>
    </div>
</div>

<%@include file="include/footer.jsp" %>