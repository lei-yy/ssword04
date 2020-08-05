<%--
  Created by IntelliJ IDEA.
  User: leiyangyang
  Date: 2020/8/3
  Time: 15:09
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<script type="text/javascript"
        src="https://cdn.bootcss.com/jquery/3.2.1/jquery.min.js"></script>
<head>
    <title>Title</title>
</head>
<body>
<button onclick="login()">登录</button>

</body>
</html>
<script>
    function login() {
        window.location.href="login.do";
    }
</script>