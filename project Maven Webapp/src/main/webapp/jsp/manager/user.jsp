<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
<head>
<title></title>
<link rel="stylesheet" type="text/css" href="../resource/js/admin-all.css" />
<script type="text/javascript" src="../resource/Scripts/jquery-1.7.2.js"></script>
<script type="text/javascript" src="../resource/Scripts/jquery-ui-1.8.22.custom.min.js"></script>
<link rel="stylesheet" type="text/css" href="../resource/js/ui-lightness/jquery-ui-1.8.22.custom.css" />
<script type="text/javascript" src="../resource/Scripts/index.js"></script>
<link rel="stylesheet" type="text/css" href="../resource/js/base.css" />
<link rel="stylesheet" type="text/css" href="../resource/js/formui.css" />
<script type="text/javascript" src="../resource/js/tb.js"></script>
<script type="text/javascript">
	$(function() {
		$(".datepicker").datepicker();

		//$('#list').hide();
		$('#find').click(function() {
			$('#list').show();
		})
		$('.tr_detail>td').click(function() {
			//
			$('#waring').show('slow');
			$("#list tr").sorted({
				reversed : true
			});
			var i = $(this).find('i');
			if (i.attr('class') == 'tip-down') {
				i.attr('class', 'tip-up')
			} else {
				i.attr('class', 'tip-down')
			}
		})

	})
