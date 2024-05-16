<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<%--
  Created by IntelliJ IDEA.
  User: USER
  Date: 2024-05-15
  Time: 오후 9:46
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
<script>
    function deleteEl(element){
        element.parentNode.remove();
    }
    function updateInput() {
        let select = document.getElementById("shareList");
        let selectedValue = select.options[select.selectedIndex].value;
        let shareDiv = document.getElementById("shareDiv");
        let shareInputList = document.getElementsByClassName("shareValue");
        let flag = 0;
        for(let i=0;i<shareInputList.length;i++){
            if(shareInputList[i].value == selectedValue)
                flag = 1;
        }

        if(flag == 0) {
            let divElement = document.createElement("div");
            let inputElement = document.createElement("input");
            let btnElement = document.createElement("button");
            let innerText = "";
            innerText += '<div><input type="text" readonly style="width: 80%;" class="shareValue" value="' + selectedValue + '"name="inputValues"><button onclick="deleteEl(this)">X</button></div>'
            // btnElement.innerText = "X";
            // btnElement.onclick = deleteEl;
            // btnElement.addEventListener("click",deleteEl(this));
            //
            // inputElement.type = "text";
            // inputElement.readOnly = true;
            // inputElement.style.width = "80%";
            // inputElement.classList.add("shareValue");
            // inputElement.value = selectedValue;
            // inputElement.name = "inputValues";
            // divElement.append(inputElement);
            // divElement.append(btnElement);
            document.getElementById("shareDiv").innerHTML += innerText;
            //
            // shareDiv.appendChild(divElement);
        }

    }

</script>
    <div class="container">
        <div class="card">
            <div class="card-body pt-3">
                <div class="tab-pane fade show active profile-overview" id="profile-overview">
                    <form method="post" id="frmStudy" action="">
                        <input type="hidden" name="study_idx" value="${studyDTO.study_idx}">
                        <div class="row mb-3">
                            <label for="title" class="col-md-4 col-lg-2 col-form-label label">제목</label>
                            <div class="col-md-8 col-lg-9">
                                <input name="title" type="text" class="form-control-plaintext" id="title"
                                       value="${studyDTO.title}" readonly>
                            </div>
                        </div>
                        <div class="row mb-3">
                            <label for="member_id" class="col-md-4 col-lg-2 col-form-label label">작성자</label>
                            <div class="col-md-8 col-lg-9">
                                <input name="member_id" type="text" class="form-control-plaintext" id="member_id"
                                       value="${studyDTO.name}" disabled>
                            </div>
                        </div>
                        <div class="row mb-3">
                            <label for="reg_date" class="col-md-4 col-lg-2 col-form-label label">작성일</label>
                            <div class="col-md-8 col-lg-9">
                                <input name="reg_date" type="text" class="form-control-plaintext" id="reg_date"
                                       value="${studyDTO.reg_date}">
                            </div>
                        </div>
                        <div class="row mb-3">
                            <label class="col-md-4 col-lg-2 col-form-label label">내용</label>
                            <div class="col-md-8 col-lg-9 overflow-auto mx-2 border border-gray rounded p-2" style="max-height: 500px;">
                                <textarea readonly style="max-width: 940px; width: 100%; border: 0; resize:none" rows="5" name="contents" >${studyDTO.contents}</textarea>
                            </div>
                        </div>
                        <div class="row mb-3">
                            <label class="col-md-4 col-lg-2 col-form-label label">공유한 사람</label>

                            <div id="shareDiv" class="col-5 overflow-auto mx-2 border border-gray rounded p-2" style="max-height: 500px;">
                                <c:forEach var="shareDTO" items="${shareDTOList}">
                                    <div>
                                        <input type="text" style="width: 80%" class="shareValue" name="inputValues" value="${shareDTO.name}(${shareDTO.member_id})">
                                        <button onclick="deleteEl(this)">X</button>
                                    </div>
                                </c:forEach>
                            </div>
                            <div class="col-2">
                                <select id="shareList" onchange="updateInput()">
                                    <c:forEach var="memberDTO" items="${memberDTOList}">
                                        <c:if test="${memberDTO.member_id != sessionScope.login_info.member_id}">
                                            <option>${memberDTO.name}(${memberDTO.member_id})</option>
                                        </c:if>

                                    </c:forEach>
                                </select>
                            </div>
                            <div class="col-2">
                                <button class="btn btn-primary" id="shareBtn">공유하기</button>
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
                                <label class="col-md-4 col-lg-2 col-form-label label">분야</label>

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
                                <label class="col-md-4 col-lg-2 col-form-label label">해시태그</label>
                                <c:set var="tags" value="${fn:split(studyDTO.tags,'|')}"/>
                                <c:forEach var="tag" items="${tags}" varStatus="i">
                                    <c:if test="${!i.last}">
                                        <span>#${tag}, </span>
                                    </c:if>
                                    <c:if test="${i.last}">
                                        <span>#${tag}</span>
                                    </c:if>

                                </c:forEach>
                            </div>
                            <div class="col-4">
            <%--                    <div class="text-center d-flex justify-content-end">--%>
            <%--                        <button type="button" class="btn btn-outline-success" onclick="">목록</button>--%>
            <%--                        &nbsp;&nbsp;--%>
            <%--                        <button type="button" class="btn btn-outline-success" onclick="">등록</button>--%>
            <%--                        &nbsp;&nbsp;--%>
            <%--                        <button type="button" class="btn btn-outline-success" onclick="">수정</button>--%>
            <%--                        &nbsp;&nbsp;--%>
            <%--                        <button type="button" class="btn btn-outline-success" onclick="">삭제</button>--%>
            <%--                    </div>--%>
                            </div>
                        </div>
                        <div class="row mt-5">
                            <div class="col-4">
                            </div>
                            <div class="col-4">
                            </div>
                            <div class="col-4">
                                <div class="text-center d-flex justify-content-end">
                                    <button type="button" class="btn btn-outline-success" onclick="">목록</button>
                                    &nbsp;&nbsp;
                                    <button type="button" class="btn btn-outline-success" onclick="">등록</button>
                                    &nbsp;&nbsp;
                                    <button type="button" class="btn btn-outline-success" onclick="location.href='/main/studymodify?study_idx=${studyDTO.study_idx}'">수정</button>
                                    &nbsp;&nbsp;
                                    <button type="button" class="btn btn-outline-success" onclick="">삭제</button>
                                </div>
                            </div>
                        </div>
                    </form>
                </div>
            </div>
        </div>
    </div><!-- End Bordered Tabs -->
</div>
<script>
    let shareBtn = document.getElementById("shareBtn");
    shareBtn.addEventListener("click",function (e){
       e.preventDefault();
       this.form.action = "/main/share";
       this.form.submit();
    });
</script>
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/js/bootstrap.bundle.min.js" integrity="sha384-ka7Sk0Gln4gmtz2MlQnikT1wXgYsOg+OMhuP+IlRH9sENBO0LRn5q+8nbTov4+1p" crossorigin="anonymous"></script>
<script src="https://cdn.jsdelivr.net/npm/@popperjs/core@2.10.2/dist/umd/popper.min.js" integrity="sha384-7+zCNj/IqJ95wo16oMtfsKbZ9ccEh31eOz1HGyDuCQ6wgnyJNSYdrPa03rtR1zdB" crossorigin="anonymous"></script>
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/js/bootstrap.min.js" integrity="sha384-QJHtvGhmr9XOIpI6YVutG+2QOK9T+ZnN4kzFN1RtK3zEFEIsxhlmWl5/YESvpZ13" crossorigin="anonymous"></script>

</body>
</html>
