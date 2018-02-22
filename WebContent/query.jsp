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
	<form action="/ins/user/query" method="get">
		用户名<input type="text" name="userName"> <input
			type="submit" value="查询">
	</form>

	<table border="1px">
		<tr>
			<th>用户ID</th>
			<th>用户名</th>
			<th>用户密码</th>
			<th>用户身份</th>
			<th>用户mail</th>
			<th>用户学院</th>
			<th colspan="2">操作</th>
		</tr>

		<c:forEach items="${users }" var="p">
			<tr>
				<td>${p.userID }</td>
				<td>${p.userName }</td>
				<td>${p.password }</td>
				<td>${p.identity }</td>
				<td>${p.mail }</td>
				<td>${p.academy }</td>
				<%-- <td><a href="/ssm/products/queryOne?productID=${p.productID }">更新</a></td>
				<td><a href="/ssm/products/delete?id=${p.productID }">删除</a></td> --%>
			</tr>
		</c:forEach>
	</table>

</body>
</html>