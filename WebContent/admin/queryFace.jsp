<%@ page language="java" contentType="text/html; charset=utf-8"
	pageEncoding="utf-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">

<html lang="en">
<head>
<link rel="stylesheet" href="/ins/resources/css/mycss.css">
<link rel="stylesheet"
	href="http://cdn.static.runoob.com/libs/bootstrap/3.3.7/css/bootstrap.min.css">
<link rel="stylesheet" href="/ins/resources/css/common.css">
<link rel="stylesheet" href="/ins/resources/css/main.css">
<script
	src="http://cdn.static.runoob.com/libs/jquery/2.1.1/jquery.min.js"></script>
<script
	src="http://cdn.static.runoob.com/libs/bootstrap/3.3.7/js/bootstrap.min.js"></script>
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

<title>queryFace</title>
</head>
<body>
	<div id="forms" class="mt10">
		<div class="box">
			<div class="box_border">
				<div class="box_top">
					<b class="pl15">查询用户面部信息</b>
				</div>
				<div class="box_center">
					<form action="/ins/face/query" class="jqtransform" method="get">
						<table class="form_table pt15 pb15" width="100%" border="0"
							cellpadding="0" cellspacing="0">
							<tr>
								<td class="td_right">用户名：</td>
								<td class=""><input type="text" name="user.userName"
									class="input-text lh30" size="40"></td>
							</tr>

							<tr>
								<td class="td_right">&nbsp;</td>
								<td class=""><input type="submit" name="button"
									class="btnn btnn82 btnn_save2" value="查询"> <input
									type="reset" name="button" class="btnn btnn82 btnn_res"
									value="重置"></td>
							</tr>
						</table>
					</form>

					<table width='100%' border='0' cellpadding='0' cellspacing='0'
						class='list_table'>
						<tr>
							<th width='10%'>照片ID</th>
							<th width='10%'>照片名</th>
							<th width='20%'>照片缩略图</th>
							<th width='20%'>url</th>
							<th width='10%'>用户ID</th>
							<th width='10%'>用户名</th>
							<th colspan="1">操作</th>
						</tr>

						<c:forEach items="${faces }" var="p">
							<tr class='tr'>
								<td class='td_center'>${p.faceID }</td>
								<td class='td_center'>${p.faceName }</td>
								<td class='td_center'><img src="${p.url }" width="40px"
									height="50px" /></td>
								<td class='td_center'>${p.url }</td>
								<td class='td_center'>${p.user.userID }</td>
								<td class='td_center'>${p.user.userName }</td>

								<td class='td_center'>
									<button data-toggle="modal" class="button red"
										data-target="#${p.faceID}d" value="delete">删除</button>
								</td>
							</tr>

						

							<!--       delete的调用模态框   -->
							<div class="modal fade" id="${p.faceID}d" tabindex="-1"
								role="dialog" aria-labelledby="myModalLabel" aria-hidden="true">
								<div class="modal-dialog">
									<div class="modal-content">
										<div class="modal-header">
											<button type="button" class="close" data-dismiss="modal"
												aria-hidden="true">&times;</button>
											<h4 class="modal-title" id="myModalLabel">确认删除</h4>
										</div>
										<div class="modal-body">
											<form role="form" action="/ins/face/delete" method="get">
												<div class="form-group">
													<input type="hidden" class="form-control" name="faceID"
														value="${p.faceID}"> <label>确定要删除此条记录吗？</label>
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
