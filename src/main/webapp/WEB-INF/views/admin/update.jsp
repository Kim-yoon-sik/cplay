<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<%@ taglib uri="http://www.springframework.org/security/tags"
	prefix="sec"%>

<%@include file="../includes/mheader.jsp"%>



<div class="big-image"
	style="top:60px; background-image:url(/resources/img/<c:out value="${cplay.mov_detailImg}"/>);  width: 100%; height: 800px; overflow: hidden; position: relative;">
</div>

<hr>
<form role="form" action="/admin/update" method="post">
<section class="information">
	<h1
		style="margin-bottom: 50px; font-weight: revert; font-size: xx-large;">상세
		정보</h1>
	<div
		style="display: grid; grid-template-columns: 33.333% 33.333% 33.333%;">
		<div style="max-width: 100%; margin: 6px;">
			<div class="title">영화 제목</div>
			<div style="display: block;">
				<input type="text" name="mov_title" value="<c:out value='${cplay.mov_title}' />">
				<span class="context"> 
				</span>
			</div>
		</div>


		<div style="max-width: 100%; margin: 6px;">
			<div class="title">장르</div>
			<div style="display: block;">
				<input type="text" name="mov_genre" value="<c:out value='${cplay.mov_genre}' />">
				<span class="context">
				</span>
			</div>
		</div>


		<div style="max-width: 100%; margin: 6px;">
			<div class="title">감독</div>
			<div style="display: block;">
				<input type="text" name="mov_director" value="<c:out value='${cplay.mov_director}' />">
				<span class="context">
				</span>
			</div>
		</div>

		<div style="max-width: 100%; margin: 6px;">
			<div class="title">배우</div>
			<div style="display: block;">
				<input type="text" name="mov_actor" value="<c:out value='${cplay.mov_actor}' />">
				<span class="context">
				</span>
			</div>
		</div>

		<div style="max-width: 100%; margin: 6px;">
			<div class="title">국가</div>
			<div style="display: block;">
				<input type="text" name="mov_nation" value="<c:out value='${cplay.mov_nation}' />">
				<span class="context">
				</span>
			</div>
		</div>

		<div style="max-width: 100%; margin: 6px;">
			<div class="title">개봉</div>
			<div style="display: block;">
				<input type="text" name="mov_opday" value="<c:out value='${cplay.mov_opday}' />">
				<span class="context">
				</span>
			</div>
		</div>

		<div style="max-width: 100%; margin: 6px;">
			<div class="title">러닝타임</div>
			<div style="display: block;">
				<input type="text" name="mov_running_time" value="<c:out value='${cplay.mov_running_time}' />">
				<span class="context">
				</span>
			</div>
		</div>

		<div style="max-width: 100%; margin: 6px;">
			<div class="title">평점</div>
			<div style="display: block;">
				<input type="text" name="mov_point" value="<c:out value='${cplay.mov_point}' />">
				<span class="context">
				</span>
			</div>
		</div>

		<div class="form-group col-lg-12">
			<label for="mem_gender" class="control-label">상영 플랫폼<span
				class="required">*</span>
				<div class="radio">
					<label><input type="radio" name="mov_platform"
						id="watcha" value="왓챠">왓챠</label>
				</div>
				<div class="radio">
					<label><input type="radio" name="mov_platform"
						id="netflix" value="넷플릭스">넷플릭스</label>
				</div>
			</label>
		</div>
		
		<div style="max-width: 100%; margin: 6px;">
			<div class="title">영화 예고편 링크주소</div>
			<div style="display: block;">
				<input type="text" name="mov_clip" value="<c:out value='${cplay.mov_clip}' />">
				<span class="context">
				</span>
			</div>
		</div>
	</div>
</section>


<input type="hidden" name="${_csrf.parameterName}" value="${_csrf.token}" />
<input type="hidden" name="mov_thumbnail" value="${cplay.mov_thumbnail}">
<input type="hidden" name="mov_detailImg" value="${cplay.mov_detailImg}">


<section class="information">
	<h1
		style="margin-bottom: 50px; font-weight: revert; font-size: xx-large;">예고편
	</h1>
	<p align="middle">
		<iframe width="1200" height="480" src="${cplay.mov_clip}"
			frameborder="0" allowfullscreen=""></iframe>
	</p>
</section>
<sec:authorize access="hasRole('ROLE_ADMIN')">
	<button type="button" class="btn0 btn-button btn-sm" id="cancelBtn">취소</button>
	<button type="submit" class="btn0 btn-button btn-sm">수정</button>
</sec:authorize>
</form>
<!-- 관리자 영화정보 수정 삭제 -->
<%-- <sec:authorize access="hasRole('ROLE_ADMIN')">
	<button class="btn btn-danger btn-sm" id="movieInfoModify">수정</button>
	<button class="btn btn-primary btn-sm" id="cancelBtn">뒤로가기</button>
</sec:authorize> --%>

<script type="text/javascript">
	$(document).ready(function() {
		
		var platform = "${cplay.mov_platform}"; //jsp 문서의 변수를 jQuery에서 사용하는 방법
		
		if(platform == "왓챠"){
			$("#watcha").prop("checked", true);
		}else{
			$("#netflix").prop("checked", true);
		}
		
		$("#cancelBtn").on("click", function() {
			self.location = "/cplay/mget?mov_title=${cplay.mov_title}";
		});
		
		
		/* $("#movieInfoModify").on("click", function() {
			if (confirm("정말 수정하시겠습니까??") == true){
				self.location = "/admin/modify?mov_title=${cplay.mov_title}";
			}else{
			    return;
			}
		}); */
	});
</script>
</body>
</html>
