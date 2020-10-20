<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://www.springframework.org/security/tags" prefix="sec"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>
<head>

<script src="https://code.jquery.com/jquery-3.5.1.js"></script>
<meta charset="UTF-8">
  <meta name="viewport" content="width=device-width, initial-scale=1.0">
  <meta name="description" content="Creative - Bootstrap 3 Responsive Admin Template">
  <meta name="author" content="GeeksLabs">
  <meta name="keyword" content="Creative, Dashboard, Admin, Template, Theme, Bootstrap, Responsive, Retina, Minimal">
  <link rel="shortcut icon" href="img/favicon.png">

  <title>C-play 넷플릭스와 왓챠의 영화 정보를 한 눈에</title>
  <!-- Bootstrap CSS -->
  <link href="/resources/css/bootstrap.min.css" rel="stylesheet">
  
  <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">
  <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
  <script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>
  
  <!-- bootstrap theme -->
 
  <!--external css-->
  <!-- font icon -->
  <link href="/resources/css/elegant-icons-style.css" rel="stylesheet" />
  <link href="/resources/css/font-awesome.min.css" rel="stylesheet" />
  <!-- full calendar css-->
  <link href="/resources/assets/fullcalendar/fullcalendar/bootstrap-fullcalendar.css" rel="stylesheet" />
  <link href="/resources/assets/fullcalendar/fullcalendar/fullcalendar.css" rel="stylesheet" />
  <!-- easy pie chart-->
  <link href="/resources/assets/jquery-easy-pie-chart/jquery.easy-pie-chart.css" rel="stylesheet" type="text/css" media="screen" />
  <!-- owl carousel -->
  <link rel="stylesheet" href="/resources/css/owl.carousel.css" type="text/css">
  <link href="/resources/css/jquery-jvectormap-1.2.2.css" rel="stylesheet">
  <!-- Custom styles -->
  <link rel="stylesheet" href="/resources/css/fullcalendar.css">
  <link href="/resources/css/widgets.css" rel="stylesheet">
   <link href="/resources/css/style.css" rel="stylesheet">
  <link href="/resources/css/style-responsive.css" rel="stylesheet" />
  <link href="/resources/css/xcharts.min.css" rel=" stylesheet">
  <link href="/resources/css/jquery-ui-1.10.4.min.css" rel="stylesheet">
  <link href="/resources/css/ex10.css" rel="stylesheet">
</head>

<script type="text/javascript">
	$(document).ready(
			function() {

			var result = '<c:out value="${result}"/>';
			
			checkModal(result);

			history.replaceState({}, null, null);

			function checkModal(result) {

				if (result === '' || history.state) {
					return;
				}

				$("#myModal").modal("show");
			}
			
			var actionFormHeader=$("#actionFormHeader");
			
			$(".paginate_button a").on("click", function(e){
				
				e.preventDefault();
				
				console.log('click');
				
				actionFormHeader.find("input[name='pageNum']").val($(this).attr("href"));
				actionFormHeader.submit();
			});
			
			var searchForm = $("#searchForm");
			
			$("#searchForm button").on("click", function(e){
			
						
				if(!searchForm.find("input[name='keyword']").val()){
					alert("검색어를 입력하세요");
					return false;
				}
				
				searchForm.find("input[name='pageNum']").val("1");
				e.preventDefault();
				
				searchForm.submit();
			});
	});
  </script>
  <script type="text/javascript">
  	$(document).ready(function () {
  		$("#moveLoginPageBtn").on("click", function() {
			self.location = "/login";
		});
  		
  		$("#moveJoinMemberPageBtn").on("click", function() {
			self.location = "/emailAuthority";
		});
  		
  		$("#movieRegisteBtn").on("click", function() {
			self.location = "/admin/register";
		});
	});
  	
  </script>
<body class="body dark-bg">
<div>
    <header class="header da-bg">
    
      <!--logo start-->
      <a href="/cplay/mlist" class="logo">C- <span class="lite">Play</span></a>
      <a href="../board/list" class="board">게시판</a>
      <!--logo end-->
    
      <div class="nav search-row" id="top_menu" style="margin-top: 10px;">
      <ul class="nav top-menu">
      <li>
      <form id='searchForm' action="/cplay/mlist" method='get' class="navbar-form">
      <select name='type' style="display:none;">
           <option value="TGN"
           <c:out value="${pageMakerController.cri.type eq 'TGN'?'selected':''}"/>>" "</option>
           	</select>
     
      	<input class="form-control" placeholder="영화제목,장르,국가를 검색하세요" type="text" name='keyword'
      	 value='<c:out value="${pageMakerController.cri.keyword}" />'> 
      	<button class='search2' type="submit">검색</button>
      </form>
      </ul>
    </div>
    
    <!-- 검색기능 처리 FORM -->
    <form id='actionFormHeader' action="/cplay/mlist" method='get'>
  	<input type='hidden' name='type' value='<c:out value="${pageMakerController.cri.type }"/>'>
	<input type='hidden' name='keyword' value='<c:out value="${pageMakerController.cri.keyword }"/>'>
	</form>
	
	<!-- 로그인을 하지 않을시 로그인 버튼 보임 -->
	<sec:authorize access="isAnonymous()">
		<button class="btn0 btn-button" id="moveLoginPageBtn">로그인</button>
		<button class="btn1 btn-button" id="moveJoinMemberPageBtn">회원가입</button>
	</sec:authorize>
	
	<!-- 로그인시 나오는 아이디  -->
	<sec:authentication property="principal" var="pinfo"/>
	<sec:authorize access="isAuthenticated()">
		<form role="form" method="post" action="/customLogout">
			<button class="btn0 btn-button" id="logoutBtn" type="submit">로그아웃</button>
			<input type="hidden" name="${_csrf.parameterName}" value="${_csrf.token}" />
		</form>
		
		<!-- 관리자 권한에서만 나오는 등록버튼 -->
		<sec:authorize access="hasRole('ROLE_ADMIN')">
			<button class="btn0 btn-button" id="movieRegisteBtn">영화등록</button>
		</sec:authorize>
		<p class="welcome">
		<c:out value="${pinfo.member.mem_id}" />님 환영합니다.</p>
	</sec:authorize>
   </header>
</div>

