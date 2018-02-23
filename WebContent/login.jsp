<%@ page language="java" contentType="text/html; charset=utf-8"
	pageEncoding="utf-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
<head>
<title>3D虚拟辅导员登录</title> 
<link href="/ins/resources/css/login.css" type="text/css" rel="stylesheet"> 
</head> 
<body> 

<div class="login">
    <div class="message">3D虚拟辅导员登录</div>
    <div id="darkbannerwrap"></div>
    
    <form action="/ins/user/login" method="get">
		
		<input name="userName" placeholder="用户名"  type="text">
		<hr class="hr15">
		<input name="password" placeholder="密码"  type="password">
		<center><hr class="hr15" ><p>
		<select name="identity" class="select" size="1">
				<option value="0">学生</option>
				<option value="1">管理员</option></select></p>
				</center>
		<hr class="hr15">
		
		<input value="登录" style="width:100%;" type="submit">
		<hr class="hr20">
		<p align="right">没有账号？请<a href = "">注册账号</a></p>
		
	</form>

</div>

<div class="copyright">made by <a href="#" target="_blank">v_team</a></div>

</body>
</html>
