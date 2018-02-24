<%@ page language="java" contentType="text/html; charset=utf-8"
	pageEncoding="utf-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">

<html lang="en">
<head>
<link rel="stylesheet" href="/ins/resources/css/mycss.css">
<link rel="stylesheet" href="http://cdn.static.runoob.com/libs/bootstrap/3.3.7/css/bootstrap.min.css">
<link rel="stylesheet" href="/ins/resources/css/common.css">
<link rel="stylesheet" href="/ins/resources/css/main.css">
<script src="http://cdn.static.runoob.com/libs/jquery/2.1.1/jquery.min.js"></script>
<script src="http://cdn.static.runoob.com/libs/bootstrap/3.3.7/js/bootstrap.min.js"></script>
<script type="text/javascript" src="/ins/resources/js/jquery.min.js"></script>
<script type="text/javascript"
	src="/ins/resources/js/colResizable-1.3.min.js"></script>
<script type="text/javascript" src="/ins/resources/js/common.js"></script>

<script type="text/javascript">
	$(function() {
		$(".list_table").colResizable({
			liveDrag : true,
			gripInnerHtml : "<div class='grip'></div>",
			draggingClass : "dragging",
			minWidth : 30
		});

	});
</script>

<title>queryUser</title>
</head>
<body>
	<div id="forms" class="mt10">
		<div class="box">
			<div class="box_border">
				<div class="box_top">
					<b class="pl15">查询用户</b>
				</div>
				<div class="box_center">
					<form action="/ins/user/query2" class="jqtransform" method="get">
						<table class="form_table pt15 pb15" width="100%" border="0"
							cellpadding="0" cellspacing="0">
							<tr>
								<td class="td_right">用户名：</td>
								<td class=""><input type="text" name="userName"
									class="input-text lh30" size="40"></td>
							</tr>

							<tr>
								<td class="td_right">用户权限：</td>
								<td><select class="select" name="identity">
										<option value="-1">所有权限</option>
										<option value="0">学生</option>
										<option value="1">辅导员</option>
								</select></td>
							</tr>

							<tr>
								<td class="td_right">&nbsp;</td>
								<td class=""><input type="submit" name="button"
									class="btnn btnn82 btnn_save2" value="查询"> <input
									type="reset" name="button" class="btnn btnn82 btnn_res" value="重置">
								</td>
							</tr>
						</table>
					</form>

					<table width='100%' border='0' cellpadding='0' cellspacing='0'
						class='list_table'>
						<tr>
							<th width='10%'>用户ID</th>
							<th width='10%'>用户名</th>
							<th width='15%'>密码</th>
							<th width='15%'>学院</th>
							<th width='20%'>邮箱</th>
							<th width='10%'>权限</th>
							<th colspan="2">操作</th>
						</tr>

						<c:forEach items="${users }" var="p">
							<tr class='tr'>
								<td class='td_center'>${p.userID }</td>
								<td class='td_center'>${p.userName }</td>
								<td class='td_center'><c:if test="${p.identity==1 }">
								------
								</c:if> <c:if test="${p.identity==0 }">
								${p.password }
								</c:if></td>
								<td class='td_center'>${p.academy }</td>
								<td class='td_center'>${p.mail }</td>
								<td class='td_center'><c:if test="${p.identity==0 }">学生</c:if>
									<c:if test="${p.identity==1 }">辅导员</c:if></td>
								<c:if test="${p.identity==0 }">
								<td class='td_center'><button type="button" class="button blue" data-toggle="modal"
										data-target="#${p.userID}a">编辑</button></td>
								<td class='td_center'>	<button data-toggle="modal" class="button red" data-target="#${p.userID}d"
						value="delete">删除</button></td>
									
								</c:if>
								<c:if test="${p.identity==1 }">
									<td class='td_center' colspan="2">------</td>
								</c:if>
							</tr>

							<!-- 	update的调用模态框 -->
							<div class="modal fade" id="${p.userID}a" tabindex="-1"
								role="dialog" aria-labelledby="myModalLabel" aria-hidden="true">
								<div class="modal-dialog">
									<div class="modal-content">
										<div class="modal-header">
											<button type="button" class="close" data-dismiss="modal"
												aria-hidden="true">&times;</button>
											<h4 class="modal-title" id="myModalLabel">修改信息</h4>
										</div>
										<div class="modal-body">
											<form role="form" action="/ins/user/update"
												method="get">
												<div class="form-group">
													<label for="id">用户id</label> <input type="text"
														class="form-control" name="userID" value="${p.userID}"
														readonly> <label for="name">用户名</label> <input
														type="text" class="form-control" name="userName"
														value="${p.userName}"> <label for="password">密码</label>
													<input type="text" class="form-control" name="password"
														value="${p.password}"> <label for="academy">学院</label>
													<input type="text" class="form-control" name="academy"
														value="${p.academy}">
														<label for="mail">邮箱</label>
													<input type="text" class="form-control" name="mail"
														value="${p.mail}">
												</div>
												<div class="modal-footer">
													<button type="button" class="button white"
														data-dismiss="modal">关闭</button>
													<button type="submit" class="button blue">提交更改</button>
												</div>
											</form>
										</div>
									</div>
								</div>
							</div>

							<!--       delete的调用模态框   -->
							<div class="modal fade" id="${p.userID}d" tabindex="-1"
								role="dialog" aria-labelledby="myModalLabel" aria-hidden="true">
								<div class="modal-dialog">
									<div class="modal-content">
										<div class="modal-header">
											<button type="button" class="close" data-dismiss="modal"
												aria-hidden="true">&times;</button>
											<h4 class="modal-title" id="myModalLabel">确认删除</h4>
										</div>
										<div class="modal-body">
											<form role="form" action="/ins/user/delete"
												method="get">
												<div class="form-group">
													<input type="hidden" class="form-control" name="userName"
														value="${p1.userId}"> <label>确定要删除此条记录吗？</label>
												</div>
												<div class="modal-footer">
													<button type="button" class="btn btn-default"
														data-dismiss="modal">关闭</button>
													<button type="submit" class="btn btn-danger">确定删除</button>
												</div>
											</form>
										</div>
									</div>
								</div>
							</div>

						</c:forEach>

					</table>
				</div>
			</div>
		</div>
	</div>


</body>

</html>
