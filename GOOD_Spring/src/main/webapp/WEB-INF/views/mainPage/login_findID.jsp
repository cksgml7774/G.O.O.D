<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ page trimDirectiveWhitespaces="true"%>
<!doctype html>
<html>
<head>
<%@ include file="../inc/head.jsp"%>
<link rel="stylesheet"
	href="${pageContext.request.contextPath}/assets/plugins/sweetalert/sweetalert2.min.css" />

<style type="text/css">
#tag_input {
	font-size: 15px;
}

/* 인풋요소 ui*/
.id_pw_search {
	border: none;
	border-bottom: 2px solid #ced4da;
	border-radius: 0px;
	background-color: transparent;
	padding-left: 5px;
	box-shadow: none;
	/* required fields */
	/* active state */
	/* invalid state */
}

.id_pw_search:focus {
	border-bottom-color: #007bff;
	color: #000;
	box-shadow: none;
}

.id_pw_search:focus.invalid {
	border-bottom-color: #dc3545;
}

#logo {
	padding-top: 50px;
}

.name_intput {
	padding-top: 130px;
}

.vertical-bar {
	content: "";
	display: inline-block;
	width: 1px;
	height: 11px;
	background-color: #e4e8eb;
	vertical-align: -1px;
	margin: 0 8px;
}
</style>
</head>


<body>
	<div class="wrapper">
		<%@ include file="../inc/Header.jsp"%>

		<div class="container">
			<form class="form-horizontal" role="form"
				action="${pageContext.request.contextPath}/mainPage/login_findID_ok"
				method="post" id="search_id_form">
				<fieldset>
					<h1 class="page-header">ID 찾기</h1>
					<div class="col-xs-12 text-center" id="logo">
						<img
							src="${pageContext.request.contextPath}/assets/icon_img/logo.png"
							height="66px" width="330px">
					</div>
					<div class="form-group name_intput" style="margin-top: 100px;"
						id="tag_input">
						<label for="name_search" class="col-md-4 control-label">이름
							: </label>
						<div class="col-md-4 ">
							<input type="text" id="name_search" name="name_search"
								class="form-control id_pw_search" placeholder="이름을 입력하세요." />
						</div>
					</div>
					<div class="form-group hp_intput " style="margin-top: 30px;"
						id="tag_input">
						<label for="email_search" class="col-md-4  control-label">이메일
							: </label>
						<div class="col-md-4 ">
							<input type="email" id="email_search" name="email_search"
								class="form-control id_pw_search" placeholder="이메일을 입력하세요." />
						</div>
					</div>
					<div class="form-group" id="tag_input">
						<div class="text-center">
							<button type="submit" class="btn btn-primary search_id"
								id="search_id"
								style="width: 80px; height: 40px; font-size: 18px;">찾기</button>
						</div>
					</div>
					<hr>
					<div class="text-center" id="tag_btn">
						<a href="${pageContext.request.contextPath}/mainPage/login_findID.do">아이디 찾기</a> <span class="vertical-bar"></span>
				<a href="${pageContext.request.contextPath}/mainPage/login_findPW.do">비밀번호 찾기</a><span class="vertical-bar"></span>
				<a href="${pageContext.request.contextPath}/mainPage/join.do">회원가입</a>
					</div>
				</fieldset>
			</form>
		</div>
	</div>
	<div></div>
	<%@ include file="../inc/Footer.jsp"%>



	<%@ include file="../inc/plugin.jsp"%>
	<script
		src="${pageContext.request.contextPath}/assets/plugins/ajax-form/jquery.form.min.js"></script>

	<script>
		$(function() {
			
			 $('#search_id_form').ajaxForm({
			     
			        error: function(error){
			        	var error_msg ='';
			        	var code = parseInt(error.status / 100);
			        	if (code == 5) 	{
			                error_msg = "이름과 이메일을 확인하세요.\n";
			            }
			        	else if(code == 4){
							error_msg = "탈퇴된 회원입니다.\n";
						} 
			        	swal({
							title : "에러",
							text :error_msg,
							type : "error"
						}).then(function(result) {
							// 창이 닫히는 애니메이션의 시간이 있으므로,
							// 0.1초의 딜레이 적용 후 포커스 이동
							setTimeout(function() {

							}, 100);
						}); // <-- 메시지 표시
						return false; // <-- 실행 중단
			        },
			        success: function(json) {
			        	swal({
							title : "성공",
							text : json.output.user_name+"님의 아이디는 "+ json.output.user_id+"입니다.",
							type : "success"
						}).then(function(result) {
							// 창이 닫히는 애니메이션의 시간이 있으므로,
							// 0.1초의 딜레이 적용 후 포커스 이동
							setTimeout(function() {

							}, 100);
			       		 })
					}
			    }); // end ajaxForm
			

		});
		
	</script>



</body>
</html>