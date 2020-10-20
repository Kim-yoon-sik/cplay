<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
  <meta charset="utf-8">
  <meta name="viewport" content="width=device-width, initial-scale=1.0">
  <meta name="description" content="Creative - Bootstrap 3 Responsive Admin Template">
  <meta name="author" content="GeeksLabs">
  <meta name="keyword" content="Creative, Dashboard, Admin, Template, Theme, Bootstrap, Responsive, Retina, Minimal">
  <link rel="shortcut icon" href="img/favicon.png">
<meta charset="UTF-8">
<title>Insert title here</title>

 <!-- Bootstrap CSS -->
  <link href="/resources/css/bootstrap.min.css" rel="stylesheet">
  <!-- bootstrap theme -->
  <link href="/resources/css/bootstrap-theme.css" rel="stylesheet">
  <!--external css-->
  <!-- font icon -->
  <link href="/resources/css/elegant-icons-style.css" rel="stylesheet" />
  <link href="/resources/css/font-awesome.css" rel="stylesheet" />
  <!-- Custom styles -->
  <link href="/resources/css/style.css" rel="stylesheet">
  <link href="/resources/css/style-responsive.css" rel="stylesheet" />

</head>
<body class="login-img3-body">

<a href="/cplay/mlist" class="logo">C- <span class="lite">Play</span></a>
  <div class="container">
	<!-- 로그인 처리작업은 '/login'에서 POST 방식으로 처리된다  -->
    <form class="login-form" action="/login" method="post">
      <div class="login-wrap">
        <p class="login-img"><i class="icon_lock_alt"></i></p>
        <div class="input-group">
          <span class="input-group-addon"><i class="icon_profile"></i></span>
          <input type="text" name="username" class="form-control" placeholder="Username" autofocus>
        </div>
        <div class="input-group">
          <span class="input-group-addon"><i class="icon_key_alt"></i></span>
          <input type="password" name="password" class="form-control" placeholder="Password">
        </div>
        <label class="checkbox">
                <input type="checkbox" name="remember-me"> 자동 로그인
                <span class="pull-right"> <a href="#"> Forgot Password?</a></span>
        </label>
        <button class="btn btn-primary btn-lg btn-block" type="submit">로그인</button>
        <button class="btn btn-info btn-lg btn-block" id="memberJoinBtn" type="button">회원가입</button>
      </div>
      <input type="hidden" name="${_csrf.parameterName}" value="${_csrf.token}" />
    </form>

	<div class="text-right">
      <div class="credits">
          Designed by <a href="https://bootstrapmade.com/">BootstrapMade</a>
        </div>
    </div>
  </div>
  
  <script src="/resources/js/jquery.js"></script>
  <script type="text/javascript">
  	$(document).ready(function () {
  		$("#memberJoinBtn").on("click", function() {
			self.location = "/emailAuthority";
		});
	});
  </script>
  
  	<%-- <c:if test="${param.logout != null}">
    	<script>
    		$(document).ready(function() {
				alert("로그아웃하였습니다.");
			});	
    	</script>
   	</c:if> --%>
  
</body>
</html>