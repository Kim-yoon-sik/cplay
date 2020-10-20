<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<%@include file="../includes/mheader.jsp"%>

<div class="slide" style="position: relative; width:100%;">
    <ul>
      <li></li>
      <li></li>
      <li></li>
    </ul>
  </div>

<div class="td-padding" style="margin-top:35px;">
	<h1>영화 목록 </h1>
</div>
	
				
<section class=".nm-collection-row">
<div class="nm-content-horizontal-row">
<div class="left">
	<button id="btn_r1"><span class="nf-svg-icon "><svg viewBox="0 0 18 18" xmlns="http://www.w3.org/2000/svg">
	<path fill="currentColor" d="M11.56 5.56L10.5 4.5 6 9l4.5 4.5 1.06-1.06L8.12 9z">
	</path></svg></span></button>
	<div class="nm-content-horizontal-row-gradient"></div>
</div>

<table class="nm-content-horizontal-row-item-container">
	<tr>
		<td><img src="/resources/img/nlogo.png"></td>
	</tr>
	<tr id="list1">
		<c:forEach items="${list}" var="mov_thumbnail_Netflix">
			<c:if test="${mov_thumbnail_Netflix.mov_platform eq '넷플릭스'}">
				<td class="td-padding"> <span><a class='move'
					href='/cplay/mget?mov_title=<c:out value="${mov_thumbnail_Netflix.mov_title}"/>'>
					<img src="/resources/img/thumbnail/<c:out value="${mov_thumbnail_Netflix.mov_thumbnail}" />" style="width:320px; height:180px;">
					<span class="title"><c:out value="${mov_thumbnail_Netflix.mov_title}"/></span>
				</a></span></td>
			</c:if>
		</c:forEach>
	</tr>
</table>


<div class="right">
	<button class="rb" id="btn_r3"><span class="nf-svg-icon "><svg viewBox="0 0 23 23" xmlns="http://www.w3.org/2000/svg">
	<path fill="currentColor" d="M8.59 16.34l4.58-4.59-4.58-4.59L10 5.75l6 6-6 6z">
	</path></svg></span></button>
	<div class="gra1"></div>
</div>
</div>
</section>

<hr class="p">
	
<section class=".nm-collection-row">
<div class="nm-content-horizontal-row">
<div class="left">
	<button id="btn_r2"><span class="nf-svg-icon "><svg viewBox="0 0 18 18" xmlns="http://www.w3.org/2000/svg">
	<path fill="currentColor" d="M11.56 5.56L10.5 4.5 6 9l4.5 4.5 1.06-1.06L8.12 9z">
	</path></svg></span></button>
	<div class="gra"></div>
</div>
<table class="nm-content-horizontal-row-item-container">
	<tr>
		<td><img src="/resources/img/watcha.png"></td>
	
	</tr>
	<tr id="list">
		<c:forEach items="${list}" var="mov_thumbnail_Watcha">
			<c:if test="${mov_thumbnail_Watcha.mov_platform eq '왓챠'}">
				<td class="td-padding"><a class='move'
					href='/cplay/mget?mov_title=<c:out value="${mov_thumbnail_Watcha.mov_title}"/>'> <img
						src="/resources/img/thumbnail/<c:out value="${mov_thumbnail_Watcha.mov_thumbnail}" />" style="width:320px; height:180px;">
						<span class="title"><c:out value="${mov_thumbnail_Watcha.mov_title}"/></span>
				</a></td>
			</c:if>
		</c:forEach>
	</tr>
</table>
	<div class="right">
	<button class="rb" id="btn_r"><span class="nf-svg-icon "><svg viewBox="0 0 23 23" xmlns="http://www.w3.org/2000/svg">
	<path fill="currentColor" d="M8.59 16.34l4.58-4.59-4.58-4.59L10 5.75l6 6-6 6z">
	</path></svg></span></button>
	<div class="gra2"></div>
</div>
</div>
</section>

	<%@include file="../includes/mfooter.jsp"%>
