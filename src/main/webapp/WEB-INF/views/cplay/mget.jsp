<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<%@ taglib uri="http://www.springframework.org/security/tags" prefix="sec"%>
<%@include file="../includes/mheader.jsp"%>

<div class="big-image"
	style="top:60px; background-image:url(/resources/img/<c:out value="${cplay.mov_detailImg}"/>.png);  height: 800px; width:100%; overflow: hidden; position: relative;">
</div>

<hr>
<section class="information">
	<h1
		style="margin-bottom: 50px; font-weight: revert; font-size: xx-large;">상세
		정보</h1>
	<div
		style="display: grid; grid-template-columns: 33.333% 33.333% 33.333%;">
		<div style="max-width: 100%; margin: 6px;">
			<div class="title">영화 제목</div>
			<div style="display: block;">
				<span class="context"> <c:out value="${cplay.mov_title}" />
				</span>
			</div>
		</div>

		<div style="max-width: 100%; margin: 6px;">
			<div class="title">장르</div>
			<div style="display: block;">
				<span class="context"> <c:out value="${cplay.mov_genre}" />
				</span>
			</div>
		</div>

		<div style="max-width: 100%; margin: 6px;">
			<div class="title">감독</div>
			<div style="display: block;">
				<span class="context"> <c:out value="${cplay.mov_director}" />
				</span>
			</div>
		</div>

		<div style="max-width: 100%; margin: 6px;">
			<div class="title">배우</div>
			<div style="display: block;">
				<span class="context"> <c:out value="${cplay.mov_actor}" />
				</span>
			</div>
		</div>

		<div style="max-width: 100%; margin: 6px;">
			<div class="title">국가</div>
			<div style="display: block;">
				<span class="context"> <c:out value="${cplay.mov_nation}" />
				</span>
			</div>
		</div>

		<div style="max-width: 100%; margin: 6px;">
			<div class="title">개봉</div>
			<div style="display: block;">
				<span class="context"> <c:out value="${cplay.mov_opday}" />
				</span>
			</div>
		</div>

		<div style="max-width: 100%; margin: 6px;">
			<div class="title">러닝타임</div>
			<div style="display: block;">
				<span class="context"> <c:out
						value="${cplay.mov_running_time}" />
				</span>
			</div>
		</div>

		<div style="max-width: 100%; margin: 6px;">
			<div class="title">평점</div>
			<div style="display: block;">
				<span class="context"> <c:out value="${cplay.mov_point}" />
				</span>
			</div>
		</div>

		<div style="max-width: 100%; margin: 6px;">
			<div class="title">상영 플렛폼</div>
			<div style="display: block;">
				<span class="context"> <c:out value="${cplay.mov_platform}" />
				</span>
			</div>
		</div>
	</div>
</section>

<section class="information">
	<h1
		style="margin-bottom: 50px; font-weight: revert; font-size: xx-large;">예고편
	</h1>
	<p align="middle">
		<iframe width="1200" height="480" src="${cplay.mov_clip}"
			frameborder="0" allowfullscreen=""></iframe>
	</p>
</section>

<!-- 관리자 영화정보 수정 삭제 -->
<sec:authorize access="hasRole('ROLE_ADMIN')">
	<button class="btn0 btn-button btn-sm" id="movieInfoDelete">삭제</button>
	<button class="btn0 btn-button btn-sm" id="movieInfoModify">수정</button>
</sec:authorize>

<script type="text/javascript">
	$(document).ready(function() {
		$("#movieInfoModify").on("click", function() {
			self.location = "/admin/update?mov_title=${cplay.mov_title}";
		});
		
		$("#movieInfoDelete").on("click", function() {
			if (confirm("정말 삭제하시겠습니까??") == true){
				self.location = "/admin/remove?mov_title=${cplay.mov_title}";
			}else{
			    return;
			}
		});
	});
</script>
</body>
</html>
