<%--
  Created by IntelliJ IDEA.
  User: USER
  Date: 2024-05-15
  Time: 오후 2:05
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Title</title>
    <link rel="canonical" href="https://getbootstrap.kr/docs/5.1/examples/sign-in/">
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-QWTKZyjpPEjISv5WaRU9OFeRpok6YctnYmDr5pNlyT2bRjXh0JMhjY6hW+ALEwIH" crossorigin="anonymous">

</head>
<body>
<jsp:include page="/WEB-INF/views/common/header.jsp"/>
<div class="container">
    <div class="col-xl-12">

        <div class="card">
            <div class="card-body pt-3">

                <div class="tab-pane fade show active profile-overview" id="profile-overview">

                    <!--Form -->
                    <form method="post" id="registFrm" action="/main/studyregist" enctype="multipart/form-data">
                        <input type="hidden" name="member_id" value="${sessionScope.login_info.member_id}">
                        <div class="row mb-3">
                            <label for="title" class="col-md-4 col-lg-2 col-form-label">제목</label>
                            <div class="col-md-8 col-lg-9">
                                <input name="title" type="text" class="form-control" id="title"
                                       value="" placeholder="2~60자 사이로 입력해주세요.">
                                <div class="invalid-feedback" id="err_title" style="display: none">
                                    2~60자 사이로 입력해주세요.
                                </div>
                            </div>
                        </div>
                        <div class="row mb-3">
                            <label for="contents" class="col-md-4 col-lg-2 col-form-label">내용</label>
                            <div class="col-md-8 col-lg-10">
                                <textarea id="contents" class="form-control" style="max-width: 940px" rows="5" id="contents" name="contents" ></textarea>
                                <div class="invalid-feedback" id="err_contents" style="display: none">
                                    20자 이상 입력해주세요.
                                </div>
                            </div>

                        </div>
                        <div class="row mb-3">
                            <label class="col-md-4 col-lg-2 col-form-label">파일</label>
                            <div class="col-md-8 col-lg-9">
                                <input class="p-1" type="file" name="file" id="file" onchange="">
                            </div>
                        </div>
                        <div class="row mb-3">
                            <label class="col-md-4 col-lg-2 col-form-label">학습 노출 여부</label>
                            <div class="col-md-8 col-lg-9">
                                <input type="radio" id="status_y" name="show_status" value="Y" onclick="radioChange(this)"><label for="status_y" > 노출</label>
                                &nbsp;&nbsp;&nbsp;&nbsp;
                                <input type="radio" id="status_n" name="show_status" value="N" checked onclick="radioChange(this)"><label for="status_n"> 노출 안함</label>
                            </div>
                        </div>
                        <div class="row mb-3">
                            <label  class="col-md-4 col-lg-2 col-form-label">학습 노출 기간</label>
                            <div class="col-md-8 col-lg-9">
                                <input type="date" name="start_date" id="start_date" disabled>
                                ~
                                <input type="date" name="end_date" id="end_date" disabled>
                            </div>
                        </div>
                        <div class="row mb-3" id="contentsBox">
                            <label class="col-md-4 col-lg-2 col-form-label">분야</label>
                            <div class="col-lg-10 row">
                                <div class="col-lg-9"></div>
                                <div class="col-lg-3">
                                    <button type="button" id="contentsAddBtn" class="btn btn-success me-2">추가</button>
                                </div>
                                <input type="hidden" id="category" name="category" value="">
                            </div>
<%--                            <div class="col-lg-2"></div>--%>
<%--                            <div class="col-md-8 col-lg-10 row">--%>
<%--                                <div class="col-9">--%>
<%--                                    <input type="text" class="form-control contentsList" value="">--%>
<%--                                </div>--%>
<%--                                <div class="col-3">--%>
<%--                                    <button type="button" class="btn btn-danger me-2 contentsDelBtn" onclick="delContents(this)">삭제</button>--%>
<%--                                </div>--%>
<%--                            </div>--%>
                            <br><br>
                        </div>

                        <div class="row mb-3" id="tagsBox">
                            <label class="col-md-4 col-lg-2 col-form-label">해시태그</label>
                            <div class="col-lg-10 row">
                                <div class="col-lg-9"></div>
                                <div class="col-lg-3">
                                    <button type="button" id="tagsAddBtn" class="btn btn-success me-2">추가</button>
                                </div>
                                <input type="hidden" id="tags" name="tags" value="">
                            </div>
