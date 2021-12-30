<%--
  Created by IntelliJ IDEA.
  User: Hyunbin
  Date: 2021-09-25
  Time: 오후 2:19
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <link rel="stylesheet"
          href="./resources/css/bootstrap.min.css">
    <title>Login</title>
</head>
<body>
    <jsp:include page="menu.jsp"/>
    <div class="jumbotron">
        <div class="container">
            <h1 class="display-3">로그인</h1>
        </div>
    </div>

    <div class="container" align="center">
        <div class="col-md-4 col-md-offset-4">
            <h3 class="form-signin-heading">Please sign in</h3>
            <%
                String error = request.getParameter("error");
                if (error != null){
                    out.println("<div class='alert-danger'>");
                    out.println("아이디와 비밀번호를 확인해주세요");
                    out.println("</div>");
                }
            %>
            <form class="form-signin" action="j_security_check" method="post">
                <div class="form-group">
                    <label for="inputUserName" class="sr-only">User Name</label>
                    <input id="inputUserName" type="text" class="form-control" placeholder="아이디" name="j_username" required autofocus>
                </div>
                <div class="form-group">
                    <label for="inputPassword" class="sr-only">Password</label>
                    <input id="inputPassword" type="password" class="form-control" placeholder="비밀번호" name="j_passowrd" required autofocus>
                </div>
                <button class="btn btn btn-lg btn-success btn-block" type="submit">로그인</button>
            </form>
        </div>
    </div>
</body>
</html>
