<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
<head>
<title></title>
<link rel="stylesheet" type="text/css" href="../resource/Styles/bootstrap.min.css" />
<link rel="stylesheet" type="text/css" href="../resource/Styles/admin-all.css" />
<script type="text/javascript" src="../resource/js/jquery-1.7.2.js"></script>
<script type="text/javascript" src="../resource/js/jquery-ui-1.8.22.custom.min.js"></script>
<link rel="stylesheet" type="text/css" href="../resource/Styles/ui-lightness/jquery-ui-1.8.22.custom.css" />
<script type="text/javascript" src="../resource/js/ajax.js"></script>
<script type="text/javascript">
	$(function() {
		$('.modal').show();
		init();
		$("#find").click(function() {
			var menuCode = $("#menuCode").val();
			var menuName = $("#menuName").val();
			var parentId = $("#parentId").val();
			var menuUrl = $("#menuUrl").val();
			var orderIndex = $("#orderIndex").val();
			var remarks = $("#remarks").val();
			var menu = {};
			menu.menuCode=menuCode;
			menu.menuName=menuName;
			menu.parentId=parentId;
			menu.menuUrl=menuUrl;
			menu.orderIndex=orderIndex;
			menu.remarks=remarks;
			ajaxSend("../menu/add", menu, function(data) {
			});
		});
	});
	function init(){
		ajaxSend("../menu/menuList", {}, function(data) {
			$.each(data.dataList,function(i,obj){
				$("#parentId").append("<option value='"+obj.id+"' >"+obj.menuName+"</option>");
			});
		});
	}
</script>
</head>
<body>
	<div class="alert alert-info">
		当前位置<b class="tip"></b>系统管理<b class="tip"></b>修改
	</div>
	<table class="table table-striped table-bordered table-condensed list">
		<thead>
			<tr>
				<td colspan="4">
					<b>菜单基本信息</b>
				</td>
			</tr>
		</thead>
		<tbody>
			<tr>
				<td>菜单编号</td>
				<td colspan="3">
					<input id="menuCode" value="" type="text" />
					（系统自动生成）
				</td>
			</tr>
			<tr>
				<td width="15%">
					菜单名称<font color="FF0000">*</font>
				</td>
				<td width="500">
					<input id="menuName" value="" type="text" />
				</td>
				<td width="500">
					父级菜单<font color="FF0000">*</font>
				</td>
				<td width="500">
					<select id="parentId">
						<option value="0" selected="selected">-=请选择=-</option>
					</select>
				</td>
			</tr>
			<tr>
				<td>
					菜单链接<font color="FF0000">*</font>
				</td>
				<td>
					<input id="menuUrl" value="" type="text" />
				</td>
				<td>
					排序<font color="FF0000">*</font>
				</td>
				<td>
					<input id="orderIndex" value="" type="text" />
				</td>
			</tr>
			<tr>
				<td width="15%">备注</td>
				<td width="500" colspan="3" height="">
					<textarea id="remarks" style="width: 95%" rows="4" cols="5"></textarea>
				</td>
			</tr>
		</tbody>
		<tfoot>
			<tr>
				<td colspan="4">
					<input class="btn btn-inverse" id="find" type="button" value="保存" />
					<input class="btn btn-inverse" type="button" value="取消" />
				</td>
			</tr>
		</tfoot>
	</table>
</body>
</html>