<%--                            <div class="col-lg-2"></div>--%>
<%--                            <div class="col-md-8 col-lg-10 row">--%>
<%--                                <div class="col-9">--%>
<%--                                    <input type="text" class="form-control tagsList" value="">--%>
<%--                                </div>--%>
<%--                                <div class="col-3">--%>
<%--                                    <button type="button" class="btn btn-danger me-2 tagsDelBtn" onclick="deltags(this)">삭제</button>--%>
<%--                                </div>--%>
<%--                            </div>--%>
                            <br><br>
                        </div>


                        <div class="d-flex text-center mt-5 justify-content-end">
                            <button type="submit" id="registBtn" class="btn btn-primary me-2">등록</button>
                            <button type="button" class="btn btn-secondary" onclick="location.href='/main/mystudy'">취소</button>
                        </div>

                    </form><!-- EndForm -->

                </div>
            </div>
        </div><!-- End Bordered Tabs -->
    </div>
</div>

<script>
    let contentsAddBtn = document.getElementById("contentsAddBtn");
    let contentsBox = document.getElementById("contentsBox");
    let contentsDelBtn = document.getElementsByClassName("contentsDelBtn");
    let registBtn = document.getElementById("registBtn");

    let tagsAddBtn = document.getElementById("tagsAddBtn");
    let tagsBox = document.getElementById("tagsBox");
    let tagsDelBtn = document.getElementsByClassName("tagsDelBtn");
    let id=1;
    let categoryCount = 0;
    let tagsCount = 0;
    registBtn.addEventListener("click", function(e){
        e.preventDefault();

        let title = document.getElementById("title");
        let contents = document.getElementById("contents");
        let status_y = document.getElementById("status_y");
        console.log(status_y.checked);
        if(title.value.trim().length<4 || title.value.trim().length>60){
            alert("제목을 4 ~ 60자 사이로 입력해주세요");
            return false;
        }
        if(contents.value.trim().length<20){
            alert("내용을 20자 이상 입력해주세요");
            return false;
        }

        if(status_y.checked){
            let start_date = document.getElementById("start_date");
            let end_date = document.getElementById("end_date");
            if(start_date.value>end_date.value||start_date.value=="" ||end_date.value==""){
                alert("학습 노출 기간을 확인해주세요");
                return false;
            }
        }


        let contentsStr = "";

        let contentsList = document.getElementsByClassName("contentsList");
        if(contentsList.length==0){
            document.getElementById("category").value = "";
        }
        for (i = 0; i < contentsList.length; i++) {
            if(contentsList[i].value.trim()==""){
                alert("분야를 입력해주세요");
                return false;
            }
            contentsStr += contentsList[i].value + "|";
            document.getElementById("category").value = contentsStr.substring(0, contentsStr.length - 1);
        }

        let tagsStr = "";

        let tagsList = document.getElementsByClassName("tagsList");
        if(tagsList.length==0){
            document.getElementById("tags").value = "";
        }
        for (i = 0; i < tagsList.length; i++) {
            if(tagsList[i].value.trim()==""){
                alert("해시태그를 입력해주세요");
                return false;
            }
            tagsStr += tagsList[i].value + "|";
            document.getElementById("tags").value = tagsStr.substring(0, tagsStr.length - 1);
        }



        document.getElementById("registFrm").submit();
    });
    function delContents(element){
        let div = element.parentNode.parentNode.parentNode;
        if(div.childElementCount >0){
            categoryCount = categoryCount - 1;

        }

        div.removeChild(element.parentNode.parentNode.previousElementSibling);
        div.removeChild(element.parentNode.parentNode);
    }
    contentsAddBtn.addEventListener("click", function(e){
        if(categoryCount==4){
            alert("최대 4개까지만 등록 가능합니다.");
            return;
        }

        e.preventDefault();
        let div = document.createElement("div");
        div.classList.add("col-md-8");
        div.classList.add("col-lg-10");
        div.classList.add("contents-box");
        div.classList.add("row");
        let innerText = "";
        innerText += '<div class="col-9">'
        innerText += '<input type="text" maxlength="10" class="form-control contentsList" id=`${id}` value="">';
        innerText += '</div>';
        innerText += '<div class="col-3">';
        innerText += '<button type="button" id="contentsDelBtn" class="btn btn-danger me-2 contentsDelBtn" onclick="delContents(this);">삭제</button>';
        innerText += '</div>';
        innerText += '<br><br>'
        div.innerHTML = innerText;

        let div2 = document.createElement("div");
        div2.classList.add("col-lg-2");
        div2.classList.add("col-9");

        contentsBox.append(div2);
        contentsBox.append(div);
        categoryCount = categoryCount + 1;


        innerText += ""
    });

    function deltags(element){
        let div = element.parentNode.parentNode.parentNode;
        if(div.childElementCount >0){
            tagsCount = tagsCount - 1;
        }

        div.removeChild(element.parentNode.parentNode.previousElementSibling);
        div.removeChild(element.parentNode.parentNode);
    }
    tagsAddBtn.addEventListener("click", function(e){
        if(tagsCount==4){
            alert("최대 4개까지만 등록 가능합니다.");
            return;
        }
        e.preventDefault();
        let div = document.createElement("div");
        div.classList.add("col-md-8");
        div.classList.add("col-lg-10");
        div.classList.add("contents-box");
        div.classList.add("row");
        let innerText = "";
        innerText += '<div class="col-9">'
        innerText += '<input type="text" maxlength="10" class="form-control tagsList" id=`${id}` value="">';
        innerText += '</div>';
        innerText += '<div class="col-3">';
        innerText += '<button type="button" id="tagsDelBtn" class="btn btn-danger me-2 tagsDelBtn" onclick="deltags(this);">삭제</button>';
        innerText += '</div>';
        innerText += '<br><br>'
        div.innerHTML = innerText;

        let div2 = document.createElement("div");
        div2.classList.add("col-lg-2");
        div2.classList.add("col-9");

        tagsBox.append(div2);
        tagsBox.append(div);
        tagsCount = tagsCount + 1;


        innerText += ""
    });
    function radioChange(element){
        if(element.value == "N"){
            document.getElementById("start_date").disabled = true;
            document.getElementById("start_date").value=null;
            document.getElementById("end_date").disabled = true;
            document.getElementById("end_date").value=null;
        }
        else{
            document.getElementById("start_date").disabled = false;
            document.getElementById("end_date").disabled = false;
        }
    }
</script>
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/js/bootstrap.bundle.min.js" integrity="sha384-ka7Sk0Gln4gmtz2MlQnikT1wXgYsOg+OMhuP+IlRH9sENBO0LRn5q+8nbTov4+1p" crossorigin="anonymous"></script>
<script src="https://cdn.jsdelivr.net/npm/@popperjs/core@2.10.2/dist/umd/popper.min.js" integrity="sha384-7+zCNj/IqJ95wo16oMtfsKbZ9ccEh31eOz1HGyDuCQ6wgnyJNSYdrPa03rtR1zdB" crossorigin="anonymous"></script>
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/js/bootstrap.min.js" integrity="sha384-QJHtvGhmr9XOIpI6YVutG+2QOK9T+ZnN4kzFN1RtK3zEFEIsxhlmWl5/YESvpZ13" crossorigin="anonymous"></script>

</body>
</html>
