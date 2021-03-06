<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ page trimDirectiveWhitespaces="true"%>
<!doctype html>
<html>
<head>
<%@ include file="../inc/head.jsp"%>

<style type="text/css">


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


.body .main_header {
	padding-bottom: 0;
}
</style>
</head>
<body>
	<!-- 푸터빼고 감싸주세요 -->
	<div class="wrapper">
		<!-- 상단영역 -->
		<%@ include file="../inc/Header.jsp"%>
		<!-- 본문영역 -->
		<div class="container">
			<!-- 대제목 -->
			<div class="row main_header">
				<h1 class="page-header page-title" id="cas_header"
					onclick="location.href='../commPage/comm_index.jsp'"
					style="cursor: pointer; color: #343a40;">
					<span class="test01">커뮤니티<img
						src="../icon_img/커뮤니티 아이콘.png;"/>
					</span>
				</h1>
			</div>
			<div class="header">
				<h1 style="color: #343a40; padding-left:15px">내가 쓴 글</h1>
			</div>

			<!-- 리스트영역-->
			<div class="col-md-12 table-responsive">
				<table class="table table-bordered table-hover">
					<thead>
						<tr class="active">
							<th class="text-center">#</th>
							<th class="text-center">제목</th>
							<th class="text-center">카테고리</th>
							<th class="text-center">작성일</th>
							<th class="text-center">조회수</th>
						</tr>
					</thead>
					<tbody id="list">
						<tr style="cursor: pointer;"
							onclick=" location.href='comm_crew_post.jsp' "
							onMouseOver=" window.status = 'comm_crew_post.jsp' "
							onMouseOut=" window.status = '' ">
							<td class="text-center">1</td>
							<td class="text-center">하얗게 피어난 얼음꽃 하나가</td>
							<td class="text-center">크루</td>
							<td class="text-center">Tree</td>
							<td class="text-center">100</td>
						</tr>
						<tr style="cursor: pointer;"
							onclick=" location.href='comm_crew_post.jsp' "
							onMouseOver=" window.status = 'comm_crew_post.jsp' "
							onMouseOut=" window.status = '' ">
							<td class="text-center">2</td>
							<td class="text-center">달가운 바람에 얼굴을 내밀어</td>
							<td class="text-center">크루</td>
							<td class="text-center">Tree</td>
							<td class="text-center">100</td>

						</tr>
						<tr style="cursor: pointer;"
							onclick=" location.href='comm_crew_post.jsp' "
							onMouseOver=" window.status = 'comm_crew_post.jsp' "
							onMouseOut=" window.status = '' ">
							<td class="text-center">3</td>
							<td class="text-center">아무말 못 했던 이름도 몰랐던</td>
							<td class="text-center">크루</td>
							<td class="text-center">Tree</td>
							<td class="text-center">100</td>

						</tr>

						<tr style="cursor: pointer;"
							onclick=" location.href='comm_myCourseDetail.jsp' "
							onMouseOver=" window.status = 'comm_myCourseDetail.jsp' "
							onMouseOut=" window.status = '' ">
							<td class="text-center">4</td>
							<td class="text-center">지나간 날들에 눈물이 흘러</td>
							<td class="text-center">나만의 코스</td>
							<td class="text-center">Tree</td>
							<td class="text-center">100</td>

						</tr>
					</tbody>
				</table>
			</div>


			<!-- //리스트영역 끝-->


			<!-- 페이지네이션영역-->
			<div class="text-center">
				<ul class="pagination" style="margin-top: 0;">
					<li class="page-item disabled"><a href="#">&laquo;</a></li>
					<li class="page-item active"><span>1<span
							class="sr-only">(current)</span></span></li>
					<li class="page-item"><a href="#">2</a></li>
					<li class="page-item"><a href="#">3</a></li>
					<li class="page-item"><a href="#">4</a></li>
					<li class="page-item"><a href="#">5</a></li>
					<li class="page-item"><a href="#">&raquo;</a></li>
				</ul>
			</div>

			<!-- //페이지네이션영역 끝-->
		</div>
		<!-- //본문영역 끝 -->
	</div>
	<!-- 하단영역 -->
	<%@ include file="../inc/Footer.jsp"%>
	<%@ include file="../inc/plugin.jsp"%>
</body>
</html>