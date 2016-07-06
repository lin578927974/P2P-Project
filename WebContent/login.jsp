<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
	String path=request.getContextPath();
	String basePath=request.getScheme()+"://"+request.getServerName()+":"+
					request.getServerPort()+path+"/";
%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>系统登录</title>
<link rel="stylesheet" type="text/css" href="css/site.css"/>
<link rel="stylesheet" type="text/css" href="css/themes/blue/easyui.css"/>
<script src="js/jquery-1.8.2.min.js" type="text/javascript"></script>
<script type="text/javascript">
	$(function(){
		$("#Verify").click();
		
		$("#username").focus();//取得焦点
		
		$("#LoginSys").click(function(){
			LoginSys();	
		});
		
		//回车事件
		$(document).keyup(function (e) {
            if (e.keyCode == 13) {
            	$("#LoginSys").click();
                return false;
            }
            
        });
	});
	function LoginSys(){
		$("#mes").html("");
		$("#username").removeClass("input-validation-error");
        $("#userpwd").removeClass("input-validation-error");
        $("#ValidateCode").removeClass("input-validation-error");
		if($.trim($("#username").val())==""){
			$("#username").addClass("input-validation-error").focus();
            $("#mes").html("用户名不能为空！");
            return;
		}
		if($.trim($("#userpwd").val())==""){
			$("#userpwd").addClass("input-validation-error").focus();
            $("#mes").html("密码不能为空！");
            return;
		}
		if ($.trim($("#ValidateCode").val()) == "") {
            $("#ValidateCode").addClass("input-validation-error").focus();
            $("#mes").html("验证码不能为空！");
            return;
        }
		$("#Loading").show();
		//请求验证
		$.post("login.do",{
			UserName: $("#username").val(),
            Password: $("#userpwd").val(),
            CheckCode: $("#ValidateCode").val()
		},function(data){
			if(data.success){
				window.location = "<%=basePath%>page/index.jsp";
			}else{
				$("#Loading").hide();
				alert(data.message);
			}
		},"json");
		//return false;
	};
</script>
</head>
<body>
<!-- top -->
<div>
	<div class="define_head">
		<div class="define_logo"></div>
	</div>
</div>

<!-- middle -->
<div id="login_center">
	<div style="float:left"><img src="<%=basePath%>/img/account.png"/></div>
	<div style="float:right">
		<table id="LoginTb">
			<tr>
				<td colspan="2" style="font-size: 18px; font-weight: bold; padding: 5px 20px;">欢迎登录</td>
			</tr>
			<tr>
				<td class="trSpan">用户名：</td>
				<td><input type="text" id="username" name="username"/></td>
			</tr>
			<tr>
				<td class="trSpan">密码：</td>
				<td><input type="password" id="userpwd" name="userpwd"/></td>
			</tr>
			<tr>
				<td class="trSpan">验证码：</td>
				<td>
					<input style="width: 50px; text-transform: uppercase;" type="text" id="ValidateCode" name="ValidateCode"/>
	 				<img src="SecurityCodeImageAction.do" id="Verify" style="margin-bottom: -8px;cursor:pointer" alt="看不清，换一张" onclick="this.src='SecurityCodeImageAction.do?timestamp='+(new Date().getTime());" />					
	 				<a href="javascript:;" style="color: blue;" onclick="$('#Verify').click()" >看不清？</a>
				</td>
			</tr>
			<tr>
				<td colspan="2">
					<table style="width: 100%;">
						<tr>
							<td style="width: 40px;">&nbsp;</td>
							<td>
							<div id="mes" class="field-validation-error"></div>
							<div id="Loading" style="display: none" class='panel-loading'>
								<font color='#000'>加载中...</font>
							</div>
                            </td>
                            <td style="width: 100px;">
                            	<a id="LoginSys" href="javascript:void(0)" class="easyuilinkbutton l-btn">
                            		<span class="l-btn-left">
                            			<span class="l-btn-text icon-ok" style="padding-left: 20px;">登录</span>
                            		</span>
                            	</a>
                            </td>
                         </tr>
                      </table>
                 </td>
			</tr>
		</table>
	</div>
	<div style="clear:both"></div>
</div>

<!-- bottom -->
<div style="background: #f1f1f1; height: 40px; width: 100%; text-align: center; line-height: 40px; border-top: 1px #ccc solid; bottom: 0; position: absolute">
        Copyright  2016-2016
</div>
</body>
</html>
