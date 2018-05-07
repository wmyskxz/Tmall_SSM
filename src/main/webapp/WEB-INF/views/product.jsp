<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8" isELIgnored="false" %>


<%@include file="include/header.jsp" %>
<%@include file="include/top.jsp" %>
<%@include file="include/mini-search.jsp" %>

<style>
    .bigImg {
        width: 418px;
        height: 418px;
    }

    .smallImg {
        width: 56px !important;
        height: 56px;
        border: 2px solid white;
    }

    div.product {
        margin-top: 90px;
        /*	margin-left: 25%;*/
        /*margin-right: auto;
        margin-left: auto;*/
        position: relative;
        float: left;
        left: 50%;
    }

    div.imgAndInfo div.smallImageDiv {
        width: 80%;
        margin: 20px auto;
    }

    div.imgAndInfo img.smallImg:hover {
        border: 2px solid black;
    }

    div.imgAndInfo {
        width: 980px;
        height: 550px;
        display: inline-flex;
        position: relative;
        float: left;
        left: -50%;
    }

    div.imgInimgAndInfo {
        width: 420px;
        float: center;
    }

    div.imgInimgAndInfo img {
        width: 420px;
    }

    div.infoInimgAndInfo {
        padding: 0px 20px;
        overflow: hidden;
        width: 560px;
    }

    div.infoInimgAndInfo div.productTitle {
        color: black;
        font-size: 16px;
        font-weight: bold;
        margin: 0px 10px;
    }

    div.infoInimgAndInfo div.productSubTitle {
        color: #DD2727;
        font-size: 12px;
        margin: 0px 10px;
    }

    div.infoInimgAndInfo div.productPriceDiv {
        background-image: url(/img/fore/priceBackground.png);
        height: 85px;
        padding: 10px;
        color: #666666;
    }

    div.infoInimgAndInfo div.gouwujuanDiv {
        margin-top: 5px;
    }

    div.infoInimgAndInfo span.promotionPriceYuan {
        font-family: Arial;
        font-size: 18px;
        color: #FF0036;
    }

    div.infoInimgAndInfo span.promotionPrice {
        color: #FF0036;
        font-family: Arial;
        font-size: 30px;
        font-weight: bold;
    }

    div.infoInimgAndInfo span.promotionPriceDesc {
        color: #999999;
        display: inline-block;
        width: 68px;
        position: relative;
        left: 0px;
        top: -10px;
    }

    div.infoInimgAndInfo div.productSaleAndReviewNumber {
        margin: 20px 0px;
        border-top: 1px dotted #C9C9C9;
        border-bottom: 1px dotted #C9C9C9;
        padding: 10px;
    }

    div.infoInimgAndInfo div.productSaleAndReviewNumber div {
        display: inline-block;
        width: 49%;
        text-align: center;
        color: #999999;
        font-size: 12px;
    }

    div.infoInimgAndInfo div.productSaleAndReviewNumber div:first-child {
        border-right: 1px solid #E5DFDA;
    }

    div.infoInimgAndInfo div.productNumber {
        color: #999999;
    }

    div.infoInimgAndInfo span.productNumberSettingSpan {
        border: 1px solid #999;
        display: inline-block;
        width: 43px;
        height: 32px;
        padding-top: 7px;
    }

    div.infoInimgAndInfo input.productNumberSetting {
        border: 0px;
        height: 80%;
        width: 80%;
    }

    div.productNumber span.updown img {
        display: inline-block;
        vertical-align: top;
    }

    div.productNumber span.updown {
        border: 1px solid #999;
        display: block;
        width: 20px;
        height: 14px;
        text-align: center;
        padding-top: 4px;
    }

    div.productNumber span.updownMiddle {
        height: 4px;
        display: block;
    }

    div.productNumber span.arrow {
        display: inline-block;
        width: 22px;
        height: 32px;
        vertical-align: top;
    }

    div.serviceCommitment {
        margin: 20px 0px;
    }

    div.infoInimgAndInfo span.serviceCommitmentDesc {
        color: #999999;
    }

    div.infoInimgAndInfo span.serviceCommitmentLink a {
        color: #666666;
    }

    div.buyDiv {
        margin: 20px auto;
        text-align: center;
    }

    div.buyDiv button {
        display: inline-block;
        margin: 0px 10px;
        width: 180px;
        height: 40px;
    }

    button.buyButton {
        border: 1px solid #FF0036;
        background-color: #FFEDED;
        text-align: center;
        line-height: 40px;
        font-size: 16px;
        color: #FF0036;
    }

    button.addCartButton {
        border: 1px solid #FF0036;
        background-color: #FF0036;
        text-align: center;
        line-height: 40px;
        font-size: 16px;
        color: white;
    }

    button.addCartButton span.glyphicon {
        font-size: 12px;
        margin-right: 8px;
    }
