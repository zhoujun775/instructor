<%@ page language="java" contentType="text/html; charset=utf-8"
	pageEncoding="utf-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
<head>
<style>
body {
	font: 12px "微软雅黑", Arial, Helvetica, sans-serif;
	background-img: url(../resources/images/notice_big.png);
	background-size: cover;
}

.list_table3 {
	position: absolute;
	top: 120px;
	left: 80px;
	width: 40%;
	margin: 10px auto;
	color: white;
	border-top: 1px solid #d3dbde;
	border-right: 1px solid #d3dbde;
	word-break: break-all;
	word-wrap: break-all;
}

.list_table3 #title {
	font-size: 150%;
	font-weight: bold;
	border-bottom: 0px solid #d3dbde;
	border-left: 1px solid #d3dbde;
}

.list_table3 #content {
	border-bottom: 0px solid #d3dbde;
	border-left: 1px solid #d3dbde;
	padding: 10px 20px 10px 20px;
	word-break: break-all;
	word-wrap: break-all;
}

.list_table3 #writer {
	border-bottom: 0px solid #d3dbde;
	text-align: right;
	border-left: 1px solid #d3dbde;
	padding: 10px 20px 3px 20px;
	word-break: break-all;
	word-wrap: break-all;
}

.list_table3 #time {
	text-align: right;
	border-bottom: 1px solid #d3dbde;
	border-left: 1px solid #d3dbde;
	padding: 3px 20px 10px 20px;
	word-break: break-all;
	word-wrap: break-all;
}

#back {
	position: absolute;
	font-size: 20px;
	color: white;
	top: 100px;
	left: 480px;
}

#back:hover {
	position: absolute;
	font-size: 20px;
	color: gray;
	top: 100px;
	left: 480px;
}
</style>
<title>通知</title>
<meta name="keywords" content="" />
<meta name="description" content="" />
<script src="/ins/resources/js/jquery-1.4.2.js" type="text/javascript"></script>
<script src="/ins/resources/js/js-func.js" type="text/javascript"></script>
<script src="/ins/resources/js/jquery.jcarousel.js"
	type="text/javascript"></script>
</head>
<body background="../resources/images/notice_small.png">
	<a id='back' href='/ins/admin/index.jsp'>返回主页</a>
	<table class="list_table3">

		<c:forEach items="${allNotice}" var="p">
			<tr>
				<td align="center" id="title">${p.title }</td>
			</tr>

			<tr>
				<td id="content">${p.content }</td>
			</tr>

			<tr>
				<td id="writer">${p.user.userName }</td>
			</tr>

			<tr>
				<td id="time">${p.time }</td>
			</tr>
		</c:forEach>

	</table>
</body>
</html>