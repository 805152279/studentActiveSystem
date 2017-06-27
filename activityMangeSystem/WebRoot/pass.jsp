<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html lang="zh-cn">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta name="viewport" content="width=device-width, initial-scale=1.0, maximum-scale=1.0, user-scalable=no" />
<meta name="renderer" content="webkit">
<title></title>
<link rel="stylesheet" href="css/pintuer.css">
<link rel="stylesheet" href="css/admin.css">
<script src="js/jquery.js"></script>
<script src="js/pintuer.js"></script>
<script type="text/javascript" src="js/jquery-1.10.2.min.js"></script> 
  <script type="text/javascript">  
    $(function() {  
     $("#addButton").click(function() { //按钮的id名字是addButton          
        $.ajax({  
    type: "POST",  
    url: "PassAction", //这里写的是action的名字,设置了namespace会出错  
    data: {"password":$("#password").val(),"newpass": $("#neww").val()},
    dataType:"text", //ajax返回值设置为text（json格式也可用它返回，可打印出结果，也可设置成json）  
    success: function(json){    
    var obj = $.parseJSON(json);  //使用这个方法解析json  
    var state_value = obj.result;  //result是和action中定义的result变量的get方法对应的  

    if(state_value=="true"){ alert("收到成功");}
    else{ $("#tishi").show();}
    }
      });  
     });  
   });  
</script> 
</head>
<body>
<div class="panel admin-panel">
  <div class="panel-head"><strong><span class="icon-key"></span> 修改管理员密码</strong></div>
  <div class="body-content">
    <form  class="form-x" >
      <div class="form-group">
        <div class="label">
          <label for="sitename">管理员帐号：</label>
        </div>
        <div class="field">
          <label style="line-height:33px;">
           admin
          </label>
        </div>
      </div>      
      <div class="form-group">
        <div class="label">
          <label for="sitename">原始密码：</label>
        </div>
        <div class="field">
          <input type="password" class="input w50" id="password" name="userpassword" size="50" placeholder="请输入原始密码" data-validate="required:请输入原始密码" />       
        </div>
      </div>      
      <div class="form-group">
        <div class="label">
          <label for="sitename">新密码：</label>
        </div>
        <div class="field">
          <input type="password" class="input w50" id="neww" name="newpass" size="50" placeholder="请输入新密码" data-validate="required:请输入新密码,length#>=5:新密码不能小于5位" />         
        </div>
      </div>
      <div class="form-group">
        <div class="label">
          <label for="sitename">确认新密码：</label>
        </div>
        <div class="field">
          <input type="password" class="input w50" name="renewpass" size="50" placeholder="请再次输入新密码" data-validate="required:请再次输入新密码,repeat#newpass:两次输入的密码不一致" />          
        </div>
      </div>
      
      <div class="form-group">
        <div class="label">
          <label></label>         
        </div>
        <div id="tishi" style="padding:10px;"><img src="images/tan.png" alt=""><span style="font-size:26px;color:red;">原始密码错误</span></div>
        <div class="field" style="margin-left:170px;">         
        <input type="button" class="button bg-main icon-check-square-o" id="addButton" value="提交">
        </div>
      </div>      
    </form>
  </div>
</div>
</body></html>