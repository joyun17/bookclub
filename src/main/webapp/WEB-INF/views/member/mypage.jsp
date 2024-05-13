<%--
  Created by IntelliJ IDEA.
  User: user
  Date: 2024-05-13
  Time: 오후 7:11
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Title</title>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-1BmE4kWBq78iYhFldvKuhfTAU6auU8tT94WrHftjDbrCEXSU1oBoqyl2QvZ6jIW3" crossorigin="anonymous">
    <style>
        .form-signin {
            width: 800px;
            margin: 0 auto;
            padding-top: 150px;
            padding-bottom: 150px;
        }
    </style>
</head>
<body class="text-center">
<h1>메인입니다.</h1>
<form class="row g-3 form-signin">
    <div class="col-md-6">
        <label for="inputEmail4" class="form-label">아이디</label>
        <input type="email" class="form-control" readonly id="inputEmail4">
    </div>
    <div class="col-md-6">
        <label for="inputPassword4" class="form-label">이름</label>
        <input type="password" class="form-control" readonly id="inputPassword4">
    </div>
    <div class="col-12">
        <label for="inputAddress" class="form-label">비밀번호</label>
        <input type="text" class="form-control" id="inputAddress">
    </div>
    <div class="col-12">
        <label for="inputAddress2" class="form-label">비밀번호 확인</label>
        <input type="text" class="form-control" id="inputAddress2">
    </div>
    <div class="col-md-6">
        <label for="inputCity" class="form-label">이메일</label>
        <input type="text" class="form-control" id="inputCity">
    </div>
    <span style="width: fit-content; line-height: 100px">@</span>
    <div class="col-md-5">
        <label for="inputState" class="form-label">&nbsp;&nbsp;&nbsp;</label>
        <select id="inputState" class="form-select">
            <option selected>Choose...</option>
            <option>...</option>
        </select>
    </div>
    <div class="col-md-3">
        <label for="inputState" class="form-label">전화번호</label>
        <select id="phone0" name="phone0" class="form-select">
            <option selected>Choose...</option>
            <option>...</option>
        </select>
    </div>
    <span style="width: fit-content; line-height: 100px">-</span>
    <div class="col-md-4">
        <label for="inputState" class="form-label">&nbsp;&nbsp;&nbsp;</label>
        <input type="text" class="form-control" id="phone1" name="phone1">
    </div>
    <span style="width: fit-content; line-height: 100px">-</span>
    <div class="col-md-4">
        <label for="inputState" class="form-label">&nbsp;&nbsp;&nbsp;</label>
        <input type="text" class="form-control" id="phone2" name="phone2">
    </div>

    <%--    <div class="col-md-2">--%>
    <%--        <label for="inputZip" class="form-label">Zip</label>--%>
    <%--        <input type="text" class="form-control" id="inputZip">--%>
    <%--    </div>--%>

    <div class="col-12">
        <button type="submit" class="btn btn-primary">Sign in</button>
    </div>
</form>
</body>
</html>
