<%@page import="com.bean.User"%>
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
    <meta name="viewport" c	ontent="width=device-width, initial-scale=1.0, maximum-scale=1.0, user-scalable=no" />
    <meta name="renderer" content="webkit">
    <title>网站信息</title>  
    <link rel="stylesheet" href="css/pintuer.css">
    <link rel="stylesheet" href="css/admin.css">
    <script src="js/jquery.js"></script>
    <script src="js/pintuer.js"></script>  
</head>
<body>
<div class="panel admin-panel">
  <div class="panel-head"><strong class="icon-reorder"> 内容列表</strong></div>
  <div class="padding border-bottom">  
  <a class="button border-yellow" href=""><span class="icon-plus-square-o"></span> 添加内容</a>
  <input type="text" placeholder="请输入搜索关键字" name="keywords" class="input" style="left-margin:20px;width:250px; line-height:17px;display:inline-block" />
          <a href="javascript:void(0)" class="button border-main icon-search" onclick="changesearch()" > 搜索</a>
  </div> 
  <table class="table table-hover text-center">
  
    <tr>
      <th width="5%">ID</th>     
      <th>栏目名称</th>  
      <th>排序</th>     
      <th width="250">操作</th>
    </tr>
  <%
	 List<User> students=(List)session.getAttribute("students");
  for(User user:students){
	  out.print("<tr>"+
      "<td>"+user.getUserid()+"</td>"+
	  "<td>"+user.getUsername()+"</td>"+
      "<td>"+user.getUserpassword()+"</td>"+
      "<td>"+
      "<div class=\"button-group\">"+
      "<a type=\"button\" class=\"button border-main\" href=\"#\"><span class=\"icon-edit\"></span>修改</a>"+
      "<a class=\"button border-red\" href=\"javascript:void(0)\" onclick=\"return del(17)\"><span class=\"icon-trash-o\"></span> 删除</a>"+
     "</div></td></tr>" );
  }
  %>
    
  </table>
</div>
<script>
function del(id){
	if(confirm("您确定要删除吗?")){
		
	}
}
</script>


</body></html>