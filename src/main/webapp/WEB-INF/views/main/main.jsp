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
        });
    });
</script>
</body>
</html>
