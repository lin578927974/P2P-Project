<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>系统管理</title>
<link rel="stylesheet" type="text/css" href="../css/site.css"/>
<link rel="stylesheet" type="text/css" href="../css/themes/blue/easyui.css"/>
<script src="../js/jquery-1.8.2.min.js" type="text/javascript"></script>
<script src="../js/easyui/jquery.easyui.min-1.3.2.js" type="text/javascript"></script>
<script src="../js/jquery.tree.js" type="text/javascript"></script>
<script src="../js/SysIndex.js" type="text/javascript"></script>
</head>
<body style="width:100%;height:100%">
	<!-- 头部 -->
	<div style="height:60px;">
	</div>
	
	<!-- 中部布局 -->
	<div style="width:100%;height:100%">
		<div class="easyui-layout" style="width:100%;height:100%">
			<div data-options="region:'west',title:'菜单列表',split:true" style="width:200px;">
				<div id="RightTree" style="background-color: #fff;">
		            <div class="panel-loading">加载中...</div>
		        </div>
			</div>
			<div data-options="region:'center',title:'首页',">
			</div>
		</div>
	</div>
	<!-- 底部 -->
	<div style="height:30px;">
	</div>
</body>
</html>