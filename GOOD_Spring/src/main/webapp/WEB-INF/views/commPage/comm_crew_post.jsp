<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ page trimDirectiveWhitespaces="true"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<!doctype html>
<html>
<head>
<%@ include file="../inc/head.jsp"%>

<style>
.main_header>h1 {
	position: relative;
	text-align: center;
	transition: all 0.3s ease;
	transform: translateY(0);
}

.main_header>h1:hover {
	transform: translate(0, -10px);
}

.main_header>h1>span>img {
	width: 3rem;
	height: 3rem;
	position: relative;
	left: 5px;
	bottom: 0px;
}

.coursewriter {
	margin-left: 15px;
}

.heart i, .comment i {
	margin-top: 8px;
	margin-left: 8px;
}

.fa-heart-o {
	color: red;
	cursor: pointer;
}

.fa-heart {
	color: red;
	cursor: pointer;
}

.sidebar {
	float: left;
	width: 150px;
}

.title-img>img {
	width: 150px;
}

.crew_container {
	position: relative;
}

.row_a {
	margin-left: 8%;
}



.title-img img {
	width: 3rem;
	height: 3rem;
	position: relative;
	left: 5px;
	bottom: 0px;
}

.sidebar img{
	max-hieght: 100%;
	min-width: 100%;
	height: 180px;
}

#btn111 {
z-index: 100000;
}
</style>
</head>
<body>
	<div class="wrapper">
		<!-- 공용 헤더 -->
		<%@ include file="/WEB-INF/views/inc/Header.jsp"%>
		<!-- //공통 헤더 -->
		<!-- 컨테이너 -->

		<div class="container crew_container ">
			<!-- 대제목 -->
			<div class="row main_header">
				<h1 class="page-header page-title" id="cas_header"
					onclick="location.href='${pageContext.request.contextPath}/commPage/comm_index.do'"
					style="cursor: pointer; color: #343a40;">
					<span class="test01">커뮤니티<img
						src="${pageContext.request.contextPath}/assets/icon_img/comm_icon.png;" />
					</span>
				</h1>
			</div>
			<h1 class="page-header">크루게시판</h1>