</style>

<script>
    $(function () {
        $("img.smallImg").mouseenter(function () {
            var bigImgURL = $(this).attr("bigImgURL");
            $("img.bigImg").attr("src", bigImgURL);
        });

        var stock = ${product.stock};
        $(".productNumberSetting").keyup(function () {
            var num = $(".productNumberSetting").val();
            num = parseInt(num);
            if (isNaN(num))
                num = 1;
            if (num <= 0)
                num = 1;
            if (num > stock)
                num = stock;
            $(".productNumberSetting").val(num);
        });

        $(".increaseNumber").click(function () {
            var num = $(".productNumberSetting").val();
            num++;
            if (num > stock)
                num = stock;
            $(".productNumberSetting").val(num);
        });
        $(".decreaseNumber").click(function () {
            var num = $(".productNumberSetting").val();
            --num;
            if (num <= 0)
                num = 1;
            $(".productNumberSetting").val(num);
        });

        $("div.productReviewDiv").hide();
        $("a.productDetailTopReviewLink").click(function () {
            $("div.productReviewDiv").show();
            $("div.productDetailDiv").hide();
        });
        $("a.productReviewTopPartSelectedLink").click(function () {
            $("div.productReviewDiv").hide();
            $("div.productDetailDiv").show();
        });


        $(".addCartLink").click(function () {
            var page = "checkLogin";
            $.get(
                page,
                function (result) {
                    if ("success" == result) {
                        var product_id = ${product.id};
                        var num = $(".productNumberSetting").val();
                        var addCartpage = "/addCart";
                        $.get(
                            addCartpage,
                            {"product_id": product_id, "num": num},
                            function (result) {
                                if ("success" == result) {
                                    $(".addCartButton").html("已加入购物车");
                                    $(".addCartButton").attr("disabled", "disabled");
                                    $(".addCartButton").css("background-color", "lightgray");
                                    $(".addCartButton").css("border-color", "lightgray");
                                    $(".addCartButton").css("color", "black");
                                }
                                else {
                                }
                            }
                        );
                    }
                    else {
                        $("#loginModal").modal('show');
                    }
                }
            );
            return false;
        });
    });

</script>


<%--<div class="page">--%>
<%--<div id="hd" class="tb-shop">--%>
<%--<a href="#nowhere"><img style="height: 200px;" src="img/fore/hd.jpg" /></a>--%>
<%--</div>--%>
<%--<nav class="tb-shop-nav">--%>
<%--<a href="#nowhere"><span>全部商品分类</span></a><span> | </span>--%>
<%--<a href="#nowhere"><span>首页</span></a><span> | </span>--%>
<%--<a href="#nowhere"><span>荣耀</span></a><span> | </span>--%>
<%--<a href="#nowhere"><span>小米</span></a><span> | </span>--%>
<%--<a href="#nowhere"><span>华为</span></a><span> | </span>--%>
<%--<a href="#nowhere"><span>苹果</span></a><span> | </span>--%>
<%--<a href="#nowhere"><span>魅族</span></a><span> | </span>--%>
<%--<a href="#nowhere"><span>电信卡</span></a><span> | </span>--%>
<%--<a href="#nowhere"> <span>碎屏保</span></a>--%>
<%--</nav>--%>
<%--</div>--%>


