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

<title>queryNotice</title>
</head>
<body>
	<div id="forms" class="mt10">
		<div class="box">
			<div class="box_border">
				<div class="box_top">
					<b class="pl15">查询通知</b>
				</div>
				<div class="box_center">
					<form action="/ins/notice/query" class="jqtransform" method="get">
						<table class="form_table pt15 pb15" width="100%" border="0"
							cellpadding="0" cellspacing="0">
							<tr>
								<td class="td_right">标题关键字：</td>
								<td class=""><input type="text" name="title"
									class="input-text lh30" size="40"></td>
							</tr>
							
							<tr>
								<td class="td_right">内容关键字：</td>
								<td class=""><input type="text" name="content"
									class="input-text lh30" size="40"></td>
							</tr>

							<tr>
								<td class="td_right">发布者：</td>
								<td class=""><input type="text" name="user.userName"
									class="input-text lh30" size="40"></td>
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
							<th width='5%'>通知ID</th>
							<th width='15%'>通知标题</th>
							<th width='30%'>通知内容</th>
							<th width='15%'>发布时间</th>
							<th width='10%'>发布人</th>
							<th colspan="2">操作</th>
						</tr>

						<c:forEach items="${notices }" var="p">
							<tr class='tr'>
								<td class='td_center'>${p.noticeID }</td>
								<td class='td_center'>${p.title }</td>
								<td class='td_center'>${p.content }</td>
								<td class='td_center'>${p.time }</td>
								<td class='td_center'>${p.user.userName }</td>
								<td class='td_center'><button type="button" class="button blue" data-toggle="modal"
										data-target="#${p.noticeID}a">编辑</button></td>
								<td class='td_center'>	<button data-toggle="modal" class="button red" data-target="#${p.noticeID}d"
						value="delete">删除</button></td>
								
							</tr>
							
							<!-- 	update的调用模态框 -->
							<div class="modal fade" id="${p.noticeID}a" tabindex="-1"
								role="dialog" aria-labelledby="myModalLabel" aria-hidden="true">
								<div class="modal-dialog">
									<div class="modal-content">
										<div class="modal-header">
											<button type="button" class="close" data-dismiss="modal"
												aria-hidden="true">&times;</button>
											<h4 class="modal-title" id="myModalLabel">修改信息</h4>
										</div>
										<div class="modal-body">
											<form role="form" action="/ins/notice/update"
												method="get">
												<div class="form-group">
													<label for="id">通知id</label> <input type="text"
														class="form-control" name="noticeID" value="${p.noticeID}"
														readonly> <label for="name">标题</label> <input
														type="text" class="form-control" name="title"
														value="${p.title}"> <label for="password">内容</label>
														<textarea class="form-control" name="content" >${p.content }</textarea>
													
													<input type="hidden" class="form-control" name="user.userID"
														value="${sessionScope.user.userID}">
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
							<div class="modal fade" id="${p.noticeID}d" tabindex="-1"
								role="dialog" aria-labelledby="myModalLabel" aria-hidden="true">
								<div class="modal-dialog">
									<div class="modal-content">
										<div class="modal-header">
											<button type="button" class="close" data-dismiss="modal"
												aria-hidden="true">&times;</button>
											<h4 class="modal-title" id="myModalLabel">确认删除</h4>
										</div>
										<div class="modal-body">
											<form role="form" action="/ins/notice/delete"
												method="get">
												<div class="form-group">
													<input type="hidden" class="form-control" name="noticeID"
														value="${p.noticeID}"> <label>确定要删除此条记录吗？</label>
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
