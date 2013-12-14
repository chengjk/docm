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

<body>
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
				<tr>
					<th scope="row">&nbsp;</th>
					<td>&nbsp;</td>
					<td>&nbsp;</td>
					<td>
						<a>查看</a>
						<a>编辑</a>
						<a>删除</a>
					</td>
				</tr>
			</table>
		</div>
	</div>

</body>
</html>