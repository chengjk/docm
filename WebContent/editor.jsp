<%@page import="net.docm.po.MyDoc"%>
<%@page import="net.docm.dao.Dao"%>
<%@ page language="java" contentType="text/html; charset=utf-8"
	pageEncoding="utf-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8">

<title>DOCM</title>

<script type="text/javascript" charset="utf-8"
	src="ueditor135/ueditor.config.js"></script>
<script type="text/javascript" charset="utf-8"
	src="ueditor135/ueditor.all.min.js"></script>
<script type="text/javascript" charset="utf-8"
	src="ueditor135/lang/zh-cn/zh-cn.js"></script>
<link rel="shortcut icon" href="assets/bootstrap/ico/favicon.png">
<link href="assets/bootstrap/css/bootstrap.min.css" rel="stylesheet"
	media="screen">
<link href="assets/bootstrap/css/bootstrap-responsive.css"
	rel="stylesheet">
<script src="assets/jquery/jquery-1.9.1.min.js"></script>
<script src="assets/bootstrap/js/bootstrap.min.js"></script>
<style type="text/css">
.clear {
	clear: both;
}
</style>

<script type="text/javascript">
	function pageonload(){
		//alert($("#content").html());
		insertHtml($("#content").html());
		$("#btnsubmit").click(function(){
			var content=UE.getEditor('editor').getContent();
			//alert(content);
			$("#frmcontent").val(content);
			$.ajax({
				cache:true,
				url:"add.jsp",
				method:"post",
				data:$("#frmsave").serialize(),
				dataType:"text",
				success:function(data){
					//alert(data);
					window.location.href="index.jsp?backurl="+window.location.href; 
				},
				error:function(data){
					//alert(data);
					window.location.href="error.jsp?backurl="+window.location.href; 
				}
			});
			
		});
		
	}

</script>
</head>
<body onload="pageonload()">
	<%
	MyDoc doc;
	String id=request.getParameter("id");
	
	//id="1387193058065"; //test
	System.out.println(id);
	if(id==null||id==""){
		doc=new MyDoc();
	}else{
		doc= Dao.getInstance().find(id);
	}
	%>

	<div class="container">
		<div class="row-fluid" style="padding-top: 5px;">
			<form id="frmsave" action="./add.jsp" style="vertical-align: bottom;">
				<input type="hidden" name="id" value="<%=doc.getId()%>"/>
				TYPE:<input type="text" name="type" value="<%=doc.getType()%>"/>
				Key:<input type="text" name="key" value="<%=doc.getKey()%>"/>
				<input id="frmcontent" name="htmlcontent" type="hidden" value=""/>
				<button id="btnsubmit" class="btn btn-primary pull-right" type="button">提交</button>
			</form>
		</div>
		<script id="editor" type="text/plain" style="height:500px;"></script>
		<div id="content" style="display: none">
		<%=doc.getHtmltext()%>
		</div>
		
	</div>
	<div id="btns" style="display: none">
		<div>
			<button onclick="getAllHtml()">获得整个html的内容</button>
			<button onclick="getContent()">获得内容</button>
			<button onclick="setContent()">写入内容</button>
			<button onclick="setContent(true)">追加内容</button>
			<button onclick="getContentTxt()">获得纯文本</button>
			<button onclick="getPlainTxt()">获得带格式的纯文本</button>
			<button onclick="hasContent()">判断是否有内容</button>
			<button onclick="setFocus()">使编辑器获得焦点</button>
			<button onmousedown="isFocus(event)" style="color: red">new
				编辑器是否获得焦点</button>
			<button onmousedown="setblur(event)" style="color: red">new
				编辑器失去焦点</button>

		</div>
		<div>
			<button onclick="getText()">获得当前选中的文本</button>
			<button onclick="insertHtml()">插入给定的内容</button>
			<button id="enable" onclick="setEnabled()">可以编辑</button>
			<button onclick="setDisabled()">不可编辑</button>
			<button onclick=" UE.getEditor('editor').setHide()">隐藏编辑器</button>
			<button onclick=" UE.getEditor('editor').setShow()">显示编辑器</button>
			<button onclick=" UE.getEditor('editor').setHeight(300)">设置编辑器的高度为300</button>
		</div>

		<div>
			<button onclick="getLocalData()" style="color: red">new
				获取草稿箱内容</button>
			<button onclick="clearLocalData()" style="color: red">new
				清空草稿箱</button>
		</div>

	</div>
	<div style="display: none">
		<button onclick="createEditor()" />
		创建编辑器
		</button>
		<button onclick="deleteEditor()" />
		删除编辑器
		</button>
	</div>

