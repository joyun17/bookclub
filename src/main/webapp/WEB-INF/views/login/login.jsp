<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%--
  Created by IntelliJ IDEA.
  User: user
  Date: 2024-05-13
  Time: 오후 4:12
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>

<!doctype html>
<html lang="ko">
<head>
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <meta name="description" content="">
    <meta name="author" content="Mark Otto, Jacob Thornton, 그리고 Bootstrap 기여자들">
    <meta name="generator" content="Hugo 0.88.1">
    <title>Signin Template · Bootstrap v5.1</title>

    <link rel="canonical" href="https://getbootstrap.kr/docs/5.1/examples/sign-in/">



    <!-- Bootstrap core CSS -->
<%--    <link href="/docs/5.1/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-1BmE4kWBq78iYhFldvKuhfTAU6auU8tT94WrHftjDbrCEXSU1oBoqyl2QvZ6jIW3" crossorigin="anonymous">--%>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-QWTKZyjpPEjISv5WaRU9OFeRpok6YctnYmDr5pNlyT2bRjXh0JMhjY6hW+ALEwIH" crossorigin="anonymous">
    <meta name="theme-color" content="#7952b3">


    <style>
        .bd-placeholder-img {
            font-size: 1.125rem;
            text-anchor: middle;
            -webkit-user-select: none;
            -moz-user-select: none;
            user-select: none;
        }

        @media (min-width: 768px) {
            .bd-placeholder-img-lg {
                font-size: 3.5rem;
            }
        }
        .form-signin {
            width: 400px;
            margin: 0 auto;
            padding-top: 150px;
            padding-bottom: 150px;
        }
        .form-floating {
            margin-top: 15px;
        }
    </style>


    <!-- Custom styles for this template -->
<%--    <link href="signin.css" rel="stylesheet">--%>
</head>
<body class="text-center">
<c:if test="${param.joinOK == '1'}">
    <script>
        alert("회원가입 성공! 로그인을 진행해주세요");
    </script>
</c:if>
<c:if test="${param.loginNO == '1'}">
    <script>
        alert("입력하신 아이디 또는 패스워드가 일치하지 않습니다.");
    </script>
</c:if>
<c:if test="${param.loginX == '1'}">
    <script>
        alert("5회 이상 로그인 실패로 잠금 처리된 아이디 입니다. 관리자에게 문의해주세요.");
    </script>
</c:if>
<c:if test="${param.newPwd != null}">
    <script>
        alert("새로운 비밀번호는 " + '${param.newPwd}' +  " 입니다.");
    </script>
</c:if>
<main class="form-signin">
    <form action="/login/login" method="post" name="frmLogin">
        <svg xmlns="http://www.w3.org/2000/svg" width="30" height="30" fill="currentColor" class="bi bi-emoji-sunglasses" viewBox="0 0 16 16">
            <path d="M4.968 9.75a.5.5 0 1 0-.866.5A4.5 4.5 0 0 0 8 12.5a4.5 4.5 0 0 0 3.898-2.25.5.5 0 1 0-.866-.5A3.5 3.5 0 0 1 8 11.5a3.5 3.5 0 0 1-3.032-1.75M7 5.116V5a1 1 0 0 0-1-1H3.28a1 1 0 0 0-.97 1.243l.311 1.242A2 2 0 0 0 4.561 8H5a2 2 0 0 0 1.994-1.839A3 3 0 0 1 8 6c.393 0 .74.064 1.006.161A2 2 0 0 0 11 8h.438a2 2 0 0 0 1.94-1.515l.311-1.242A1 1 0 0 0 12.72 4H10a1 1 0 0 0-1 1v.116A4.2 4.2 0 0 0 8 5c-.35 0-.69.04-1 .116"/>
            <path d="M16 8A8 8 0 1 1 0 8a8 8 0 0 1 16 0m-1 0A7 7 0 1 0 1 8a7 7 0 0 0 14 0"/>
        </svg>
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
        <button class="w-100 btn btn-lg btn-secondary" type="button" onclick="location.href='/member/join'">회원가입</button>
        <br><br>
        <button class="w-100 btn btn-lg btn-secondary" type="button" onclick="location.href='/login/find'">패스워드 찾기</button>
    </form>

</main>


<script>
    let id_reg = /^[a-z0-9]+$/;
    let member_id = document.getElementById("member_id");
    member_id.addEventListener("keyup",function(e){
        if(!id_reg.test(this.value)){
            this.value = this.value.replace(/[^a-z0-9]/g, '');
            alert("영어 소문자 및 숫자만 입력이 가능합니다.");
        }

    });
</script>
</body>
</html>

