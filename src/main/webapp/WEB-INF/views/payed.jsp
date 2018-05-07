<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8" isELIgnored="false" %>

<%@include file="include/header.jsp" %>
<%@include file="include/top.jsp" %>
<%@include file="include/mini-search.jsp" %>

<style>
    div.payedDiv{
        border: 1px solid #D4D4D4;
        max-width: 1013px;
        margin: 10px auto 20px auto;
    }
    div.payedTextDiv{
        height: 61px;
        background-color: #ECFFDC;
        padding: 17px 0px 0px 25px;
    }
    div.payedTextDiv span{
        font-weight: bold;
        font-size: 14px;
        margin-left: 10px;
    }
    div.payedAddressInfo{
        padding: 26px 35px;
    }
    div.payedAddressInfo li{
        background-image:url(/img/fore/li_dot.png);
        background-repeat: no-repeat;
        background-color: transparent;
        background-attachment: scroll;
        background-position: 0px 13px;
        list-style-type: none;
        color: #333333;
        padding-left: 15px;
        padding-top: 5px;
    }
    span.payedInfoPrice{
        color: #B10000;
        font-weight: bold;
        font-size: 14px;
        font-family: arial;
    }
    div.paedCheckLinkDiv{
        margin-left: 38px;
    }
    a.payedCheckLink{
        color: #2D8CBA;
    }
    a.payedCheckLink:hover{
        color: #2D8CBA;
        text-decoration: underline;
    }
    div.payedSeperateLine{
        border-top: 1px dotted #D4D4D4;
        margin: 0px 31px;
    }
    div.warningDiv{
        margin: 23px 45px;
        color:black;
    }
</style>

<div class="payedDiv">
    <div class="payedTextDiv">
        <img src="img/fore/paySuccess.png">
        <span>您已成功付款</span>

    </div>
    <div class="payedAddressInfo">
        <ul>
            <li>收货地址：${o.address} ${o.receiver} ${o.mobile }</li>
            <li>实付款：<span class="payedInfoPrice">
            ￥${param.total}
            </li>
            <li>预计02月31日送达    </li>
        </ul>

        <div class="paedCheckLinkDiv">
            您可以
            <a class="payedCheckLink" href="bought">查看已买到的宝贝</a>
            <a class="payedCheckLink" href="bought">查看交易详情 </a>
        </div>

    </div>

    <div class="payedSeperateLine">
    </div>

    <div class="warningDiv">
        <img src="img/fore/warning.png">
        <b>安全提醒：</b>下单后，<span class="redColor boldWord">用QQ给您发送链接办理退款的都是骗子！</span>天猫不存在系统升级，订单异常等问题，谨防假冒客服电话诈骗！
    </div>

</div>

