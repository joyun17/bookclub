<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%--
  Created by IntelliJ IDEA.
  User: user
  Date: 2024-05-13
  Time: 오후 4:37
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Title</title>
    <link rel="canonical" href="https://getbootstrap.kr/docs/5.1/examples/sign-in/">
<%--    <link rel="stylesheet"--%>
<%--          href="https://fonts.googleapis.com/css2?family=Material+Symbols+Outlined:opsz,wght,FILL,GRAD@48,400,0,0"/>--%>
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
</head>
<body class="text-center">
<c:if test="${joinNO == '1'}">
    <script>
        alert("로그인 실패!");
    </script>
</c:if>
<main class="form-signin">
    <form action="/member/join" method="post" name="frmLogin">
        <h1 class="h3 mb-3 fw-normal">회원가입</h1>
        <div class="form-floating">
            <input type="text" class="form-control" id="member_id" name="member_id">
            <label for="member_id">아이디</label>
            <div class="invalid-feedback" style="display: block;">
                아이디를 확인해주세요
            </div>
        </div>

        <div class="form-floating">
            <input type="password" class="form-control" id="password" name="password" placeholder="Password">
            <label for="password">비밀번호</label>
            <div class="invalid-feedback" style="display: block;">
                영어 + 숫자 + 특수문자
            </div>
        </div>
        <div class="form-floating">
            <input type="password" class="form-control" id="password2" name="password2" placeholder="Password">
            <label for="password2">비밀번호 확인</label>
            <div class="invalid-feedback" style="display: block;">
                비밀번호를 확인해주세요
            </div>
        </div>
        <div class="form-floating">
            <input type="text" class="form-control" id="name" name="name" placeholder="name@example.com">
            <label for="member_id">이름</label>
            <div class="invalid-feedback" style="display: block;">
                이름을 확인해주세요
            </div>
        </div>
        <div class="form-floating">
            <input type="email" class="form-control" id="email" name="email" placeholder="Password">
            <label for="email">이메일</label>
            <div class="invalid-feedback" style="display: block;">
                이메일을 확인해주세요
            </div>
        </div>
<%--        <div class="form-floating">--%>
        <div style="display: flex">
            <select class="form-select form-select-lg" id="phone0" name="phone0" style="width: 120px; float: left;" aria-label=".form-select-lg example">
                <option value="010">010</option>
                <option value="011">011</option>
                <option value="016">016</option>
                <option value="017">017</option>
                <option value="018">018</option>
            </select>
            <span style="padding:10px;">-</span>
            <input type="tel"class="form-control" style="width: 120px;" id="phone1" name="phone1">
            <span style="padding:10px;">-</span>
<%--            <label for="phone0">전화번호</label>--%>
            <input type="tel" class="form-control" style="width: 120px;" id="phone2" name="phone2">

        </div>
        <div class="invalid-feedback" style="display: block; float: none">
            전화번호를 확인해주세요
        </div>
<%--        <div class="col-12 mt-3">--%>
<%--            <div class="row mt-3 mb-4 align-items-center justify-content-center">--%>
<%--                <div class="col-3"><label for="phone_num1" class="small ifta-label">전화번호</label>--%>
<%--                    <input type="tel" class="ifta-field" id="phone_num1" name="phone_num1" value="${dto.phone_num1}"--%>
<%--                           placeholder="010" maxlength="3" required>--%>
<%--                </div>--%>
<%--                <div class="col-1 align-middle">--%>
<%--                    <div class="py-2 fw-bold" style="padding:35px 20px 15px;width:100%;"><p style="font-size: 20px"><span class="material-symbols-outlined">remove</span></p></div> </div>--%>
<%--                <div class="col-3"><label for="phone_num2" class="small ifta-label">&nbsp;</label>--%>
<%--                    <input type="tel" class="ifta-field" id="phone_num2" name="phone_num2" value="${dto.phone_num2}"--%>
<%--                           placeholder="1111" maxlength="4" required>--%>
<%--                </div>--%>
<%--                <div class="col-1">--%>
<%--                    <div class="py-2 fw-bold" style="padding:35px 20px 15px;width:100%;"><p style="font-size: 20px"><span class="material-symbols-outlined">remove</span></p></div> </div>--%>
<%--                <div class="col-3"><label for="phone_num3" class="small ifta-label">&nbsp;</label>--%>
<%--                    <input type="tel" class="ifta-field" id="phone_num3" name="phone_num3" value="${dto.phone_num3}"--%>
<%--                           placeholder="1111" maxlength="4" required>--%>
<%--                </div>--%>
<%--                <div id="phoneck" style='display: none; width:100%;margin-bottom:.25rem;font-size:.875em;color:#dc3545'>--%>
<%--                </div>--%>
<%--            </div>--%>
<%--            <div class="invalid-feedback">--%>
<%--                전화번호를 입력해주세요.--%>
<%--            </div>--%>
<%--        </div>--%>
        <br><br>
        <button class="w-100 btn btn-lg btn-primary" type="submit">회원가입</button>
        <br><br>
        <button class="w-100 btn btn-lg btn-secondary" type="button" onclick="location.href='/login/login'">취소</button>
    </form>

</main>



</body>
</html>
