<%@ page language="java" contentType="text/html; charset=utf-8"
	pageEncoding="utf-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">

<html lang="en">
 <head>

    <link rel="stylesheet" href="/ins/resources/css/common.css">
   <link rel="stylesheet" href="/ins/resources/css/main.css">
   <script type="text/javascript" src="/ins/resources/js/jquery.min.js"></script>
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
  <title>insertNotice</title>
 </head>
 <body>
       <div id="forms" class="mt10">
        <div class="box">
          <div class="box_border">
            <div class="box_top"><b class="pl15">发布通知</b></div>
            <div class="box_center">
              <form action="/ins/notice/insert" class="jqtransform" method="get">
               <table class="form_table pt15 pb15" width="100%" border="0" cellpadding="0" cellspacing="0">
                 <tr>
                  <td class="td_right">通知标题：</td>
                  <td class=""> 
                    <input type="text" name="title" class="input-text lh30" size="40">
                  </td>
				  </tr>
				  <tr>
                  <td class="td_right">通知内容：</td><td><textarea  name="content" class="textarea"></textarea></td>
                </tr>
                <tr>
                  <td> 
                    <input type="hidden" name="user.userID" class="input-text lh30" size="40" value="${sessionScope.user.userID}">
                  </td>
				  </tr>
                
                
                
                 <tr>
                   <td class="td_right">&nbsp;</td>
                   <td class="">
                     <input type="submit" name="button" class="btnn btnn82 btnn_save2" value="发布"> 
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
</html>
