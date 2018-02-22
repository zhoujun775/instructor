<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
<script src="/ins/resources/js/jquery.min.js"></script>
<style>
      #canvas,#video {
        float: left;  
        margin-right: 10px;  
        background: #fff;  
      }      
      .box {  
        overflow: hidden;  
        margin-bottom: 10px;  
      }
    </style>
</head>
<body>
 <div class="box">
      <video id="video" width="400" height="300"></video>
      <canvas id="canvas"></canvas>
    </div>
    <button id="live">打开摄像头</button>
    <button id="snap">开始人脸识别</button>
    <script>  
   	  var imageDataB64="";
      var video = document.getElementById('video');
      var canvas = document.getElementById('canvas');  
      var ctx = canvas.getContext('2d');  
      var width = video.width;  
      var height = video.height;  
      canvas.width = width;  
      canvas.height = height;   
      function liveVideo(){  
        var URL = window.URL || window.webkitURL;   // 获取到window.URL对象
        navigator.getUserMedia({  
          video: true  
        }, function(stream){  
          video.src = URL.createObjectURL(stream);   // 将获取到的视频流对象转换为地址
          video.play();   // 播放
          //点击截图     
          document.getElementById("snap").addEventListener('click', function() {  
            ctx.drawImage(video, 0, 0, width, height);  
            var url = canvas.toDataURL('image/png');  
            /* console.log(url); */
            imageDataB64 = url.substring(22);
            /* alert(imageDataB64); */
            document.getElementById('canvas').href = url;
            testFace();
          });
        }, function(error){  
          console.log(error.name || error);  
        });  
      }  
      document.getElementById("live").addEventListener('click',function(){  
        liveVideo();  
      });    
      

       function testFace(){
    	  $.ajax({
    		  data:{"img":imageDataB64,"id":1},
    		  type:"POST",
    		  url:"/ins/face/faceRec",
    		  dataType:"json",
    		  success:function(data){
    			  if(data.similarity>80){
    				  alert("识别成功！您的相似度为："+data.similarity);
    			  }
    			  else{
    				  alert("识别失败！您的相似度为："+data.similarity);
    			  }
    			  console.log(data);
    		  }
    	  });
      } 
       
    </script>
</body>
</html>