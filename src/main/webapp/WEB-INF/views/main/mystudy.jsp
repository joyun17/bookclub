<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
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
<c:if test="${param.registOK == '1'}">
    <script>
        alert("등록 성공");
    </script>
</c:if>
<div class="container">
    <form action="/main/mystudy" method="get" id="frmSearch">
        <div class="row content">
            <div class="card">
                <div class="card-body">
                    <div class="input-group mb-3 dueDateDiv">
                        <input type="date" name="search_date1" class="form-control search_date" value="${responseDTO.search_date1}">
                        <input type="date" name="search_date2" class="form-control search_date" value="${responseDTO.search_date2}">
                    </div>
                    <div class="mb-3" style="display: flex">
<%--                        <c:set value="${fn:join(responseDTO.search_type, '')}" var="search_type"/>--%>
                        <div style="margin-top:15px;margin-right:10px">
                            <input type="radio" class="search_type" name="type" value="0" <c:if test="${responseDTO.type == '0'}"> checked</c:if>>전체
                            <input type="radio" class="search_type" name="type" value="1" <c:if test="${responseDTO.type == '1'}"> checked</c:if>>제목
                            <input type="radio" class="search_type" name="type" value="2" <c:if test="${responseDTO.type == '2'}"> checked</c:if>>내용
                        </div>
                        <input type="text" id="search_word" name="search_word" class="form-control" style="width: 850px;margin-right:10px;height: 50px" value="${responseDTO.search_word}">
                        <div class="input-group mb-3" style="width: 210px; margin-top: 5px">
                            <div class="float-end" >
                                <button class="btn btn-primary" id="btnSearch" type="submit" style="width: 100px">검색</button>
                                <button class="btn btn-secondary" type="reset" style="width: 100px" onclick="location.href='/main/mystudy'">초기화</button>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>
        <div class="d-grid gap-2 d-md-block" style="text-align: left; margin-top: 10px">
            <input type="hidden" id="sort_param" name="sort" value="<c:if test="${responseDTO.sort=='1'}">1</c:if><c:if test="${responseDTO.sort=='2'}">2</c:if>">
            <button class="btn btn-primary" id="like_sort" type="button">좋아요 순</button>
            <button class="btn btn-primary" id="reg_date_sort" type="button">등록일 순</button>
            <div class="d-grid gap-2 d-md-flex justify-content-md-end">
                <select aria-label="Default select example" name="page_size" onchange="this.form.submit()">
                    <option value="30" <c:if test="${responseDTO.page_size eq '30'}">selected</c:if>>30</option>
                    <option value="50" <c:if test="${responseDTO.page_size eq '50'}">selected</c:if>>50</option>
                    <option value="80" <c:if test="${responseDTO.page_size eq '80'}">selected</c:if>>80</option>
                    <option value="100" <c:if test="${responseDTO.page_size eq '100'}">selected</c:if>>100</option>
                </select>
                개씩 보기
            </div>
        </div>
    </form>
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
            <c:choose>
                <c:when test="${!empty responseDTO.dtoList}">
                    <c:set value="${responseDTO.total_count}" var="total_count"/>
                    <c:forEach items="${responseDTO.dtoList}" var="studyDTO" varStatus="i">
                        <tr>
                            <th scope="row">${total_count - i.index - responseDTO.page_skip_count}</th>
                            <td><a href="/main/studyview?study_idx=${studyDTO.study_idx}">${studyDTO.title}</a></td>
                            <td>${studyDTO.reg_date}</td>
                            <td>${studyDTO.like}</td>
                            <td>${studyDTO.show_status}</td>
                            <c:if test="${studyDTO.show_status == 'Y'}">
                                <td>${studyDTO.start_date} ~ ${studyDTO.end_date}</td>
                            </c:if>
                            <c:if test="${studyDTO.show_status == 'N'}">
                                <td></td>
                            </c:if>
                        </tr>
                    </c:forEach>
                </c:when>
            </c:choose>
            </tbody>
        </table>
    </div>
    <div style="margin:0 auto;">
        <nav aria-label="Page navigation example">
            <ul class="pagination justify-content-center">
                <li class="page-item <c:if test="${responseDTO.page_block_start - responseDTO.page_block_size < '1'}"> disabled</c:if>" >
                    <a href="<c:if test="${responseDTO.page_block_start - responseDTO.page_block_size >= '1'}">${responseDTO.linked_params}&page=${responseDTO.page_block_start - responseDTO.page_block_size}</c:if>"
                       class="page-link" aria-label="Previous">&laquo;
                    </a>
                </li>
                <c:forEach begin="${responseDTO.page_block_start}"
                           end="${responseDTO.page_block_end}"
                           var="page_num">
                    <c:choose>
                        <c:when test="${responseDTO.page == page_num}">
                            <li class="page-item active">
                                <a href="#" class="page-link">${page_num}</a>
                            </li>
                        </c:when>
                        <c:otherwise>
                            <li class="page-item">
                                <a href="${responseDTO.linked_params}&page=${page_num}" class="page-link">${page_num}</a>
                            </li>
                        </c:otherwise>
                    </c:choose>
                </c:forEach>
                <li class="page-item <c:if test="${responseDTO.page_block_start + responseDTO.page_block_size > responseDTO.total_page}"> disabled</c:if>">
                    <a href="<c:if test="${responseDTO.page_block_start + responseDTO.page_block_size < responseDTO.total_page}">${responseDTO.linked_params}&page=${responseDTO.page_block_start + responseDTO.page_block_size}</c:if>
                        " class="page-link" aria-label="Next">&raquo;</a>
                </li>
            </ul>
        </nav>
    </div>
    <div class="d-grid gap-2 d-md-flex justify-content-md-end">
        <button class="btn btn-primary me-md-2" type="button" onclick="location.href='/main/studyregist'">등록</button>

    </div>
</div>

<script>
    let like_sort = document.getElementById("like_sort");
    let reg_date_sort = document.getElementById("reg_date_sort");
    let sort_param = document.getElementById("sort_param");
    like_sort.addEventListener("click", function(e){
        e.preventDefault();
        sort_param.value = "1";
        this.form.submit();
    });
    reg_date_sort.addEventListener("click", function (e){
        e.preventDefault();
        sort_param.value = "2";
        this.form.submit();
    });
</script>
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/js/bootstrap.bundle.min.js" integrity="sha384-ka7Sk0Gln4gmtz2MlQnikT1wXgYsOg+OMhuP+IlRH9sENBO0LRn5q+8nbTov4+1p" crossorigin="anonymous"></script>
<script src="https://cdn.jsdelivr.net/npm/@popperjs/core@2.10.2/dist/umd/popper.min.js" integrity="sha384-7+zCNj/IqJ95wo16oMtfsKbZ9ccEh31eOz1HGyDuCQ6wgnyJNSYdrPa03rtR1zdB" crossorigin="anonymous"></script>
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/js/bootstrap.min.js" integrity="sha384-QJHtvGhmr9XOIpI6YVutG+2QOK9T+ZnN4kzFN1RtK3zEFEIsxhlmWl5/YESvpZ13" crossorigin="anonymous"></script>

</body>
</html>
