<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
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
    <link href="https://stackpath.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css" rel="stylesheet">
    <!-- Datepicker CSS -->
    <link href="https://cdnjs.cloudflare.com/ajax/libs/bootstrap-datepicker/1.9.0/css/bootstrap-datepicker.min.css" rel="stylesheet">
<style>
    .special-date {
        background-color: #ffcccb;
        color: #000;
    }
</style>
</head>
<body class="text-center">
<jsp:include page="/WEB-INF/views/common/header.jsp"/>
<div class="container">

    <div class="form-group">
        <input type="text" class="form-control" id="datepicker" placeholder="날짜 선택">
    </div>

<div id="postsContainer">
    <c:forEach var="studyDTO" items="${todayList}">
    <div class="card">
        <div class="card-body pt-3">
            <div class="tab-pane fade show active profile-overview" id="profile-overview">
                <div class="row mb-3">
                    <label for="title" class="col-md-4 col-lg-2 col-form-label label">제목</label>
                    <div class="col-md-8 col-lg-9">
                        <input name="title" type="text" class="form-control-plaintext" id="title"
                               value="${studyDTO.title}" readonly>
                    </div>
                </div>
                <div class="row mb-3">
                    <label class="col-md-4 col-lg-2 col-form-label label">내용</label>
                    <div class="col-md-8 col-lg-9 overflow-auto mx-2 border border-gray rounded p-2" style="max-height: 500px;">
                        <textarea readonly style="max-width: 940px; width: 100%; border: 0; resize:none" rows="5" name="contents" >${studyDTO.contents}</textarea>
                    </div>
                </div>

                <div class="row mb-3">
                    <label class="col-md-4 col-lg-2 col-form-label label">이미지</label>
                    <div class="col-md-8 col-lg-9 overflow-auto mx-2 border border-gray rounded p-2" style="max-height: 500px;">
                        <c:if test="${studyDTO.img_path !=null}">
                            <img src="/resources/upload/study/${studyDTO.img_path}" alt="" width="100%" height="100%" >
                        </c:if>
                        <c:if test="${studyDTO.img_path == null}">
                            등록한 이미지가 없습니다.
                        </c:if>
                    </div>
                </div>

                <div class="row mt-5">
                    <div class="col-4">
                        <label class="col-md-4 col-lg-4 col-form-label label">분야</label>

                        <c:set var="category" value="${fn:split(studyDTO.category,'|')}"/>
                        <c:forEach var="cate" items="${category}" varStatus="i">
                            <c:if test="${!i.last}">
                                <span>${cate}, </span>
                            </c:if>
                            <c:if test="${i.last}">
                                <span>${cate}</span>
                            </c:if>
                        </c:forEach>
                    </div>
                    <div class="col-4">
                        <label class="col-md-4 col-lg-4 col-form-label label">해시태그</label>
                        <c:set var="tags" value="${fn:split(studyDTO.tags,'|')}"/>
                        <c:forEach var="tag" items="${tags}" varStatus="i">
                            <span>#${tag}</span>
                        </c:forEach>
                    </div>
                </div>

            </div>
        </div>
    </div>
    </c:forEach>
</div>
</div>
<!-- jQuery -->
<script src="https://code.jquery.com/jquery-3.5.1.min.js"></script>
<!-- Bootstrap JS -->
<script src="https://stackpath.bootstrapcdn.com/bootstrap/4.5.2/js/bootstrap.bundle.min.js"></script>
<!-- Datepicker JS -->
<script src="https://cdnjs.cloudflare.com/ajax/libs/bootstrap-datepicker/1.9.0/js/bootstrap-datepicker.min.js"></script>
<script>
    let dateList = [];
    let reg_year;
    let reg_month;
    let reg_day;
    <c:forEach items="${list}" var="list">
    <c:set var="reg_date" value="${fn:split(list.reg_date,'-')}"/>
        reg_year = ${reg_date[0]}
        reg_month = Number(${reg_date[1]})-1;
        reg_day = ${reg_date[2]}
        dateList.push(new Date(reg_year,reg_month,reg_day))
    </c:forEach>

    $(document).ready(function() {
        var specialDates = dateList;
        console.log(specialDates)

        $('#datepicker').datepicker({
            format: 'mm/dd/yyyy',
            autoclose: true,
            todayHighlight: true,
            beforeShowDay: function(date) {
                for (var i = 0; i < specialDates.length; i++) {
                    if (date.getFullYear() === specialDates[i].getFullYear() &&
                        date.getMonth() === specialDates[i].getMonth() &&
                        date.getDate() === specialDates[i].getDate()) {
                        return {
                            classes: 'special-date',
                            tooltip: 'Special Date'
                        };
                    }
                }
                return;
            }
        }).on('changeDate', function(e){
            var selectedDate = e.format('yyyy-mm-dd');
            studyForDate(selectedDate);
        });
    });
    function studyForDate(date){
        $.ajax({
            url:'/main/studyDate',
            type: 'GET',
            data: {
              date : date,
              member_id : "${sessionScope.login_info.member_id}"
            },
            success:function (response){
                console.log(response);
                renderPosts(response);
            },
            error: function(error){
                console.log('error');
            }
        })
    }
    function renderPosts(posts) {
        var postsContainer = $('#postsContainer');
        postsContainer.empty();
        if (posts.length === 0) {
            postsContainer.append('<p>작성한 게시글이 없습니다.</p>');
        } else {
            posts.forEach(function(post) {
                var postElement = `<div class="card">
        <div class="card-body pt-3">
            <div class="tab-pane fade show active profile-overview" id="profile-overview">
                <div class="row mb-3">
                    <label for="title" class="col-md-4 col-lg-2 col-form-label label">제목</label>
                    <div class="col-md-8 col-lg-9">
                        <input name="title" type="text" class="form-control-plaintext" id="title"
                               value="`+post.title+`" readonly>
                    </div>
                </div>
                <div class="row mb-3">
                    <label class="col-md-4 col-lg-2 col-form-label label">내용</label>
                    <div class="col-md-8 col-lg-9 overflow-auto mx-2 border border-gray rounded p-2" style="max-height: 500px;">
                        <textarea readonly style="max-width: 940px; width: 100%; border: 0; resize:none" rows="5" name="contents" >`+post.contents+`</textarea>
                    </div>
                </div>

                <div class="row mb-3">
                    <label class="col-md-4 col-lg-2 col-form-label label">이미지</label>
                    <div class="col-md-8 col-lg-9 overflow-auto mx-2 border border-gray rounded p-2" style="max-height: 500px;">`
                        if(post.img_path != null)
                            postElement +=
                        `
                            <img src="/resources/upload/study/`+post.img_path +`" alt="" width="100%" height="100%" >
                        `
                    else
                        postElement +="등록한 이미지가 없습니다."
                postElement +=` </div> </div>

                <div class="row mt-5">
                    <div class="col-4">
                        <label class="col-md-4 col-lg-4 col-form-label label">분야</label>`
                let category = post.category.replaceAll('|', ', ');
                postElement +=category;
                postElement +=`</div>
                    <div class="col-4">
                        <label class="col-md-4 col-lg-4 col-form-label label">해시태그</label>`
                let tags = post.tags.replaceAll('|', ' #');
                tags = tags.replace(',', ' ');
                tags = '#'+tags;
                postElement +=tags;
                        postElement +=`
                    </div>
                </div>

            </div>
        </div>
    </div>`;
                postsContainer.append(postElement);
            });
        }
    }
</script>
</body>
</html>
