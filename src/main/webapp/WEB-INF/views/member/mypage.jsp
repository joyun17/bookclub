<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
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
<jsp:include page="/WEB-INF/views/common/header.jsp"/>
<form class="row g-3 form-signin">
    <div class="col-md-6">
        <label for="inputEmail4" class="form-label">아이디</label>
        <input type="text" class="form-control" value="${memberDTO.member_id}"  readonly id="inputEmail4">
    </div>
    <div class="col-md-6">
        <label for="inputPassword4" class="form-label">이름</label>
        <input type="text" class="form-control" value="${memberDTO.name}" readonly id="inputPassword4">
    </div>
    <div class="col-12">
        <label for="inputAddress" class="form-label">비밀번호</label>
        <input type="password" class="form-control" id="inputAddress">
    </div>
    <div class="col-12">
        <label for="inputAddress2" class="form-label">비밀번호 확인</label>
        <input type="password" class="form-control" id="inputAddress2">
    </div>
    <div class="col-md-6">
        <label for="inputCity" class="form-label">이메일</label>
        <input type="text" class="form-control" value="${fn:split(memberDTO.email,'@')[0]}" id="inputCity">
    </div>
    <span style="width: fit-content; line-height: 100px">@</span>
    <div class="col-md-5">
        <label for="inputState" class="form-label">&nbsp;&nbsp;&nbsp;</label>
        <select id="inputState" class="form-select">
            <option>gmail.com</option>
            <option>naver.com</option>
            <option>hanmail.net</option>
            <option>nate.com</option>
            <option>직접입력</option>
        </select>
    </div>
    <div class="col-md-3">
        <label for="inputState" class="form-label">전화번호</label>
        <select id="phone0" name="phone0" class="form-select">
            <option>010</option>
            <option>011</option>
            <option>016</option>
            <option>017</option>
            <option>018</option>
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
        <button type="submit" class="btn btn-primary">수정</button>
        <button type="button" class="btn btn-secondary" onclick="location.href='/main/main'">취소</button>
    </div>
</form>
</body>
</html>
