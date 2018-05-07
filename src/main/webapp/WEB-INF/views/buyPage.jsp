<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8" isELIgnored="false" %>

<%@include file="include/header.jsp" %>
<%@include file="include/top.jsp" %>


<style>
    div.buyPageDiv {
        margin: 20px auto;
        max-width: 1013px;
    }

    div.buyPageDiv button {
        display: inline-block;
        margin: 0px 10px;
        width: 180px;
        height: 40px;
    }

    div.buyDiv button {
        display: inline-block;
        margin: 0px 10px;
        width: 180px;
        height: 40px;
    }

    div.address {
        margin: 20px 5px;
        text-align: left;
    }

    div.addressTip, div.productListTip {
        color: #333333;
        font-size: 16px;
        font-weight: bold;
        text-align: left;
        margin-bottom: 30px;
    }

    table.addressTable {
        margin: 20px 20px;
        width: 600px;
    }

    table.addressTable td.firstColumn {
        width: 100px;
    }

    table.addressTable td {
        color: #333333;
        text-align: right;
        vertical-align: top;
        padding-right: 5px;
        text-align: left;
        height: 30px;
        font-size: 12px;
    }

    span.redStar {
        color: red;
        font-size: 8px;
    }

    table.addressTable td input {
        border: 1px solid #AFAFAF;
        width: 200px;
    }

    table.addressTable td textarea {
        border: 1px solid #AFAFAF;
        margin-bottom: 10px;
        width: 400px;
    }

    img.tmallbuy {
        width: 15px;
    }

    a.marketLink {
        color: black;
        font-size: 12px;
        font-weight: normal;
    }

    a.marketLink:hover {
        color: black;
        font-size: 12px;
        text-decoration: underline;
        font-weight: normal;
    }

    span.wangwangGif {
        display: inline-block;
        width: 25px;
        height: 25px;
        background-image: url(../../img/fore/wangwang.gif);
        background-repeat: no-repeat;
        background-color: transparent;
        background-attachment: scroll;
        background-position: -83px -0px;
        position: relative;
        top: 8px;
        left: 2px;
    }

    table.productListTable {
        width: 100%;
        border-collapse: separate;
    }

    table.productListTable th {
        color: #999999;
        font-weight: normal;
        font-size: 12px;
        text-align: center;
        padding-bottom: 5px;
    }

    th.productListTableFirstColumn {
        text-align: left !important;
    }

    table.productListTable tr.rowborder td {
        background-color: #b2d1ff;
        border-right: 2px solid #fff;
        height: 3px;
    }

    img.orderItemImg {
        width: 50px;
        height: 50px;
        border: 1px solid #E9E9E9;
    }

    tr.orderItemTR td {
        padding: 10px 0px;
    }

    a.orderItemProductLink {
        color: #666666;
        display: block;
    }

    a.orderItemProductLink:hover {
        color: #666666;
        text-decoration: underline;
    }

    td.orderItemProductInfo {
        text-align: left;
    }

    td.orderItemProductInfo img {
        height: 16px;
    }

    span.orderItemProductNumber {
        color: #000000;
    }

    tr.orderItemTR td {
        border-bottom: 1px solid #E5E5E5;
    }

    tbody.productListTableTbody td {
        text-align: center;
        font-size: 12px;
    }

    tbody.productListTableTbody td.orderItemFirstTD {
        text-align: left;
    }

    tbody.productListTableTbody td.orderItemProductInfo {
        text-align: left;
    }

    td.orderItemFirstTD, td.orderItemLastTD {
        border-bottom: 0px solid black !important;
    }

    label.orderItemDeliveryLabel {
        color: #666666;
        font-size: 12px;
        font-weight: normal;
    }

    div.orderItemSumDiv span {
        color: #999999;
    }

    div.orderItemSumDiv {
        padding: 20px;
        border-top: 2px solid #B4D0FF;
        background-color: #F2F6FF;
        height: 50px;
    }

    textarea.leaveMessageTextarea {
        border: 1px solid #FFAD35;
        width: 250px;
        height: 60px;
        resize: none;
    }

    span.leaveMessageText {
        display: inilne-block;
        margin-right: 10px;
        float: left;
    }

    span.leaveMessageTextareaSpan {
        display: inilne-block;
    }

    div.orderItemTotalSumDiv {
        margin: 40px;
        height: 40px;
    }

    div.orderItemTotalSumDiv span {
        color: #999999;
    }

    span.orderItemTotalSumSpan {
        color: #C40000 !important;
        font-size: 22px;
        font-weight: bold;
        border-bottom: 1px dotted #F2F6FF;
    }

    div.submitOrderDiv {
        height: 40px;
        margin: 20px 0px;
    }

    button.submitOrderButton {
        border: 1px solid #C40000;
        background-color: #C40000;
        text-align: center;
        line-height: 40px;
        font-size: 14px;
        font-weight: 700;
        color: white;
        float: right;
    }
</style>