</script>
</head>
<body>
	<div class="alert alert-info">
		当前位置<b class="tip"></b>查询界面<b class="tip"></b>查询排序
	</div>
	<div class="alert" style="display: none;" id="waring">
		<a class="close" data-dismiss="alert">×</a> <strong>提示！</strong>
		排序请已事实数据为准。
	</div>
	<table class="tbform">
		<thead>
			<tr>
				<td colspan="6" class="auto-style2">&nbsp;请填写查询条件</td>
			</tr>
		</thead>
		<tbody>
			<tr>
				<td class="tdl">单据号</td>
				<td class="detail"><input class="ipt" /></td>
				<td class="tdl">单据类型</td>
				<td class="td_detail"><input id="finishTime" class="ipt" /></td>
				<td class="tdl">部门</td>
				<td><select class="ipt" size="1" name="ENTPdept">
						<option value="10401"></option>
						<option value="10388">第二营销事业部</option>
						<option value="10389">第三营销事业部</option>
						<option value="10390">第一营销事业部</option>
						<option value="10391">康讯公司</option>
						<option value="11159">IT中心</option>
						<option value="11160">ZTE全球售后服务中心</option>
				</select></td>
			</tr>
			<tr>
				<td class="tdl">提交日期起</td>
				<td>
					<div class="input-append">
						<input class="ipt datepicker" size="16" type="text" /><span
							class="add-on"><i class="icon-calendar"></i></span>至<input
							class="ipt datepicker" size="16" type="text" /><span
							class="add-on"><i class="icon-calendar"></i></span>
					</div>
				</td>
				<td class="tdl">报销人</td>
				<td><select size="1" name="select2" class="ipt">
						<option value="10401"></option>
						<option value="10388">第二营销事业部</option>
						<option value="11158">数据事业部</option>
						<option value="11159">IT中心</option>
						<option value="11160">ZTE全球售后服务中心</option>
				</select></td>
				<td class="tdl">所属项目</td>
				<td><select class="ipt" size="1" name="select3">
						<option value="10401"></option>
						<option value="10388">第二营销事业部</option>
						<option value="10389">第三营销事业部</option>
						<option value="10390">第一营销事业部</option>
						<option value="10391">康讯公司</option>
						<option value="10392">网络事业部</option>
						<option value="10393">移动事业部</option>
						<option value="10394">手机事业部</option>
						<option value="10395">中兴通讯（香港）有限公司</option>
						<option value="10396">人事中心</option>
						<option value="10399">财务中心</option>
						<option value="10400">市场中心</option>
						<option value="11158">数据事业部</option>
						<option value="11159">IT中心</option>
						<option value="11160">ZTE全球售后服务中心</option>
				</select></td>
			</tr>
			<tr>
				<td class="tdl">本币金额</td>
				<td>
					<div class="input-append">
						<input class="ipt" id="Text2" size="16" type="text" /><span
							class="add-on">$</span>至<input class="ipt" id="Text3" size="16"
							type="text" /><span class="add-on">$</span>
					</div>
				</td>
				<td class="tdl">申请人</td>
				<td colspan="3"><input id="finishTime2" class="ipt"></td>
			</tr>
			<tr>
				<td class="tdl">提交财务审核日期</td>
				<td>
					<div class="input-append">
						<input class="ipt datepicker" size="16" type="text" /><span
							class="add-on"><i class="icon-calendar"></i></span>至<input
							class="ipt datepicker" size="16" type="text" /><span
							class="add-on"><i class="icon-calendar"></i></span>
					</div>
				</td>
				<td class="tdl">单据状态</td>
				<td colspan="3"><select class="ipt" size="1" name="select4">
						<option value="10401"></option>
						<option value="10388">第二营销事业部</option>
						<option value="10389">第三营销事业部</option>
						<option value="11160">ZTE全球售后服务中心</option>
				</select> 至 <select class="ipt" size="1" name="select5">
						<option value="10401"></option>
						<option value="10388">第二营销事业部</option>
						<option value="11160">ZTE全球售后服务中心</option>
				</select></td>
			</tr>
			<tr>
				<td colspan="6" align="right"><input class="btn" id="find"
					type="button" value="查询" /> <input class="btn" type="button"
					value="清空" /></td>
			</tr>
		</tbody>
	</table>
	<table class="tb" id="list">
		<tbody>
			<tr>
				<th>单据号</th>
				<th>报销人部门</th>
				<th>报销人</th>
				<th>申请金额</th>
				<th>审核金额</th>
				<th>所属项目</th>
				<th>申请人</th>
				<th>提交日期</th>
				<th>单据类型</th>
				<th>审批状态</th>
				<th>摘要</th>
			</tr>
			<tr>
				<td><a>HS301-2005000020 </a></td>
				<td>现金</td>
				<td>票据</td>
				<td>负责人</td>
				<td>3009.40</td>
				<td>&nbsp;</td>
				<td>&nbsp;</td>
				<td>&nbsp;</td>
				<td>产品国内差旅费单据</td>
				<td>&nbsp;</td>
				<td>&nbsp;</td>
			</tr>
			<tr class="even">
				<td><a>HS301-2005000020 </a></td>
				<td>现金</td>
				<td>票据</td>
				<td>负责人</td>
				<td>0.00</td>
				<td>&nbsp;</td>
				<td>&nbsp;</td>
				<td>&nbsp;</td>
				<td>产品国内差旅费单据</td>
				<td>&nbsp;</td>
				<td>&nbsp;</td>
			</tr>
			<tr>
				<td><a>HS301-2005000020 </a></td>
				<td>CDMA-国内市场部</td>
				<td>现金</td>
				<td>负责人</td>
				<td>0.00</td>
				<td>&nbsp;</td>
				<td>&nbsp;</td>
				<td>&nbsp;</td>
				<td>&nbsp;</td>
				<td>&nbsp;</td>
				<td>&nbsp;</td>
			</tr>
			<tr class="even">
				<td><a>HS301-2005000020 </a></td>
				<td>银行承兑汇票</td>
				<td>谭晓松</td>
				<td>负责人</td>
				<td>0.00</td>
				<td>&nbsp;</td>
				<td>&nbsp;</td>
				<td>&nbsp;</td>
				<td>&nbsp;</td>
				<td>&nbsp;</td>
				<td>&nbsp;</td>
			</tr>
			<tr>
				<td><a>HS301-2005000020 </a></td>
				<td>银行存款</td>
				<td>谭晓松</td>
				<td>任务成员</td>
				<td>0.00</td>
				<td>&nbsp;</td>
				<td>&nbsp;</td>
				<td>&nbsp;</td>
				<td>&nbsp;</td>
				<td>&nbsp;</td>
				<td>&nbsp;</td>
			</tr>
			<tr class="even">
				<td><a>HS301-2005000020 </a></td>
				<td>1209NewPro</td>
				<td>谭晓松</td>
				<td>任务成员</td>
				<td>0.00</td>
				<td>&nbsp;</td>
				<td>&nbsp;</td>
				<td>&nbsp;</td>
				<td>&nbsp;</td>
				<td>&nbsp;</td>
				<td>&nbsp;</td>
			</tr>
			<tr>
				<td><a>HS301-2005000020 </a></td>
				<td>testqzw</td>
				<td>谭晓松</td>
				<td>负责人</td>
				<td>0.00</td>
				<td>&nbsp;</td>
				<td>&nbsp;</td>
				<td>&nbsp;</td>
				<td>&nbsp;</td>
				<td>&nbsp;</td>
				<td>&nbsp;</td>
			</tr>
			<tr class="even">
				<td><a>HS301-2005000020 </a></td>
				<td>银行存款</td>
				<td>执行中</td>
				<td>负责人</td>
				<td>0.00</td>
				<td>&nbsp;</td>
				<td>&nbsp;</td>
				<td>&nbsp;</td>
				<td>&nbsp;</td>
				<td>&nbsp;</td>
				<td>&nbsp;</td>
			</tr>
			<tr>
				<td><a>HS301-2005000020 </a></td>
				<td>testqzw</td>
				<td>指派中</td>
				<td></td>
				<td>0.00</td>
				<td>&nbsp;</td>
				<td>&nbsp;</td>
				<td>&nbsp;</td>
				<td>&nbsp;</td>
				<td>&nbsp;</td>
				<td>&nbsp;</td>
			</tr>
			<tr class="even">
				<td><a>HS301-2005000020 </a></td>
				<td>银行承兑汇票</td>
				<td>谭晓松</td>
				<td>负责人</td>
				<td>0.00</td>
				<td>&nbsp;</td>
				<td>&nbsp;</td>
				<td>&nbsp;</td>
				<td>&nbsp;</td>
				<td>&nbsp;</td>
				<td>&nbsp;</td>
			</tr>
			<tr>
				<td><a>HS301-2005000020 </a></td>
				<td>银行承兑汇票</td>
				<td>谭晓松</td>
				<td>负责人</td>
				<td>0.00</td>
				<td>&nbsp;</td>
				<td>&nbsp;</td>
				<td>&nbsp;</td>
				<td>产品国内差旅费单据</td>
				<td>&nbsp;</td>
				<td>&nbsp;</td>
			</tr>
			<tr class="even">
				<td><a>HS301-2005000020 </a></td>
				<td>银行承兑汇票</td>
				<td>上级取消</td>
				<td>负责人</td>
				<td>0.00</td>
				<td>&nbsp;</td>
				<td>&nbsp;</td>
				<td>&nbsp;</td>
				<td>&nbsp;</td>
				<td>&nbsp;</td>
				<td>&nbsp;</td>
			</tr>
			<tr>
				<td><a>HS301-2005000020 </a></td>
				<td>银行承兑汇票</td>
				<td>谭晓松</td>
				<td>负责人</td>
				<td>0.00</td>
				<td>&nbsp;</td>
				<td>&nbsp;</td>
				<td>&nbsp;</td>
				<td>&nbsp;</td>
				<td>&nbsp;</td>
				<td>&nbsp;</td>
			</tr>
			<tr class="even">
				<td><a>HS301-2005000020 </a></td>
				<td>银行承兑汇票</td>
				<td>执行中</td>
				<td>负责人</td>
				<td>0.00</td>
				<td>&nbsp;</td>
				<td>&nbsp;</td>
				<td>&nbsp;</td>
				<td>&nbsp;</td>
				<td>&nbsp;</td>
				<td>&nbsp;</td>
			</tr>
			<tr>
				<td><a>HS301-2005000020 </a></td>
				<td>测试产品项目p</td>
				<td>上级取消</td>
				<td>负责人</td>
				<td>0.00</td>
				<td>&nbsp;</td>
				<td>&nbsp;</td>
				<td>&nbsp;</td>
				<td>&nbsp;</td>
				<td>&nbsp;</td>
				<td>&nbsp;</td>
			</tr>
		</tbody>
		<tr class="pager">
			<th colspan="100">当前第5页/共55页&nbsp;&nbsp;共650条记录&nbsp;&nbsp;<a>首页</a>&nbsp;<a>下一页</a>&nbsp;
				<a class="current">1</a>&nbsp;<a>2</a>&nbsp;<a>3</a>&nbsp;<a>4</a>&nbsp;
				<a class="badge badge-warning">5</a>&nbsp;<a class="navpage">...</a>&nbsp;<a>55</a>&nbsp;<a>上一页</a>&nbsp;<a>尾页</a></th>
		</tr>
	</table>
</body>
</html>