</body>

<script type="text/javascript">
	//实例化编辑器
	var ue = UE.getEditor('editor');
	function isFocus(e) {
		alert(ue.isFocus());
		UE.dom.domUtils.preventDefault(e)
	}
	function setblur(e) {
		ue.blur();
		UE.dom.domUtils.preventDefault(e)
	}
	function insertHtml(value) {
		//var value = prompt('插入html代码', '');
		ue.execCommand('insertHtml', value);
	}
	function createEditor() {
		enableBtn();
		UE.getEditor('editor');
	}
	function getAllHtml() {
		alert(UE.getEditor('editor').getAllHtml())
	}
	function getContent() {
		var arr = [];
		arr.push("使用editor.getContent()方法可以获得编辑器的内容");
		arr.push("内容为：");
		arr.push(UE.getEditor('editor').getContent());
		alert(arr.join("\n"));
	}
	function getPlainTxt() {
		var arr = [];
		arr.push("使用editor.getPlainTxt()方法可以获得编辑器的带格式的纯文本内容");
		arr.push("内容为：");
		arr.push(UE.getEditor('editor').getPlainTxt());
		alert(arr.join('\n'))
	}
	function setContent(isAppendTo) {
		var arr = [];
		arr.push("使用editor.setContent('欢迎使用ueditor')方法可以设置编辑器的内容");
		UE.getEditor('editor').setContent('欢迎使用ueditor', isAppendTo);
		alert(arr.join("\n"));
	}
	function setDisabled() {
		UE.getEditor('editor').setDisabled('fullscreen');
		disableBtn("enable");
	}

	function setEnabled() {
		UE.getEditor('editor').setEnabled();
		enableBtn();
	}

	function getText() {
		//当你点击按钮时编辑区域已经失去了焦点，如果直接用getText将不会得到内容，所以要在选回来，然后取得内容
		var range = UE.getEditor('editor').selection.getRange();
		range.select();
		var txt = UE.getEditor('editor').selection.getText();
		alert(txt);
	}

	function getContentTxt() {
		var arr = [];
		arr.push("使用editor.getContentTxt()方法可以获得编辑器的纯文本内容");
		arr.push("编辑器的纯文本内容为：");
		arr.push(UE.getEditor('editor').getContentTxt());
		alert(arr.join("\n"));
	}
	function hasContent() {
		var arr = [];
		arr.push("使用editor.hasContents()方法判断编辑器里是否有内容");
		arr.push("判断结果为：");
		arr.push(UE.getEditor('editor').hasContents());
		alert(arr.join("\n"));
	}
	function setFocus() {
		UE.getEditor('editor').focus();
	}
	function deleteEditor() {
		disableBtn();
		UE.getEditor('editor').destroy();
	}
	function disableBtn(str) {
		var div = document.getElementById('btns');
		var btns = domUtils.getElementsByTagName(div, "button");
		for (var i = 0, btn; btn = btns[i++];) {
			if (btn.id == str) {
				domUtils.removeAttributes(btn, [ "disabled" ]);
			} else {
				btn.setAttribute("disabled", "true");
			}
		}
	}
	function enableBtn() {
		var div = document.getElementById('btns');
		var btns = domUtils.getElementsByTagName(div, "button");
		for (var i = 0, btn; btn = btns[i++];) {
			domUtils.removeAttributes(btn, [ "disabled" ]);
		}
	}

	function getLocalData() {
		alert(ue.execCommand("getlocaldata"));
	}

	function clearLocalData() {
		ue.execCommand("clearlocaldata");
		alert("已清空草稿箱")
	}
</script>
</html>