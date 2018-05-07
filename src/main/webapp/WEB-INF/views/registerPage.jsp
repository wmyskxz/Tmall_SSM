<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8" isELIgnored="false" %>
<%@include file="include/header.jsp" %>

<style>
    .page {
        width: 990px;
        margin: 0 auto;
        color: #3c3c3c;
        font: 400 12px/1.6 arial, 'Hiragino Sans GB', 宋体, sans-serif;
    }

    .page-top {
        height: 46px;
        border-bottom: 2px solid #e6e6e6;
        position: relative;
    }

    .active {
        position: relative;
        margin: 0 auto;
        width: 110px;
        border-bottom: 2px solid #ff4700;
        text-align: center;
    }

    .tsl {
        height: 46px;
        line-height: 46px;
        font-size: 16px;
        font-weight: 700;
        color: #3e3e3e;
    }

    .content {
        padding: 50px 0;
    }

    .form-main-list {
        width: 720px;
    }

    .form-list {
        margin: 0 auto;
        font-size: 14px;
    }

    .form-group {
        padding: 10px 0;
    }

    .form-item {
        padding: 10px 0 10px 260px;
        line-height: 36px;
        zoom: 1;
        height: 57px;
    }

    .form-item .form-label {
        display: inline;
        float: left;
        margin-left: -260px;
        width: 240px;
        height: 37px;
        line-height: 37px;
        text-align: right;
    }

    .form-item input {
        float: left;
        width: 300px;
        border: 1px solid #dedede;
        height: 37px;
        line-height: 37px;
        padding: 9px;
        font-size: 14px;
        _margin-left: -3px;
    }

    .btn-register {
        height: 36px;
        line-height: 36px;
        padding: 0 20px;
        color: #FFF;
        font-weight: 700;
        font-size: 16px;
        text-align: center;
        background: #ff0036;;
        border: 0;
        vertical-align: middle;
        border-radius: 3px;
        cursor: pointer;
        width: 300px;
    }

    .btn-register:hover {
        background-color: rgba(255, 0, 54, .8);
    }

    .registerErrorMessageDiv {
        width: 400px;
        margin: 0 auto;
        text-align: center;
    }
</style>
<script>
    $(function () {
        <c:if test="${!empty msg}">
        $("span.errorMessage").html("${msg}");
        $("div.registerErrorMessageDiv").show();
        </c:if>

        $("form.registerFrom").submit(function () {
            if (0 == $("#name").val().length || 0 == $("#password").val().length) {
                $("span.errorMessage").html("请输入账号密码");
                $("div.registerErrorMessageDiv").show();
                return false;
            }
            if (0 == $("#password-confirm").val().length || $("#password-confirm").val() != $("#password").val()) {
                $("span.errorMessage").html("请确认两次密码保持一致");
                $("div.registerErrorMessageDiv").show();
                return false;
            }
            return true;
        });

        $("form.registerFrom input").keyup(function () {
            $("div.registerErrorMessageDiv").hide();
        });
    })
</script>
<div class="page">
    <div class="page-top">
        <div class="active">
            <div class="tsl">用户注册</div>
        </div>
    </div>

    <div class="content">
        <form action="/register" method="post" class="registerFrom">
            <div class="form-list form-main-list">
                <div class="form-group">
                    <div class="form-item">
                        <span class="form-label tsl">用户账号</span>
                        <input type="text" id="name" name="name" value="${username}" placeholder="请在这里输入用户名">
                    </div>
                    <div class="form-item">
                        <span class="form-label tsl">用户密码</span>
                        <input type="password" id="password" name="password">
                    </div>
                    <div class="form-item">
                        <span class="form-label tsl">确认密码</span>
                        <input type="password" id="password-confirm" name="password-confirm">
                    </div>
                    <div class="form-item">
                        <button type="submit" class="btn-register">确认注册</button>
                    </div>
                    <div class="registerErrorMessageDiv" style="display: none;">
                        <div class="alert alert-danger">
                            <button type="button" class="close" data-dismiss="alert" aria-label="Close"></button>
                            <span class="errorMessage"></span>
                        </div>
                    </div>
                </div>
            </div>
        </form>
    </div>

</div>


</body>
</html>