<script>
    $(function () {
        $("a.productDetailTopReviewLink").click(function () {
            $("div.productReviewDiv").show();
            $("div.productDetailDiv").hide();
        });
        $("a.productReviewTopPartSelectedLink").click(function () {
            $("div.productReviewDiv").hide();
            $("div.productDetailDiv").show();
        });

        $("span.leaveMessageTextareaSpan").hide();
        $("img.leaveMessageImg").click(function () {

            $(this).hide();
            $("span.leaveMessageTextareaSpan").show();
            $("div.orderItemSumDiv").css("height", "100px");
        });

        $("div#footer a[href$=#nowhere]").click(function () {
            alert("模仿天猫的连接，并没有跳转到实际的页面");
        });


        $("a.wangwanglink").click(function () {
            alert("模仿旺旺的图标，并不会打开旺旺");
        });
        $("a.notImplementLink").click(function () {
            alert("这个功能没做，蛤蛤~");
        });
    });

</script>
<div class="buyPageDiv">
    <form action="createOrder" method="post">

        <div class="buyFlow">
            <img class="pull-left" src="img/fore/simpleLogo.png">
            <img class="pull-right" src="img/fore/buyflow.png">
            <div style="clear:both"></div>
        </div>
        <div class="address">
            <div class="addressTip">输入收货地址</div>
            <div>

                <table class="addressTable">
                    <tr>
                        <td class="firstColumn">详细地址<span class="redStar">*</span></td>

                        <td><textarea name="address" placeholder="建议您如实填写详细收货地址，例如接到名称，门牌好吗，楼层和房间号等信息"></textarea></td>
                    </tr>
                    <tr>
                        <td>邮政编码</td>
                        <td><input name="post" placeholder="如果您不清楚邮递区号，请填写000000" type="text"></td>
                    </tr>
                    <tr>
                        <td>收货人姓名<span class="redStar">*</span></td>
                        <td><input name="receiver" placeholder="长度不超过25个字符" type="text"></td>
                    </tr>
                    <tr>
                        <td>手机号码 <span class="redStar">*</span></td>
                        <td><input name="mobile" placeholder="请输入11位手机号码" type="text"></td>
                    </tr>
                </table>

            </div>

        </div>
        <div class="productList">
            <div class="productListTip">确认订单信息</div>


            <table class="productListTable">
                <thead>
                <tr>
                    <th colspan="2" class="productListTableFirstColumn">
                        <img class="tmallbuy" src="img/fore/tmallbuy.png">
                        <a class="marketLink" href="#nowhere">店铺：天猫店铺</a>
                        <a class="wangwanglink" href="#nowhere"> <span class="wangwangGif"></span></a>
                    </th>
                    <th>单价</th>
                    <th>数量</th>
                    <th>小计</th>
                    <th>配送方式</th>
                </tr>
                <tr class="rowborder">
                    <td colspan="2"></td>
                    <td></td>
                    <td></td>
                    <td></td>
                    <td></td>
                </tr>
                </thead>
                <tbody class="productListTableTbody">
                <c:forEach items="${orderItems}" var="oi" varStatus="st">
                    <tr class="orderItemTR">
                        <td class="orderItemFirstTD"><img class="orderItemImg" src="img/product/${oi.product_id}/1.jpg">
                        </td>
                        <td class="orderItemProductInfo">
                            <a href="foreproduct?pid=${oi.product_id}" class="orderItemProductLink">
                                    ${oi.product.name}
                            </a>

                            <img src="img/fore/creditcard.png" title="支持信用卡支付">
                            <img src="img/fore/7day.png" title="消费者保障服务,承诺7天退货">
                            <img src="img/fore/promise.png" title="消费者保障服务,承诺如实描述">

                        </td>
                        <td>

                                <%--<span class="orderItemProductPrice">￥<fmt:formatNumber type="number"--%>
                                <%--value="${oi.product.price}"--%>
                                <%--minFractionDigits="2"/></span>--%>
                            <span>${oi.product.price}</span>
                        </td>
                        <td>
                            <span class="orderItemProductNumber">${oi.number}</span>
                        </td>
                        <td>
                                <%--<span class="orderItemUnitSum">--%>
                                <%--￥<fmt:formatNumber type="number" value="${oi.product.price*oi.number}"--%>
                                <%--minFractionDigits="2"/>--%>
                                <%--</span>--%>
                            <span>${oi.product.price*oi.number}</span>
                        </td>
                        <c:if test="${st.count==1}">
                            <td rowspan="5" class="orderItemLastTD">
                                <label class="orderItemDeliveryLabel">
                                    <input type="radio" value="" checked="checked">
                                    普通配送
                                </label>

                                <select class="orderItemDeliverySelect" class="form-control">
                                    <option>快递 免邮费</option>
                                </select>

                            </td>
                        </c:if>

                    </tr>
                </c:forEach>

                </tbody>

            </table>
            <div class="orderItemSumDiv">
                <div class="pull-left">
                    <span class="leaveMessageText">给卖家留言:</span>
                    <span>
                        <img class="leaveMessageImg" src="img/fore/leaveMessage.png">
                    </span>
                    <span class="leaveMessageTextareaSpan">
					<textarea name="user_message" class="leaveMessageTextarea"></textarea>
					<div>
						<span>还可以输入200个字符</span>
					</div>
				</span>
                </div>

                <span class="pull-right">店铺合计(含运费): ￥${total}</span>
            </div>


        </div>

        <div class="orderItemTotalSumDiv">
            <div class="pull-right">
                <span>实付款：</span>
                <span class="orderItemTotalSumSpan">￥${total}</span>
            </div>
        </div>

        <div class="submitOrderDiv">
            <button type="submit" class="submitOrderButton">提交订单</button>
        </div>
    </form>
</div>

<%@include file="include/footer.jsp" %>
