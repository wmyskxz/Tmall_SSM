<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8" isELIgnored="false" %>

<%@include file="include/header.jsp" %>
<%@include file="include/top.jsp" %>
<%@include file="include/mini-search.jsp" %>
<style>
    div.reviewDiv {
        max-width: 1013px;
        margin: 10px auto;
    }

    div.reviewProductInfoImg {
        border: 1px solid #E7E7E7;
        width: 464px;
        text-align: center;
        float: left;
    }

    div.reviewProductInfoRightDiv {
        overflow: hidden;
        border-top: 1px solid #E7E7E7;
        padding: 30px 20px;
    }

    div.reviewProductInfoRightText {
        color: black;
        font-size: 16px;
        font-weight: bold;
    }

    table.reviewProductInfoTable {
        margin: 20px 10px;
        font-size: 12px;
    }

    table.reviewProductInfoTable td {
        padding-bottom: 5px;
        color: #999999;
    }

    span.reviewProductInfoTablePrice {
        color: #FF0036;
        font-size: 20px;
        font-weight: bold;
    }

    span.reviewProductInfoTableSellNumber {
        color: #FF0036;
        font-size: 14px;
        font-weight: bold;
    }

    div.reviewProductInfoRightBelowDiv {
        border: 1px solid #F6F5F3;
        background-color: #FDFBFA;
        height: 166px;
        padding: 16px 0px 16px 81px;
    }

    span.reviewProductInfoRightBelowImg {
        background-color: white;
        border: 1px solid #E1E1E1;
        display: inline-block;
        width: 23px;
        height: 42px;
        background-image: url(/img/fore/reviewLight.png);
        background-repeat: no-repeat;
        padding: 0px;
    }

    img {
        vertical-align: baseline;
    }

    span.reviewProductInfoRightBelowText {
        border: 1px solid #EFEFEF;
        display: inline-block;
        width: 200px;
        height: 42px;
        padding: 4px;
        position: relative;
        left: -4px;
        top: -5px;
        color: #666666;
        font-size: 12px;
    }

    div.reviewStasticsDiv {
        margin-top: 20px;
    }

    div.reviewStasticsLeft {
        width: 180px;
        float: left;
    }

    div.reviewStasticsLeftTop {
        background-color: #FF0036;
        height: 6px;
    }

    div.reviewStasticsLeftContent {
        line-height: 29px;
        border-left: 1px solid #D5D4D4;
        border-right: 1px solid #D5D4D4;
        background-color: #F6F5F1;
        text-align: center;
        font-size: 14px;
        color: #363535;
        font-weight: bold;
    }

    div.reviewStasticsLeftFoot {
        height: 6px;
        border-left: 1px solid #D5D4D4;
        border-bottom: 1px solid #D5D4D4;
        background-color: #F6F5F1;
    }

    span.reviewStasticsNumber {
        color: #284CA5;
    }

    div.reviewStasticsRight {
        overflow: hidden;
    }

    div.reviewStasticsRightEmpty {
        height: 35px;
    }

    div.reviewStasticsFoot {
        background-color: #F6F5F1;
        border: 1px solid #D5D4D4;
        border-left-width: 0px;
        height: 6px;
    }

    div.makeReviewDiv {
        border: 1px solid #D1CCC8;
        margin: 20px 0px;
        background-color: #EFEFEF;
    }

    div.makeReviewText {
        font-size: 16px;
        color: #333333;
        font-weight: bold;
        margin: 20px 40px;
    }

    table.makeReviewTable {
        margin: 20px 40px;
        font-size: 12px;
    }

    table.makeReviewTable td {
        border: 1px solid #E7E7E7;
        padding: 10px;
        background-color: white;
    }

    table.makeReviewTable textarea {
        border-width: 0px;
        resize: none;
        width: 420px;
        height: 120px;
    }

    td.makeReviewTableFirstTD {
        background-color: #F6F6F6;
    }

    div.makeReviewButtonDiv {
        background-color: white;
        text-align: center;
        padding: 15px;
    }

    div.makeReviewButtonDiv button {
        width: 72px;
        height: 26px;
        border-radius: 2px;
        background-color: #FF0036;
        color: white;
        border-width: 0px;
        font-weight: bold;
    }

    div.reviewDate {
        width: 100px;
    }

    div.reviewDivlistReviewsEach div {
        display: inline-block;
    }

    div.reviewDate {
        color: #CCCCDD;
    }

    div.reviewContent {
        color: #333333;
        width: 698px;
    }

    div.reviewUserInfo {
        color: #333333;
    }

    div.reviewDivlistReviewsEach {
        padding: 20px;
        border-bottom: 1px solid #ECECEC;
    }

    span.reviewUserInfoAnonymous {
        color: #CCCCDD;
        margin-left: 5px;
    }