<div class="product">
    <div class="imgAndInfo">
        <div class="imgInimgAndInfo">
            <img class="bigImg" src="img/product/${product.id}/1.jpg">
            <div class="smallImageDiv">
                <img class="smallImg" src="img/product/${product.id}/1.jpg" bigImgURL="img/product/${product.id}/1.jpg">
                <img class="smallImg" src="img/product/${product.id}/2.jpg" bigImgURL="img/product/${product.id}/2.jpg">
                <img class="smallImg" src="img/product/${product.id}/3.jpg" bigImgURL="img/product/${product.id}/3.jpg">
                <img class="smallImg" src="img/product/${product.id}/4.jpg" bigImgURL="img/product/${product.id}/4.jpg">
                <img class="smallImg" src="img/product/${product.id}/5.jpg" bigImgURL="img/product/${product.id}/5.jpg">
                <div class="img4load hidden"></div>
            </div>
        </div>

        <div class="infoInimgAndInfo">
            <div class="productTitle">
                ${product.name}
            </div>
            <div class="productSubTitle">
                ${product.sub_title}
            </div>
            <div class="productPrice">
                <div class="productPriceDiv">
                    <div class="gouwujuanDiv"><img src="img/fore/tmall-coupon.png">
                        <span> 全天猫实物商品通用</span>
                    </div>

                    <div class="promotionDiv">
                        <span class="promotionPriceDesc">价格</span>
                        <span class="promotionPriceYuan">¥</span>
                        <span class="promotionPrice">${product.price}</span>
                    </div>
                </div>
            </div>

            <div class="productSaleAndReviewNumber">
                <div>销量<span class="redColor boldWord">${product.sale}</span></div>
                <div>累计评价<span class="redColor boldWord">${product.reviewCount}</span></div>
            </div>
            <div class="productNumber">
                <span>数量</span>
                <span>
                <span class="productNumberSettingSpan">
                <input type="text" id="number" value="1" class="productNumberSetting">
                </span>
					<span class="arrow">
                    <a class="increaseNumber" href="#nowhere">
                    <span class="updown">
                       <img src="img/fore/increase.png">
                    </span>
					</a>
					<span class="updownMiddle"> </span>
					<a class="decreaseNumber" href="#nowhere">
						<span class="updown">
                        <img src="img/fore/decrease.png">
                    </span>
					</a>
					</span>
					件</span>
                <span>库存${product.stock}件</span>
            </div>
            <div class="serviceCommitment">
                <span class="serviceCommitmentDesc">服务承诺</span>
                <span class="serviceCommitmentLink">
                <a href="#nowhere">正品保证</a>
                <a href="#nowhere">极速退款</a>
                <a href="#nowhere">赠运费险</a>
                <a href="#nowhere">七天无理由退换</a>
            </span>
            </div>
            <script>
                <%--$(function () {--%>
                <%--$(".buyLink").click(function () {--%>
                <%--var url = "/buyone?product_id="+${product.id}+--%>
                <%--"&number=" + $("#number").text();--%>

                <%--});--%>
                <%--});--%>

                function buyLink() {
                    window.location = "/buyone?product_id="+${product.id}+
                    "&number=" + $("#number").val();
                }
            </script>
            <div class="buyDiv">
                <%--<c:set var="number" scope="page" value="${('#number').val()}"--%>
                <a onclick="javascript:buyLink()" class="buyLink">
                    <button class="buyButton">立即购买</button>
                </a>
                <a class="addCartLink" href="#nowhere">
                    <button class="addCartButton"><span class="glyphicon glyphicon-shopping-cart"></span>加入购物车</button>
                </a>
            </div>
        </div>
        <div style="clear:both"></div>
    </div>
</div>
<div style="clear: both;"></div>

