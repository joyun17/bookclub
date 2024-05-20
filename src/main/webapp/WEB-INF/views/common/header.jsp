<%--
  Created by IntelliJ IDEA.
  User: user
  Date: 2024-05-14
  Time: 오후 2:15
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Title</title>
    <style>
        .navbar{
            width: 1000px;
            margin: 0 auto;
        }
    </style>
</head>
<body class="text-center">
<div class="container">
    <nav class="navbar navbar-expand-lg navbar-light bg-light">
        <div class="container-fluid">
            <a class="navbar-brand" href="#"></a>
            <button class="navbar-toggler" type="button" data-bs-toggle="collapse" data-bs-target="#navbarTogglerDemo02" aria-controls="navbarTogglerDemo02" aria-expanded="false" aria-label="Toggle navigation">
                <span class="navbar-toggler-icon"></span>
            </button>
            <div class="collapse navbar-collapse" id="navbarTogglerDemo02">
                <ul class="navbar-nav me-auto mb-2 mb-lg-0">
                    <li class="nav-item">
                        <a class="nav-link active" aria-current="page" href="/member/mypage?member_id=${sessionScope.login_info.member_id}">마이페이지</a>
                    </li>
                    <li class="nav-item">
                        <a class="nav-link active" aria-current="page" href="/main/main">오늘의 학습</a>
                    </li>
                    <li class="nav-item">
                        <a class="nav-link active" aria-current="page" href="/main/mystudy">나의 학습</a>
                    </li>
                    <li class="nav-item">
                        <a class="nav-link active" aria-current="page" href="/main/sharestudy">공유 학습</a>
                    </li>
                </ul>
                <form class="d-flex">
                    <input class="form-control me-2" type="search" style="border: 0; width: 80px" readonly value="${sessionScope.login_info.name}" aria-label="Search">
                    <button class="btn btn-outline-success" type="button" onclick="location.href='/login/logout'">로그아웃</button>
                </form>
            </div>
        </div>
    </nav>
</div>
</body>
</html>