</style>

<div class="reviewDiv">
    <div class="reviewProductInfoDiv">
        <div class="reviewProductInfoImg"><img width="400px" height="400px" src="img/product/${product.id}/1.jpg"></div>
        <div class="reviewProductInfoRightDiv">
            <div class="reviewProductInfoRightText">
                ${product.name}
            </div>
            <table class="reviewProductInfoTable">
                <tr>
                    <td width="75px">价格:</td>
                    <td><span class="reviewProductInfoTablePrice">￥${product.price}</span> 元</td>
                </tr>
                <tr>
                    <td>配送</td>
                    <td>快递: 0.00</td>
                </tr>
                <tr>
                    <td>月销量:</td>
                    <td><span class="reviewProductInfoTableSellNumber">${product.sale}</span> 件</td>
                </tr>
            </table>

            <div class="reviewProductInfoRightBelowDiv">
                <span class="reviewProductInfoRightBelowImg"><img src="img/fore/reviewLight.png"></span>
                <span class="reviewProductInfoRightBelowText"
                      style="margin-top: 2px;">现在查看的是 您所购买商品的信息于${order.create_date}下单购买了此商品 </span>
            </div>
        </div>
        <div style="clear:both"></div>
    </div>
    <div class="reviewStasticsDiv">
        <div class="reviewStasticsLeft">
            <div class="reviewStasticsLeftTop"></div>
            <div class="reviewStasticsLeftContent">累计评价 <span
                    class="reviewStasticsNumber"> ${product.reviewCount}</span></div>
            <div class="reviewStasticsLeftFoot"></div>
        </div>
        <div class="reviewStasticsRight">
            <div class="reviewStasticsRightEmpty"></div>
            <div class="reviewStasticsFoot"></div>
        </div>
    </div>

    <c:if test="${param.showonly==true}">
        <div class="reviewDivlistReviews">
            <c:forEach items="${reviews}" var="r">
                <div class="reviewDivlistReviewsEach">
                    <div class="reviewDate">${r.createDate}</div>
                    <div class="reviewContent">${r.content}</div>
                    <div class="reviewUserInfo pull-right">${r.user.anonymousName}<span class="reviewUserInfoAnonymous">(匿名)</span>
                    </div>
                </div>
            </c:forEach>
        </div>
    </c:if>

    <c:if test="${param.showonly!=true}">
        <div class="makeReviewDiv">
            <form method="post" action="doreview">
                <div class="makeReviewText">其他买家，需要你的建议哦！</div>
                <table class="makeReviewTable">
                    <tr>
                        <td class="makeReviewTableFirstTD">评价商品</td>
                        <td><textarea name="content"></textarea></td>
                    </tr>
                </table>
                <div class="makeReviewButtonDiv">
                    <input type="hidden" name="order_id" value="${order.id}">
                    <input type="hidden" name="product_id" value="${product.id}">
                    <button type="submit">提交评价</button>
                </div>
            </form>
        </div>
    </c:if>
</div>

<%@include file="include/footer.jsp"%>