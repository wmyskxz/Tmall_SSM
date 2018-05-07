<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8" isELIgnored="false" %>

<%@include file="include/header.jsp" %>
<%@include file="include/top.jsp" %>
<%@include file="include/mini-search.jsp" %>
<style>
    div.cartDiv {
        max-width: 1013px;
        margin: 10px auto;
        color: black;
    }

    table.cartProductTable {
        width: 100%;
        font-size: 12px;
    }

    tr.cartProductItemTR {
        border: 1px solid #CCCCCC;
    }

    tr.cartProductItemTR td {
        padding: 20px 20px;
    }

    table.cartProductTable th {
        font-weight: normal;
        color: #3C3C3C;
        padding: 20px 20px;
    }

    img.cartProductImg {
        padding: 1px;
        border: 1px solid #EEEEEE;
        width: 80px;
        height: 80px;
    }

    table.cartProductTable th.selectAndImage {
        width: 140px;
    }

    table.cartProductTable th.operation {
        width: 30px;
    }

    div.cartProductLinkOutDiv {
        position: relative;
        height: 80px;
    }

    a.cartProductLink {
        color: #3C3C3C;
    }

    a.cartProductLink:hover {
        color: #FF0036;
        text-decoration: underline;
    }

    div.cartProductLinkInnerDiv {
        position: absolute;
        bottom: 0;
        height: 20px;
    }

    span.cartProductItemOringalPrice {
        text-decoration: line-through;
        color: #9C9C9C;
        display: block;
        font-weight: bold;
        font-size: 14px;
    }

    span.cartProductItemPromotionPrice {
        font-family: Arial;
        font-size: 14px;
        font-weight: bold;
        color: #FF0036;
    }

    div.cartProductChangeNumberDiv {
        border: solid 1px #E5E5E5;
        width: 80px;
    }

    div.cartProductChangeNumberDiv a {
        width: 14px;
        display: inline-block;
        text-align: center;
        color: black;
        text-decoration: none;
    }

    div.cartProductChangeNumberDiv input {
        border: solid 1px #AAAAAA;
        width: 42px;
        display: inline-block;
    }

    span.cartProductItemSmallSumPrice {
        font-family: Arial;
        font-size: 14px;
        font-weight: bold;
        color: #FF0036;
    }

    img.cartProductItemIfSelected, img.selectAllItem {
        cursor: pointer;
    }

    div.cartDiv {
        max-width: 1013px;
        margin: 10px auto;
        color: black;
    }

    div.cartTitle button {
        background-color: #AAAAAA;
        border: 1px solid #AAAAAA;
        color: white;
        width: 53px;
        height: 25px;
        border-radius: 2px;
    }

    span.cartTitlePrice {
        color: #C40000;
        font-size: 14px;
        font-weight: bold;
        margin-left: 5px;
        margin-right: 3px;
    }

    div.cartFoot {
        background-color: #E5E5E5;
        line-height: 50px;
        margin: 20px 0px;
        color: black;
        padding-left: 20px;
    }

    div.cartFoot button {
        background-color: #AAAAAA;
        border: 0px solid #AAAAAA;
        color: white;
        width: 120px;
        height: 50px;
        font-size: 20px;
        text-align: center;
    }

    img.cartProductItemIfSelected, img.selectAllItem {
        cursor: pointer;
    }

    span.cartSumNumber {
        color: #C40000;
        font-weight: bold;
        font-size: 16px;
    }

    span.cartSumPrice {
        color: #C40000;
        font-weight: bold;
        font-size: 20px;
    }
</style>

