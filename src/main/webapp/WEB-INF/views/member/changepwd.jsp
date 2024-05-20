<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%--
  Created by IntelliJ IDEA.
  User: user
  Date: 2024-05-20
  Time: 오후 5:11
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Title</title>
</head>
<body>
<main class="form-signin">
    <form action="/login/login" method="post" name="frmLogin">
        <h1 class="h3 mb-3 fw-normal">로그인</h1>

        <div class="form-floating">
            <input type="text" class="form-control" name="member_id" id="member_id" value="${cookie.saveId.value}" placeholder="name@example.com">
            <label for="member_id">아이디</label>
        </div>
        <div class="form-floating">
            <input type="password" class="form-control" name="password" id="password" placeholder="Password">
            <label for="password">비밀번호</label>
        </div>

        <div class="checkbox mb-3">
            <label>
                <input type="checkbox" name="auto" value="auto"> 자동 로그인
                &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                <input type="checkbox" name="save" value="save" <c:if test='${cookie.saveId.value != null}'>checked</c:if> > 아이디 저장
            </label>
        </div>
        <button class="w-100 btn btn-lg btn-primary"  type="submit">로그인</button>
        <br><br>
        <%--        <button class="w-100 btn btn-lg btn-secondary" type="button" onclick="location.href='/member/join'">회원가입</button>--%>
        <%--        <br><br>--%>
        <button class="w-100 btn btn-lg btn-secondary" type="button" onclick="location.href='/login/find'">패스워드 찾기</button>
    </form>

</main>
</body>
</html>
