<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>图书</title>
</head>
<body>
<h1>图书借阅系统</h1>
<form action="dologin" method="post">
    <table>
        <tr>
            <td>登录账号:<input type="text" name="account" required></td>
        </tr>
        <tr>
            <td>登录密码:<input type="password" name="password" required></td>
        </tr>
        <tr>
            <td><input type="submit" value="登录"></td>
        </tr>
    </table>
</form>
<script src="js/jquery-1.12.4.js"></script>
<script>
    var message;

    function check() {
        var acc = $("[name=account]").val();
        var pass = $("[name=password]").val();
        if (acc.length != 7) {
            message = "账号长度为7";
            return false;
        } else if (pass.length != 6) {
            message = "密码长度为6";
            return false
        }
        return true;
    }

    $("form").submit(function () {
        if (!check()) {
            alert(message);
            return false;
        }
        return true;
    })
</script>
</body>
</html>
