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
	src="ueditor135/ueditor.all.min.js">
	
</script>
<script type="text/javascript" charset="utf-8"
	src="ueditor135/lang/zh-cn/zh-cn.js"></script>
<style type="text/css">
.clear {
	clear: both;
}
</style>
</head>
<body>
	<div class="container">
		<script id="editor" type="text/plain"
			style="width:1024px;height:500px;"></script>
	</div>
	<div id="btns">
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
	<div>
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
	function insertHtml() {
		var value = prompt('插入html代码', '');
		ue.execCommand('insertHtml', value)
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
		alert(txt)
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