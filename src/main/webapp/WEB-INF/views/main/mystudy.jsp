<%--
  Created by IntelliJ IDEA.
  User: user
  Date: 2024-05-14
  Time: 오후 7:51
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Title</title>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-1BmE4kWBq78iYhFldvKuhfTAU6auU8tT94WrHftjDbrCEXSU1oBoqyl2QvZ6jIW3" crossorigin="anonymous">

</head>
<body>
<jsp:include page="/WEB-INF/views/common/header.jsp"/>
<div class="container">
    <div class="row content">
        <div class="card">
            <div class="card-body">
                <form action="/bbs/list" method="get" id="frmSearch">
                    <div class="mb-3">
<%--                        <c:set value="${fn:join(responseDTO.search_type, '')}" var="search_type"/>--%>
                        <input type="checkbox" class="search_type" name="search_type" value="t" >제목
                        <input type="checkbox" class="search_type" name="search_type" value="u" >작성자
                        <input type="text" id="search_word" name="search_word" class="form-control" value="${responseDTO.search_word}">
                    </div>
                    <div class="input-group mb-3 dueDateDiv">
                        <input type="date" name="search_date1" class="form-control search_date" value="">
                        <input type="date" name="search_date2" class="form-control search_date" value="">
                    </div>
                    <div class="input-group mb-3">
                        <div class="float-end">
                            <button class="btn btn-primary" id="btnSearch" type="submit">검색</button>
                            <button class="btn btn-secondary" type="reset">초기화</button>
                        </div>
                    </div>
                </form>
            </div>
        </div>
    </div>
    <div class="d-grid gap-2 d-md-block" style="text-align: left; margin-top: 10px">
        <button class="btn btn-primary" type="button">좋아요 순</button>
        <button class="btn btn-primary" type="button">등록일 순</button>
        <div class="d-grid gap-2 d-md-flex justify-content-md-end">
            <select aria-label="Default select example">
                <option value="30">30</option>
                <option value="50">50</option>
                <option value="80">80</option>
                <option value="100">100</option>
            </select>
            개씩 보기
        </div>
    </div>
    <div>
        <table class="table">
            <thead>
            <tr>
                <th scope="col">No</th>
                <th scope="col">제목</th>
                <th scope="col">등록일</th>
                <th scope="col">좋아요</th>
                <th scope="col">노출여부</th>
                <th scope="col">노출기간</th>
            </tr>
            </thead>
            <tbody>
            <tr>
                <th scope="row">1</th>
                <td>Mark</td>
                <td>Otto</td>
                <td>@mdo</td>
                <td>Otto</td>
                <td>@mdo</td>
            </tr>
            <tr>
                <th scope="row">2</th>
                <td>Jacob</td>
                <td>Thornton</td>
                <td>@fat</td>
                <td>Otto</td>
                <td>@mdo</td>
            </tr>
            <tr>
                <th scope="row">3</th>
                <td>Larry the Bird</td>
                <td>@twitter</td>
                <td>Otto</td>
                <td>@mdo</td>
                <td>Otto</td>
            </tr>
            </tbody>
        </table>
    </div>
    <div style="margin:0 auto;">
        <nav aria-label="Page navigation example">
            <ul class="pagination justify-content-center">
                <li class="page-item">
                    <a class="page-link" href="#" aria-label="Previous">
                        <span aria-hidden="true">&laquo;</span>
                    </a>
                </li>
                <li class="page-item"><a class="page-link" href="#">1</a></li>
                <li class="page-item"><a class="page-link" href="#">2</a></li>
                <li class="page-item"><a class="page-link" href="#">3</a></li>
                <li class="page-item">
                    <a class="page-link" href="#" aria-label="Next">
                        <span aria-hidden="true">&raquo;</span>
                    </a>
                </li>
            </ul>
        </nav>
    </div>
    <div class="d-grid gap-2 d-md-flex justify-content-md-end">
        <button class="btn btn-primary me-md-2" type="button">등록</button>

    </div>
</div>
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/js/bootstrap.bundle.min.js" integrity="sha384-ka7Sk0Gln4gmtz2MlQnikT1wXgYsOg+OMhuP+IlRH9sENBO0LRn5q+8nbTov4+1p" crossorigin="anonymous"></script>
<script src="https://cdn.jsdelivr.net/npm/@popperjs/core@2.10.2/dist/umd/popper.min.js" integrity="sha384-7+zCNj/IqJ95wo16oMtfsKbZ9ccEh31eOz1HGyDuCQ6wgnyJNSYdrPa03rtR1zdB" crossorigin="anonymous"></script>
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/js/bootstrap.min.js" integrity="sha384-QJHtvGhmr9XOIpI6YVutG+2QOK9T+ZnN4kzFN1RtK3zEFEIsxhlmWl5/YESvpZ13" crossorigin="anonymous"></script>

</body>
</html>
