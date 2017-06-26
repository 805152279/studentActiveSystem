<%@ page language="java" import="java.util.*" contentType="text/html; charset=utf-8"%>
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
    <title>管理平台</title>  
    <link rel="stylesheet" href="css/pintuer.css">
    <link rel="stylesheet" href="css/admin.css">
    <script src="js/jquery.js"></script>   
</head>
<body style="background-color:#f2f9fd;">
<div class="header bg-main">
  <div class="logo margin-big-left fadein-top">
    <h1><img src="images/2.jpg" class="radius-circle rotate-hover" height="50" alt="" />管理员界面</h1>
  </div>
  <div class="head-l"><a class="button button-little bg-green" href="" target="_blank"><span class="icon-home"></span> 前台首页</a> &nbsp;&nbsp;<a href="##" class="button button-little bg-blue"><span class="icon-wrench"></span> 清除缓存</a> &nbsp;&nbsp;<a class="button button-little bg-red" href="login.jsp"><span class="icon-power-off"></span> 退出登录</a> </div>
</div>
<div class="leftnav">
  <div class="leftnav-title"><strong><span class="icon-list"></span>菜单列表</strong></div>
  <h2><span class="icon-user"></span>基本设置</h2>
  <ul style="display:block">
    <li><a href="mclassroom.jsp" target="right"><span class="icon-caret-right"></span>规划教室</a></li>
    <li><a href="mactivity.jsp" target="right"><span class="icon-caret-right"></span>管理活动</a></li>
    <li><a href="page.html" target="right"><span class="icon-caret-right"></span>管理通知</a></li>  
    <li><a href="mstu.jsp" target="right"><span class="icon-caret-right"></span>管理学生</a></li>   
    <li><a href="book.html" target="right"><span class="icon-caret-right"></span>管理活动</a></li>     
    <li><a href="paiming.jsp" target="right"><span class="icon-caret-right"></span>活动排名</a></li>
    <li><a href="pass.jsp" target="right"><span class="icon-caret-right"></span>修改密码</a></li>
  </ul>   
</div>
<script type="text/javascript">
$(function(){

  $(".leftnav ul li a").click(function(){
	    $("#a_leader_txt").text($(this).text());
  		$(".leftnav ul li a").removeClass("on");
		$(this).addClass("on");
  })
});
</script>
<ul class="bread">
  <li><a href="{:U('Index/info')}" target="right" class="icon-home"> 首页</a></li>
  <li><a href="##" id="a_leader_txt">规划教室</a></li>
</ul>
<div class="admin">
  <iframe scrolling="auto" rameborder="0" src="mclassroom.jsp" name="right" width="100%" height="100%"></iframe>
</div>
<div style="text-align:center;">
</div>
</body>
</html>