<script>
    function formatMoney(num) {
        num = num.toString().replace(/\$|\,/g, '');
        if (isNaN(num))
            num = "0";
        sign = (num == (num = Math.abs(num)));
        num = Math.floor(num * 100 + 0.50000000001);
        cents = num % 100;
        num = Math.floor(num / 100).toString();
        if (cents < 10)
            cents = "0" + cents;
        for (var i = 0; i < Math.floor((num.length - (1 + i)) / 3); i++)
            num = num.substring(0, num.length - (4 * i + 3)) + ',' +
                num.substring(num.length - (4 * i + 3));
        return (((sign) ? '' : '-') + num + '.' + cents);
    }

    var deleteOrderItem = false;
    var deleteOrderItemid = 0;
    $(function () {

        $("a.deleteOrderItem").click(function () {
            deleteOrderItem = false;
            var orderItemId = $(this).attr("orderItemId")
            deleteOrderItemid = orderItemId;
            $("#deleteConfirmModal").modal('show');
        });
        $("button.deleteConfirmButton").click(function () {
            deleteOrderItem = true;
            $("#deleteConfirmModal").modal('hide');
        });

        $('#deleteConfirmModal').on('hidden.bs.modal', function (e) {
            if (deleteOrderItem) {
                var page = "deleteOrderItem";
                $.post(
                    page,
                    {"orderItemId": deleteOrderItemid},
                    function (result) {
                        if ("success" == result) {
                            $("tr.cartProductItemTR[orderItemId=" + deleteOrderItemid + "]").hide();
                        }
                        else {
                            location.href = "loginPage";
                        }
                    }
                );

            }
        })

        $("img.cartProductItemIfSelected").click(function () {
            var selectit = $(this).attr("selectit")
            if ("selectit" == selectit) {
                $(this).attr("src", "img/fore/cartNotSelected.png");
                $(this).attr("selectit", "false")
                $(this).parents("tr.cartProductItemTR").css("background-color", "#fff");
            }
            else {
                $(this).attr("src", "img/fore/cartSelected.png");
                $(this).attr("selectit", "selectit")
                $(this).parents("tr.cartProductItemTR").css("background-color", "#FFF8E1");
            }
            syncSelect();
            syncCreateOrderButton();
            calcCartSumPriceAndNumber();
        });
        $("img.selectAllItem").click(function () {
            var selectit = $(this).attr("selectit")
            if ("selectit" == selectit) {
                $("img.selectAllItem").attr("src", "img/fore/cartNotSelected.png");
                $("img.selectAllItem").attr("selectit", "false")
                $(".cartProductItemIfSelected").each(function () {
                    $(this).attr("src", "img/fore/cartNotSelected.png");
                    $(this).attr("selectit", "false");
                    $(this).parents("tr.cartProductItemTR").css("background-color", "#fff");
                });
            }
            else {
                $("img.selectAllItem").attr("src", "img/fore/cartSelected.png");
                $("img.selectAllItem").attr("selectit", "selectit")
                $(".cartProductItemIfSelected").each(function () {
                    $(this).attr("src", "img/fore/cartSelected.png");
                    $(this).attr("selectit", "selectit");
                    $(this).parents("tr.cartProductItemTR").css("background-color", "#FFF8E1");
                });
            }
            syncCreateOrderButton();
            calcCartSumPriceAndNumber();

        });

        $(".orderItemNumberSetting").keyup(function () {
            var product_id = $(this).attr("product_id");
            var stock = $("span.orderItemStock[product_id=" + product_id + "]").text();
            var price = $("span.orderItemPromotePrice[product_id=" + product_id + "]").text();

            var num = $(".orderItemNumberSetting[product_id=" + product_id + "]").val();
            num = parseInt(num);
            if (isNaN(num))
                num = 1;
            if (num <= 0)
                num = 1;
            if (num > stock)
                num = stock;

            syncPrice(product_id, num, price);
        });

        $(".numberPlus").click(function () {

            var product_id = $(this).attr("product_id");
            var stock = $("span.orderItemStock[product_id=" + product_id + "]").text();
            var price = $("span.orderItemPromotePrice[product_id=" + product_id + "]").text();
            var num = $(".orderItemNumberSetting[product_id=" + product_id + "]").val();

            num++;
            if (num > stock)
                num = stock;
            syncPrice(product_id, num, price);
        });
        $(".numberMinus").click(function () {
            var product_id = $(this).attr("product_id");
            var stock = $("span.orderItemStock[product_id=" + product_id + "]").text();
            var price = $("span.orderItemPromotePrice[product_id=" + product_id + "]").text();

            var num = $(".orderItemNumberSetting[product_id=" + product_id + "]").val();
            --num;
            if (num <= 0)
                num = 1;
            syncPrice(product_id, num, price);
        });

        $("button.createOrderButton").click(function () {
            var params = "";
            $(".cartProductItemIfSelected").each(function () {
                if ("selectit" == $(this).attr("selectit")) {
                    var orderItemId = $(this).attr("orderItemId");
                    params += "&orderItemId=" + orderItemId;
                }
            });
            params = params.substring(1);
            location.href = "buy?" + params;
        });

    });

    function syncCreateOrderButton() {
        var selectAny = false;
        $(".cartProductItemIfSelected").each(function () {
            if ("selectit" == $(this).attr("selectit")) {
                selectAny = true;
            }
        });

        if (selectAny) {
            $("button.createOrderButton").css("background-color", "#C40000");
            $("button.createOrderButton").removeAttr("disabled");
        }
        else {
            $("button.createOrderButton").css("background-color", "#AAAAAA");
            $("button.createOrderButton").attr("disabled", "disabled");
        }

    }

    function syncSelect() {
        var selectAll = true;
        $(".cartProductItemIfSelected").each(function () {
            if ("false" == $(this).attr("selectit")) {
                selectAll = false;
            }
        });

        if (selectAll)
            $("img.selectAllItem").attr("src", "img/fore/cartSelected.png");
        else
            $("img.selectAllItem").attr("src", "img/fore/cartNotSelected.png");

    }

    function calcCartSumPriceAndNumber() {
        var sum = 0;
        var totalNumber = 0;
        $("img.cartProductItemIfSelected[selectit='selectit']").each(function () {
            var orderItemId = $(this).attr("orderItemId");
            var price = $(".cartProductItemSmallSumPrice[orderItemId=" + orderItemId + "]").text();
            price = price.replace(/,/g, "");
            price = price.replace(/￥/g, "");
            sum += new Number(price);

            var num = $(".orderItemNumberSetting[orderItemId=" + orderItemId + "]").val();
            totalNumber += new Number(num);

        });

        $("span.cartSumPrice").html("￥" + formatMoney(sum));
        $("span.cartTitlePrice").html("￥" + formatMoney(sum));
        $("span.cartSumNumber").html(totalNumber);
    }

    function syncPrice(product_id, num, price) {
        $(".orderItemNumberSetting[product_id=" + product_id + "]").val(num);
        var cartProductItemSmallSumPrice = formatMoney(num * price);
        $(".cartProductItemSmallSumPrice[product_id=" + product_id + "]").html("￥" + cartProductItemSmallSumPrice);
        calcCartSumPriceAndNumber();

        var page = "changeOrderItem";
        $.post(
            page,
            {"product_id": product_id, "number": num},
            function (result) {
                if ("success" != result) {
                    location.href = "login.jsp";
                }
            }
        );
    }
