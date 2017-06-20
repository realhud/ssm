<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
<head>
<title></title>
<link rel="stylesheet" type="text/css" href="../resource/Styles/admin-all.css" />
<script type="text/javascript" src="../resource/js/jquery-1.7.2.js"></script>
<script type="text/javascript" src="../resource/js/jquery-ui-1.8.22.custom.min.js"></script>
<link rel="stylesheet" type="text/css" href="../resource/Styles/ui-lightness/jquery-ui-1.8.22.custom.css" />
<script type="text/javascript" src="../resource/js/index.js"></script>
<link rel="stylesheet" type="text/css" href="../resource/Styles/base.css" />
<link rel="stylesheet" type="text/css" href="../resource/Styles/formui.css" />
<script type="text/javascript" src="../resource/js/tb.js"></script>
<script type="text/javascript" src="../resource/js/ajax.js"></script>
<script type="text/javascript" src="../resource/js/json4Table.js"></script>
<script type="text/javascript">
	var _json4Table = new $.json4Table({
		action : "../menu/list"
	});
	$(function() {
		$(".datepicker").datepicker();
		$('#find').click(function() {
			_json4Table.drewTable({});
		});
		$('.tr_detail>td').click(function() {
			$('#waring').show('slow');
			$("#list tr").sorted({
				reversed : true
			});
			var i = $(this).find('i');
			if (i.attr('class') == 'tip-down') {
				i.attr('class', 'tip-up');
			} else {
				i.attr('class', 'tip-down');
			}
		});
		_json4Table.drewTable({});
	});
</script>
</head>
<body>
	<div class="alert alert-info">
		当前位置<b class="tip"></b>系统管理<b class="tip"></b>菜单管理
	</div>
	<div class="alert" style="display: none;" id="waring">
		<a class="close" data-dismiss="alert">×</a>
		<strong>提示！</strong> 排序请已事实数据为准。
	</div>
	<table class="tbform">
		<thead>
			<tr>
				<td colspan="4" align="right">
					<input class="btn" id="btn_add" type="button" value="新增" />
					<input class="btn" id="find" type="button" value="查询" />
					<input class="btn" type="button" value="清空" />
				</td>
			</tr>
		</thead>
		<tbody>
			<tr>
				<td class="tdl">菜单编号</td>
				<td class="detail">
					<input class="ipt" />
				</td>
				<td class="tdl">菜单名称</td>
				<td class="td_detail">
					<input id="finishTime" class="ipt" />
				</td>
			</tr>
			<tr>
				<td colspan="4">
					<a target="Conframe" href="menu_edit">新增</a>
				</td>
			</tr>
		</tbody>
	</table>
	<table class="tb" id="table" data-id-field="id">
		<thead>
			<tr>
				<th data-field="menuCode">菜单编号</th>
				<th data-field="menuName">菜单名称</th>
				<th data-field="menuUrl">菜单链接</th>
				<th data-field="parentId">父级菜单ID</th>
				<th data-field="remarks">备注</th>
			</tr>
		</thead>
		<tbody>
		</tbody>
	</table>
</body>
</html>
