<%@ page language="java" contentType="text/html; charset=utf-8"
	pageEncoding="utf-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">

<html lang="en">
 <head>

   <link rel="stylesheet" href="/ins/resources/css/common.css">
   <link rel="stylesheet" href="/ins/resources/css/main.css">
   <script type="text/javascript" src="/ins/resources/js/jquery.min.js"></script>
   <script type="text/javascript" src="/ins/resources/js/jquery-1.4.2.js"></script>
   <script type="text/javascript" src="/ins/resources/js/colResizable-1.3.min.js"></script>
   <script type="text/javascript" src="/ins/resources/js/common.js"></script>
   
   <script type="text/javascript">
      $(function(){  
        $(".list_table").colResizable({
          liveDrag:true,
          gripInnerHtml:"<div class='grip'></div>", 
          draggingClass:"dragging", 
          minWidth:30
        }); 
        
      }); 
   </script>

  <title>insertFace</title>
 </head>
 <body>
       <div id="forms" class="mt10">
        <div class="box">
          <div class="box_border">
            <div class="box_top"><b class="pl15">增加面部照片</b></div>
            <div class="box_center">
             <form action="/ins/face/insert" class="jqtransform" enctype="multipart/form-data" method="post">
               <table class="form_table pt15 pb15" width="100%" border="0" cellpadding="0" cellspacing="0">
                 <tr>
                 <td class="td_right">用户名：</td>
								<td><select id="userID" class="select" name="user.userID">
										
								</select></td>
				  </tr>
				   <tr>
                  <td class="td_right">照片名称：</td><td><input type="text" name="faceName" class="input-text lh30" size="40"></td>
                </tr>
				 <tr>
				 	<td class="td_right">上传图片：</td>
				 	<td><input type="file" name="photo" ></td>
				 </tr>
                
                 <tr>
                   <td class="td_right">&nbsp;</td>
                   <td class="">
                     <input type="submit" name="button" class="btnn btnn82 btnn_save2" onclick="" value="提交"> 
                    <input type="reset" name="button" class="btnn btnn82 btnn_res" value="重置"> 
                   </td>
                 </tr>
               </table>
               </form>
            </div>
          </div>
        </div>
     </div>
 </body>
 <script>

        $(document).ready(function(){
            $.ajax({
                contentType : "application/json;charset=utf-8",
                type : "POST",
                url : "/ins/user/queryAllUser",
                dataType : "json",
                success : function(data) {
                    $.each(data, function(i, user) {
                        $('#userID').append(
                                $('<option>').text(user.userName).attr('value',
                                        user.userID));
                    });
                }
            });
        });

    </script>
 
</html>