<div class="article header col-xl-12 col-sm-12 col-xs-12 " style="margin-left: 2%;" >
			<h1 style="margin:-5px 0 10px 0;">${postout.post_title}</h1>
			<div class="pull-left writer_profile">
					<img style="border-radius: 25px; margin-right:0.5%;" src="<c:if test='${member.getUser_photo().getFileUrl()==null || member.getUser_photo().getFileUrl()==""}'>${pageContext.request.contextPath}/assets/img/profile_default.png</c:if>${member.getUser_photo().getFileUrl()}" width="50px" height="50px">
				</div>
				
					<h4 style="margin-left:5%;">${postout.getUser_nick()}</h4>
					<p class="pull-left" style="color:#979797; font-size:12px; margin-left:1%;" >${postout.getPost_createdate()}</p>
					<p class="pull-left " style="margin-left: 5px; color:#979797; font-size:12px;">조회수 :
						${postout.post_hits}</p>
						

				
						<br>
						<hr>
						<p style="margin-top:3%">${postout.getPost_content()}</p>
			</div>
			
			
			</div>


			<hr />

			<!-- 댓글 영역 -->
			<div class="container" style="margin-top:-30px" style="margin-left:5%;"><h3 style="margin-left:3%">댓글<span class="comment"><i
						class="fa fa-comment-o"></i></span>
						<span class="heart pull-right" style="margin-top:1px"></span>
						<span class="pull-right" id="likeCount2" style="margin-top:1%"></span>
						 <span class="" id="CommentCount2" style="margin-top:1%"></span>
						<hr>
						</h3>
			<div id="cmt-list"></div>
			


				<form>
				<div class="row" style="margin-left:2%; margin-right:1%;">
				<div class="form-group col-md-1">
				<img class="pull-left" style="border-radius: 60px; margin-top:3%" src="<c:if test='${login_info.getUser_photo().getFileUrl()==null || login_info.getUser_photo().getFileUrl()==""}'>${pageContext.request.contextPath}/assets/img/profile_default.png</c:if>${login_info.getUser_photo().getFileUrl()}" width="50px" height="50px">
				<!-- 	<h4 id="nick">${login_info.user_nick}</h4> -->
					</div>
					<!--  <br> -->
					<div class="form-group col-md-11">
					<div class="form-group input-group">
						<textarea class="form-control" id="comment_text"
							style="height: 60px; resize: none; margin-left:2%;"
							placeholder="내용을 입력해주세요."></textarea>
						<span class="input-group-btn"><button type="button"
								class="btn btn-default" id="btn111" style="height: 60px; margin-left:2%;"
								onclick="cmt_add()">댓글 등록</button></span>
					</div>
					</div>
					</div>
				</form>
			<hr>
		<div class="container col-md-12 col-sm-12">
		<div class="row pull-left">
			<form
				action="${pageContext.request.contextPath}/commPage/comm_crew_bbs.do"
				method="GET" >
				<input type="hidden" name="crew_no" value="${postout.crew_no}" />
				<input type="hidden" id="crew_name" name="crew_name"
					value="${postout.crew_name}" />
				<button type="submit" id="btn1" class="btn btn-default" style="margin-left:30px">목록</button>
			</form>
		</div>
			<input type="hidden" name=post_no id="post_no"
					value="${postout.post_no}">
			<c:if test="${postout.user_info_user_no==login_info.user_no || login_info.user_admin =='true'}">
			<div class="row">
			<form>
				
				<div class="btn-group pull-right">
					<button type="button" class="btn btn-primary wr_edit" id="wr_edit">수정</button>
				</div>
			</form>
			<form
				action="${pageContext.request.contextPath}/commPage/comm_crew_postDelete_ok.do"
				method="GET" id="delete_ok">
				<input type="hidden" name=post_no id="post_no"value="${postout.post_no}">
				<input type="hidden" name=crew_no id="name=crew_no"value="${postout.crew_no}">
				<input type="hidden" name=crew_name id="crew_name"value="${postout.crew_name}">
				<div class="btn-group pull-right">
					<button type="submit" class="btn btn-warning wr_delete" id="wr_delete">삭제</button>
				</div>
			</form>
			</div>
			
			</c:if>
			</div>
		</div>
		</div>

	<!-- //컨테이너 -->
	<!-- 공용 푸터 -->
	<%@ include file="../inc/Footer.jsp"%>
	<!-- //공통 푸터 -->
	<!-- js -->
	<%@ include file="../inc/plugin.jsp"%>

	<!-- 댓글 js-->
	<script
		src="${pageContext.request.contextPath}/assets/js/crewPost-js.js"></script>


	<!--버튼  -->
	<script>

		$(function() {
			let post_no= "${postout.post_no}"
			console.log(post_no)
			$('#wr_edit').click(function(e) {
			// 창이 닫히는 애니메이션의 시간이 있으므로,
			// 0.1초의 딜레이 적용 후 포커스 이동
				window.location.href = getContextPath()+'/commPage/comm_crew_postEdit.do?post_no='+post_no;
			});

			$('#wr_delete').click(
				function(e) {
				e.preventDefault();
				swal({
					title : '확인', // 제목
					text : "정말 게시글을 삭제하시겠습니까?", // 내용
					type : 'warning', // 종류
					confirmButtonText : '네', // 확인버튼 표시 문구
					showCancelButton : true, // 취소버튼 표시 여부
					cancelButtonText : '아니오', // 취소버튼 표시 문구
				}).then(
					function(result) {
					// 창이 닫히는 애니메이션의 시간이 있으므로,
					// 0.1초의 딜레이 적용 후 포커스 이동
					if (result.value) { // 확인 버튼이 눌러진 경우
					swal('삭제','게시글이 삭제되었습니다.','success');
					document.getElementById("delete_ok").submit();   // 재 submit
					}
				});
			});

			$('#d_delete').click(function(e) {
				swal({
					title : '확인', // 제목
					text : "정말 게시글을 삭제하시겠습니까?", // 내용
					type : 'warning', // 종류
					confirmButtonText : '네', // 확인버튼 표시 문구
					showCancelButton : true, // 취소버튼 표시 여부
					cancelButtonText : '아니오', // 취소버튼 표시 문구
				}).then(function(result) {
					// 창이 닫히는 애니메이션의 시간이 있으므로,
					// 0.1초의 딜레이 적용 후 포커스 이동
					if (result.value) { // 확인 버튼이 눌러진 경우
						swal('삭제','댓글이 삭제되었습니다.','success');
						}
					});
				});
		});
	</script>

</body>
</html>