</script>

<title>购物车</title>
<div class="cartDiv">
    <div class="cartTitle pull-right">
        <span>已选商品  (不含运费)</span>
        <span class="cartTitlePrice">￥0.00</span>
        <button class="createOrderButton" disabled="disabled">结 算</button>
    </div>

    <div class="cartProductList">
        <table class="cartProductTable">
            <thead>
            <tr>
                <th class="selectAndImage">
                    <img selectit="false" class="selectAllItem" src="img/fore/cartNotSelected.png">
                    全选

                </th>
                <th>商品信息</th>
                <th>单价</th>
                <th>数量</th>
                <th width="120px">金额</th>
                <th class="operation">操作</th>
            </tr>
            </thead>
            <tbody>
            <c:forEach items="${orderItems}" var="oi">
                <tr orderItemId="${oi.id}" class="cartProductItemTR">
                    <td>
                        <img selectit="false" orderItemId="${oi.id}" class="cartProductItemIfSelected"
                             src="img/fore/cartNotSelected.png">
                        <a style="display:none" href="#nowhere"><img src="img/fore/cartSelected.png"></a>
                        <img class="cartProductImg"
                             src="img/product/${oi.product.id}/1.jpg">
                    </td>
                    <td>
                        <div class="cartProductLinkOutDiv">
                            <a href="/showProduct?product_id=${oi.product.id}"
                               class="cartProductLink">${oi.product.name}</a>
                            <div class="cartProductLinkInnerDiv">
                                <img src="img/fore/creditcard.png" title="支持信用卡支付">
                                <img src="img/fore/7day.png" title="消费者保障服务,承诺7天退货">
                                <img src="img/fore/promise.png" title="消费者保障服务,承诺如实描述">
                            </div>
                        </div>

                    </td>
                    <td>
                        <span class="cartProductItemOringalPrice">￥${oi.product.price}</span>
                        <span class="cartProductItemPromotionPrice">￥${oi.product.price}</span>

                    </td>
                    <td>

                        <div class="cartProductChangeNumberDiv">
                            <span class="hidden orderItemStock " product_id="${oi.product.id}">${oi.product.stock}</span>
                            <span class="hidden orderItemPromotePrice "
                                  product_id="${oi.product.id}">${oi.product.price}</span>
                            <a product_id="${oi.product.id}" class="numberMinus" href="#nowhere">-</a>
                            <input product_id="${oi.product.id}" orderItemId="${oi.id}" class="orderItemNumberSetting"
                                   autocomplete="off" value="${oi.number}">
                            <a stock="${oi.product.stock}" product_id="${oi.product.id}" class="numberPlus"
                               href="#nowhere">+</a>
                        </div>

                    </td>
                    <td>
                            <span class="cartProductItemSmallSumPrice" orderItemId="${oi.id}" product_id="${oi.product.id}">
                                    ${oi.product.price*oi.number}
                            </span>

                    </td>
                    <td>
                        <a class="deleteOrderItem" orderItemId="${oi.id}" href="#nowhere">删除</a>
                    </td>
                </tr>
            </c:forEach>
            </tbody>

        </table>
    </div>

    <div class="cartFoot">
        <img selectit="false" class="selectAllItem" src="img/fore/cartNotSelected.png">
        <span>全选</span>
        <!--         <a href="#">删除</a> -->

        <div class="pull-right">
            <span>已选商品 <span class="cartSumNumber">0</span> 件</span>

            <span>合计 (不含运费): </span>
            <span class="cartSumPrice">￥0.00</span>
            <button class="createOrderButton" disabled="disabled">结 算</button>
        </div>

    </div>

</div>


<%@include file="include/footer.jsp" %>



