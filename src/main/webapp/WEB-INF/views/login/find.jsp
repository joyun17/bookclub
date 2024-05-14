<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%--
  Created by IntelliJ IDEA.
  User: USER
  Date: 2024-05-13
  Time: 오후 9:46
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
  <meta charset="utf-8">
  <meta name="viewport" content="width=device-width, initial-scale=1">
  <meta name="description" content="">
  <meta name="author" content="Mark Otto, Jacob Thornton, 그리고 Bootstrap 기여자들">
  <meta name="generator" content="Hugo 0.88.1">
  <title>Signin Template · Bootstrap v5.1</title>

  <link rel="canonical" href="https://getbootstrap.kr/docs/5.1/examples/sign-in/">
  <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-QWTKZyjpPEjISv5WaRU9OFeRpok6YctnYmDr5pNlyT2bRjXh0JMhjY6hW+ALEwIH" crossorigin="anonymous">
  <meta name="theme-color" content="#7952b3">
  <style>
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
<c:if test="${param.noId == '1'}">
  <script>
    alert("아이디를 입력해주세요.");
  </script>
</c:if>
<c:if test="${param.noId == '2'}">
  <script>
    alert("일치하는 아이디가 없습니다.");
  </script>
</c:if>
  <main class="form-signin">
    <form action="/login/find" method="post" name="frmLogin">

      <h1 class="h3 mb-3 fw-normal">비밀번호를 잊으셨나요?</h1>

      <div class="form-floating">
        <input type="text" class="form-control" name="member_id" id="member_id" placeholder="아이디">
        <label for="member_id">아이디</label>
        <br><br>
        <button class="w-100 btn btn-lg btn-primary">임시 비밀번호 발송</button>
      </div>
      <div class="form-floating">
        <p>아이디 입력 후 임시 비밀번호 발송 버튼을 눌러주세요</p>
        <p>가입하신 이메일 주소로 임시비밀번호가 발송됩니다 <br>메일 서비스에 따라 다소 시간이 걸릴 수 있습니다.</p>
        <p>임시 비밀번호는 발송 후, 1시간 내에만 유효합니다.</p>
      </div>


      <button class="w-100 btn btn-lg btn-secondary" type="button" onclick="location.href='/login/login'">취소</button>

    </form>

  </main>

</body>
</html>
