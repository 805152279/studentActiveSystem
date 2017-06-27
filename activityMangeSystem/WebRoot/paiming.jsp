<%@page import="com.bean.Active"%>
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
  <table class="table table-hover text-center">
    <tr>
      <th width="15%">排名</th> 
      <th >活动名称</th>     
      <th>票数</th>           
      <th width="250">操作</th>
    </tr>
   
    <%
     int i=1;
	 List<Active> actives=(List)session.getAttribute("students");
  for(Active active:actives){
	  out.print("<tr>"+
	  "<td>"+i+"</td>"+
      "<td>"+active.getActivename()+"</td>"+
	  "<td>"+active.getNumber()+"</td>"+      
      "<td>"+
      "<div class=\"button-group\">"+
      "<a type=\"button\" class=\"button border-main\" href=\"#\"><span class=\"icon-edit\"></span>修改</a>"+
      "<a class=\"button border-red\" href=\"javascript:void(0)\" onclick=\"return del(17)\"><span class=\"icon-trash-o\"></span> 删除</a>"+
     "</div></td></tr>" );
     i++;
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