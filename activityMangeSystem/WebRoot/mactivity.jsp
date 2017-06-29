
<%@page import="com.bean.Canjia"%>
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
    <script type="text/javascript" src="js/jquery-1.10.2.min.js"></script> 
    <script type="text/javascript">
jQuery.noConflict(); 
jQuery(document).ready(function(){ 
jQuery("#sortable_table,tr").click(function(){ 
var content = jQuery(this).children("td:eq(0)").text(); 
if (content != ""){ 
if(confirm("您确定要取消吗?")){
$.ajax({  
    type: "POST",  
    url: "Cancel", //这里写的是action的名字,设置了namespace会出错  
    data: {"content":content},
    dataType:"text", //ajax返回值设置为text（json格式也可用它返回，可打印出结果，也可设置成json）  
    success: function(json){    
    var obj = $.parseJSON(json);  //使用这个方法解析json  
   // var state_value = obj.result;  //result是和action中定义的result变量的get方法对应的  
    alert("取消成功");
   
     location.reload();
    }
      });    
} 
}
}); 
});
</script>
</head>
<body>
<div class="panel admin-panel">
  <table class="table table-hover text-center">
    <tr>
      <th width="15%">活动ID</th> 
      <th >活动名称</th>     
      <th>预约时间</th>           
      <th width="250">操作</th>
    </tr>
   
    <%   
	List<Canjia> students=(List)session.getAttribute("students");
 for(Canjia user:students){
	  out.print("<tr>"+
      "<td>"+user.getActiveid()+"</td>"+
	  "<td>"+user.getAvtivename()+"</td>"+
      "<td>"+user.getTime()+"</td>"+
      "<td>"+
      "<div class=\"button-group\">"+
      "<a class=\"button border-red\" href=\"javascript:void(0)\" onclick=\"return del(17)\"><span class=\"icon-trash-o\"></span>取消预约</a>"+
     "</div></td></tr>" );
  }
  %>
    

    
  </table>
</div>



</body></html>