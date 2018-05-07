<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8" isELIgnored="false" %>

<style>
    div.headerCon {
        width: auto;
        height: 120px;
        padding: 30px 0 0;
        margin: 0 auto;
        display: block;
    }

    div.fullSearchDiv {
        width: 550px;
        height: 40px;
        position: relative;
        padding: 1px;
        margin: 10px 25px 10px auto;
        right: -5px;
    }

    .searchFrom {
        background-color: #FF0036;
        width: 460px;
        padding: 1px;
        height: 40px;
        display: block;
    }

    .searchFrom input {
        width: 367px !important;
        padding: 5px 3px 5px 5px;
        border: 1px solid transparent;
        height: 34px;
        margin: 2px;
        font-size: 15px;
        outline: 0;
        /*position: relative;*/
    }

    button.searchButton {
        width: 80px;
        border: 1px solid transparent;
        background-color: #FF0036;
        color: white;
        height: 34px;
        font-size: 16px;
        font-weight: bold;
        cursor: pointer;
    }

    button.shopButton {
        width: 86px;
        border: 1px solid transparent;
        background-color: #333;
        color: white;
        height: 40px;
        font-size: 16px;
        font-weight: bold;
        cursor: pointer;
        position: absolute;
        margin: 1px auto;
        top: 0;
        right: 0;
    }

    div.searchBelow {
        margin-top: 3px;
        margin-left: -10px;
    }

    div.searchBelow span {
        color: #999;
    }

    div.searchBelow a {
        padding: 0px 10px 0px 10px;
        font-size: 14px;
    }

    div.searchBelow a:hover {
        color: #999;
        text-decoration: underline;
    }

    .logo {
        position: absolute;
        margin-left: 15px;
        top: 75px;
        z-index: 99;
    }

    .logo img {
        height: 30px;
        width: 145px;
    }
</style>

<!-- 搜索栏 -->
<div class="workArea">
    <div class="headerCon">
        <div class="logo">
            <a href="/home">
                <img src="img/fore/tmallLogo.png" id="logo">
            </a>
        </div>
        <div class="fullSearchDiv">
            <form class="searchFrom" action="searchProduct">
                <input type="text" value="${param.keyword}" placeholder="搜索 天猫 商品/品牌/店铺" name="keyword">
                <button class="searchButton" type="submit">搜天猫</button>
            </form>
            <div>
                <button class="shopButton" type="button">搜本店</button>
            </div>
            <div class="searchBelow">
				<span> <a href="#nowhere"> 手机 </a> <span>|</span>
				</span> <span> <a href="#nowhere"> 小米mix2s </a> <span>|</span>
				</span> <span> <a href="#nowhere"> 小米 </a> <span>|</span>
				</span> <span> <a href="#nowhere"> mix2s </a></span><span>|</span>
                </span> <span> <a href="#nowhere"> 小米6 </a></span><span>|</span>
                </span> <span> <a href="#nowhere"> 高通骁龙手机 </a></span><span>|</span>
                </span> <span> <a href="#nowhere"> 小米手机 </a></span>
            </div>
        </div>
    </div>
</div>
<div style="clear: both;"></div>