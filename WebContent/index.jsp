<%@page import="java.util.Iterator"%>
<%@page import="net.docm.po.MyFile"%>
<%@page import="net.docm.po.MyDoc"%>
<%@page import="net.docm.dao.Dao"%>
<%@ page language="java" contentType="text/html; charset=utf-8"
	pageEncoding="utf-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
<title>DOCM</title>

<link rel="shortcut icon" href="assets/bootstrap/ico/favicon.png">
<link href="assets/bootstrap/css/bootstrap.min.css" rel="stylesheet"
	media="screen">
<link href="assets/bootstrap/css/bootstrap-responsive.css"
	rel="stylesheet">
<script src="assets/jquery/jquery-1.9.1.min.js"></script>
<script src="assets/bootstrap/js/bootstrap.min.js"></script>
<style type="text/css">
	a:hover {color: #5e5e5e;text-decoration: underline;cursor: pointer;}
</style>
</head>

<script type="text/javascript">
function pageonload(){
	$("tr a").click(function(){
		var type=$(this).attr("name");
		if(type=="view"){
			$("#frmGoEditor input").val($(this).attr("recordid"));
			$("#frmGoEditor").submit();
		}else if(type=="edit"){
			$("#frmGoEditor input").val($(this).attr("recordid"));
			$("#frmGoEditor").submit();
		}else if(type=="delete"){
			$.ajax({
				cache:true,
				url:"./delete.jsp",
				data:"id="+$(this).attr("recordid"),
				dataType:"text",
				method:"get",
				success:function(data){
					//alert(data);
					javascript:window.top.location.reload();
				},
				error:function(data){
					//alert(data);
					javascript:window.top.location.reload();
				}
			});
			
			
		}
		
	});
}
</script>
<body onload="pageonload()">
	<%
	
  //Dao.getInstance().deleteAllDoc();
	
// 	MyDoc doc=new MyDoc();
// 	doc.setKey("key");
// 	doc.setType("txt");
// 	doc.setHtmltext("<p>test</p>");
// 	dao.save(doc);
	Iterable<MyDoc> docs=Dao.getInstance().findAllDoc();
	Iterator<MyDoc> itd=docs.iterator();
	MyDoc d;

	Iterable<MyFile> files=Dao.getInstance().findAllFile();
	%>
	<div class="container">
		<div class="row">
			<a class="btn btn-primary " href="./editor.jsp">新建</a>
		</div>
		<div class="row">
			<table border="1" style="border-collapse: separate;"
				class="table table-striped">
				<caption>文档列表</caption>
				<tr>
					<th scope="col">序号</th>
					<th scope="col">名称</th>
					<th scope="col">关键字</th>
					<th scope="col">操作</th>
				</tr>
				<% while(itd.hasNext()){
					d=itd.next();
					%>
				<tr>
					<th scope="row"><%=d.getId()%></th>
					<td><%=d.getType()%></td>
					<td><%=d.getKey()%></td>
					<td>
						<a recordid="<%=d.getId()%>" name="view">查看</a>
						<a recordid="<%=d.getId()%>" name="edit">编辑</a>
						<a recordid="<%=d.getId()%>" name="delete">删除</a>
					</td>
				</tr>
				<%} %>
			</table>
		</div>
	</div>
	<form id="frmGoEditor" action="./editor.jsp" method="get" target="_blank">
		<input name="id" type="hidden"/>
	</form>

</body>
</html>