<style>
    div.productDetailDiv {
        width: 790px;
        margin: 40px auto;
    }

    div.productDetailTopPart {
        border: 1px solid #DFDFDF;
        border-left-width: 0px;
    }

    a.selected {
        border-left: 1px solid #cfbfb1;
        border-right: 1px solid #cfbfb1;
        color: #FF0036;
        display: inline-block;
        font-weight: bold;
        line-height: 46px;
        width: 90px;
        text-align: center;
        position: relative;
    }

    a.selected:before {
        content: "";
        display: block;
        border-width: 1px;
        border-color: #FF0036;
        border-style: solid;
        width: 90px;
        height: 0;
        position: absolute;
        top: -1px;
        margin-left: -1px;
    }

    a.selected:after {
        content: "";
        display: block;
        border-color: #FF0036 transparent transparent;
        border-style: solid;
        border-width: 5px;
        width: 0;
        height: 0;
        position: absolute;
        top: -1px;
        left: 50%;
        margin-left: -5px;
    }

    a.productDetailTopReviewLink {
        padding: 0px 20px;
        border-right: 1px dotted #D2D2D2;
        color: #333333;
    }

    span.productDetailTopReviewLinkNumber {
        color: #3355B9;
    }

    div.productParamterPart {
        border: 1px solid #DFDFDF;
        padding: 40px;
    }

    div.productParamter {
        color: #999999;
        font-weight: bold;
        margin-bottom: 20px;
    }

    div.productParamterList span {
        display: block;
        width: 220px;
        float: left;
        padding: 8px 0px;
        color: #666666;
    }

    div.productDetailImagesPart img {
        display: block;
        width: 790px;
        margin: 20px 0px;
    }

    div.productReviewDiv {
        width: 790px;
        margin: 40px auto;
    }

    div.productReviewTopPart {
        border: 1px solid #DFDFDF;
    }

    a.productReviewTopPartSelectedLink {
        padding: 0px 20px;
        color: #333333;
    }

    div.productReviewContentPart {
        padding-top: 50px;
    }

    div.productReviewItem {
        border-bottom: 1px solid #E3E3E3;
        margin: 10px 0px;
    }

    div.productReviewContentPart {
        padding-top: 50px;
    }

    div.productReviewItem {
        border-bottom: 1px solid #E3E3E3;
        margin: 10px 0px;
    }

    div.productReviewItem div.productReviewItemDesc {
        width: 80%;
        display: inline-block;
        color: #333333;
        margin: 5px 20px;
        float: left;
    }

    div.productReviewItemDate {
        margin: 15px 0px 0px 0px;
        color: #CCCCCC;
    }

    div.productReviewItem div.productReviewItemUserInfo {
        color: #404040;
        margin: 5px 20px;
        padding: 20px 0;
    }

    span.userInfoGrayPart {
        color: #999999;
    }
</style>

<div class="productDetailDiv" style="display: block;">
    <div class="productDetailTopPart">
        <a class="productDetailTopPartSelectedLink selected" href="#nowhere">商品详情</a>
        <a class="productDetailTopReviewLink" href="#nowhere">累计评价 <span
                class="productDetailTopReviewLinkNumber">${product.reviewCount}</span> </a>
    </div>

    <div class="productParamterPart">
        <div class="productParamter">产品参数：</div>
        <div class="productParamterList">
            <c:forEach items="${propertyValues}" var="pvs">
                <span>${pvs.property.name}:${pvs.value}</span>
            </c:forEach>
        </div>
        <div style="clear:both"></div>
    </div>
    <div class="productDetailImagesPart">
        <img src="http://how2j.cn/tmall/img/productDetail/8626.jpg">
    </div>
</div>
<div style="clear:both"></div>
<div class="productReviewDiv" style="display: block;">
    <div class="productReviewTopPart">
        <div class="productReviewTopPart">
            <a class="productReviewTopPartSelectedLink" href="#nowhere">商品详情</a>
            <a class="selected" href="#nowhere">累计评价 <span
                    class="productReviewTopReviewLinkNumber">${product.reviewCount}</span> </a>
        </div>
        <div class="productReviewContentPart">
            <c:forEach items="${reviews}" var="r">
                <div class="productReviewItem">
                    <div class="productReviewItemDesc">
                        <div class="productReviewItemContent">
                                ${r.content}
                        </div>
                        <div class="productReviewItemDate">${r.createDate}</div>
                    </div>
                    <div class="productReviewItemUserInfo">
                            ${r.user.anonymousName}<span class="userInfoGrayPart">（匿名）</span>
                    </div>
                    <div style="clear:both"></div>
                </div>
            </c:forEach>
        </div>
    </div>
</div>

<%--<%@include file="productDetail.jsp" %>--%>

<%@include file="include/footer.jsp" %>