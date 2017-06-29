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
    <title>登录</title>  
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
    url: "LoginAction", //这里写的是action的名字,设置了namespace会出错  
    data: {"id":$("#idd").val(),"password": $("#mima").val(),"yanzheng": $("#yanzhengma").val()},
    dataType:"text", //ajax返回值设置为text（json格式也可用它返回，可打印出结果，也可设置成json）  
    success: function(json){    
    var obj = $.parseJSON(json);  //使用这个方法解析json  
    var state_value = obj.result;  //result是和action中定义的result变量的get方法对应的  
    var lev=obj.level;
    if(state_value=="no"){$("#yshi").show();return;}
    if(state_value=="true"){ 
    if(lev=="1"){
    window.location.href ='admin.jsp'}    
    else window.location.href ='user.jsp'
    }
    else{
    $("#tishi").show();
        }
    }
      });  
     });  
   });  
</script>
<script type="text/javascript">
        function addEvent(element,e,fn) {
            //firefox使用addEventListener，来添加事件
            if(element.addEventListener) {
                element.addEventListener(e,fn,false);
            }
            //ie使用attachEvent，来添加事件
            else {
                element.attachEvent("on"+e,fn);
            }
        }
        window.onload = function(){
            var checked=document.getElementById("yanzhengma");
            addEvent(checked,"input",check);
        }
       function check(){
    	   $.ajax({
    		   type:"POST",
    		   url:"CheckAction",
    		   data:{"id":$("#idd").val(),"password": $("#mima").val(),"yanzheng": $("#yanzhengma").val()},
    		   dataType:"text",
    		   success:function(json){
    			   var obj=$.parseJSON(json);
    			   var checkr=obj.result;
    			   if(checkr=="no"){$("#yshi").show();return;}
    			   if(checkr=="check"){$("#yshi").hide();return;}
    		   }
    	   });
       }
    </script>
</head>
<body>
<div class="bg">
</div>
</div>
<div class="container">
    <div class="line bouncein">
        <div class="xs6 xm4 xs3-move xm4-move">
            <div style="height:80px;"></div>
            <div class="media media-y margin-big-bottom">           
            </div>         
            <form>
            <div class="panel loginbox">
                <div class="text-center margin-big padding-big-top"><h1>登录平台</h1></div>
                <div class="panel-body" style="padding:30px; padding-bottom:10px; padding-top:10px;">
               
                    <div class="form-group">
                        <div class="field field-icon-right">
                            <input type="text" class="input input-big" id="idd" name="userid" placeholder="登录账号" data-validate="required:请填写账号" />
                            <span class="icon icon-user margin-small"></span>
                            
                        </div>
                    </div>
                    <div class="form-group">
                        <div class="field field-icon-right">
                            <input type="password" class="input input-big" id="mima"name="userpassword" placeholder="登录密码" data-validate="required:请填写密码" />
                            <span class="icon icon-key margin-small"></span>
                        </div>
                    </div>
                    <div class="form-group">
                        <div class="field">
                            <input type="text" id="yanzhengma"class="input input-big" name="code" placeholder="填写右侧的验证码" data-validate="required:请填写右侧的验证码" />
                           <img src="kaptcha.jpg" alt="" width="100" height="32" class="passcode" style="height:43px;cursor:pointer;" onclick="this.src=this.src+'?'">  
                                                   
                        </div>
                    </div>
                </div>
               
              <br />
              <div id="tishi" style="margin-left:70px;"><img src="images/tan.png" alt=""><span style="font-size:26px;color:red;">用户名或密码错误</span></div>
              <div id="yshi" style="margin-left:70px;"><img src="images/tan.png" alt=""><span style="font-size:26px;color:red;">验证码错误</span></div>
              <div style="padding:20px;">
                            <input type="button" id="addButton" class="button button-block bg-main text-big input-big" value="登录"></div>
            </div>
            </form>          
        </div>
    </div>
</div>

</body>
</html>