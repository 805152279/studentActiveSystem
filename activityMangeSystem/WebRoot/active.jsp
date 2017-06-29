<%@page import="com.bean.Active"%>
<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
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
jQuery.noConflict(); 
jQuery(document).ready(function(){ 
jQuery("#sortable_table,tr").click(function(){ 

	
	
var content = jQuery(this).children("td:eq(0)").text(); 
if (content != ""){ 
if(confirm("您确定要预约吗?")){
$.ajax({  
    type: "POST",  
    url: "orderAction", //这里写的是action的名字,设置了namespace会出错  
    data: {"content":content,"act":jQuery(this).children("td:eq(1)").text()},
    dataType:"text", //ajax返回值设置为text（json格式也可用它返回，可打印出结果，也可设置成json）  
    success: function(json){    
    var obj = $.parseJSON(json);  //使用这个方法解析json  
   // var state_value = obj.result;  //result是和action中定义的result变量的get方法对应的  
    alert("预约成功");
   
     
    }
      });    
} 
}
}); 


});
</script>
</head>
<body>
<form method="post" action="">
  <div class="panel admin-panel">
    <div class="panel-head"><strong class="icon-reorder">查看活动</strong></div>
 
    <table class="table table-hover text-center" id="sortable_table" >
      <tr>
        <th width="120">ID</th>
        <th>活动名称</th>       
        <th>组织者</th>
        <th>活动地点</th>
        <th>活动信息</th>
         <th width="120">开始时间</th>
        <th>操作</th>       
      
<% List<Active> actives=(List)session.getAttribute("students");
  for(Active active:actives){
	  out.print("<tr>"+
      "<td>"+active.getActiveid()+"</td>"+
	  "<td>"+active.getActivename()+"</td>"+
      "<td>"+active.getUserid()+"</td>"+
      "<td>"+active.getRoomid()+"</td>"+
      "<td>"+active.getAbstract_()+"</td>"+
      "<td>"+active.getStarttime()+"</td>"+
      "<td>"+
      "<div class=\"button-group\">"+      
      "<a class=\"button border-red\" href=\"javascript:void(0)\" onclick=\"return del(1)\"><span class=\"icon-trash-o\"></span>预约</a>"+
     "</div></td></tr>" );
  }
  %>    
     
    </table>
  </div>
</form>

</body></html>