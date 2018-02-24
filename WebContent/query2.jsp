<%@ page language="java" contentType="text/html; charset=utf-8"
	pageEncoding="utf-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
<title>Insert title here</title>
</head>
<body>
	<form action="/ins/face/query" method="get">
		用户名<input type="text" name="user.userName">
		照片名<input type="text" name="faceName">
		 <input type="submit" value="查询">
	</form>

	<table border="1px">
		<tr>
			<th>照片ID</th>
			<th>照片名</th>
			<th>照片缩略图</th>
			<th>url</th>
			<th>用户ID</th>
			<th>用户名</th>
			<th colspan="2">操作</th>
		</tr>

		<c:forEach items="${faces }" var="p">
			<tr>
				<td>${p.faceID }</td>
				<td>${p.faceName }</td>
				<td><img src="${p.url }" width="40px" height="50px"/></td>
				<td>${p.url }</td>
				<td>${p.user.userID }</td>
				<td>${p.user.userName }</td>
			</tr>
		</c:forEach>
	</table>

</body>
</html>