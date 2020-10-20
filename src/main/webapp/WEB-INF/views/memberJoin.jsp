<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>

<!DOCTYPE html>
<html lang="ko">

<head>
<meta charset="utf-8">
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<meta name="description"
	content="Creative - Bootstrap 3 Responsive Admin Template">
<meta name="author" content="GeeksLabs">
<meta name="keyword"
	content="Creative, Dashboard, Admin, Template, Theme, Bootstrap, Responsive, Retina, Minimal">
<link rel="shortcut icon" href="img/favicon.png">

<title>Cplay 회원가입</title>

<!-- Bootstrap CSS -->
<link href="/resources/css/bootstrap.min.css" rel="stylesheet">
<!-- bootstrap theme -->
<link href="/resources/css/bootstrap-theme.css" rel="stylesheet">
<!--external css-->
<!-- font icon -->
<link href="/resources/css/elegant-icons-style.css" rel="stylesheet" />
<link href="/resources/css/font-awesome.min.css" rel="stylesheet" />
<!-- Custom styles -->
<link href="/resources/css/style.css" rel="stylesheet">
<link href="/resources/css/style-responsive.css" rel="stylesheet" />

<!-- 구글 아이디 중복체크 api -->
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>

<!-- HTML5 shim and Respond.js IE8 support of HTML5 -->
<!--[if lt IE 9]>
      <script src="js/html5shiv.js"></script>
      <script src="js/respond.min.js"></script>
      <script src="js/lte-ie7.js"></script>
    <![endif]-->

<!-- =======================================================
      Theme Name: NiceAdmin
      Theme URL: https://bootstrapmade.com/nice-admin-bootstrap-admin-html-template/
      Author: BootstrapMade
      Author URL: https://bootstrapmade.com
    ======================================================= -->
</head>

<body class="login-img3-body">
	<div class="container">
		<form class="login-form" action="/memberJoin" method="post">
		<div style="color:white;margin-left: 31px;"><h1>회원가입</h1></div>
			<div class="login-wrap">
				<div class="form-group col-lg-12">
					<label for="mem_id" class="control-label">아이디<span
						class="required">*</span></label> <input class=" form-control" id="mem_id"
						name="mem_id" type="text" placeholder="ID"/>
					<div class="eheck_font" id="id_check"></div>
				</div>
				<div class="form-group col-lg-12">
					<label for="mem_pw" class="control-label">비밀번호 <span
						class="required">*</span></label> <input class="form-control" id="mem_pw"
						name="mem_pw" type="password" placeholder="PASSWORD"/>
					<div class="eheck_font" id="pw_check"></div>
				</div>
				<div class="form-group col-lg-12">
					<label for="mem_pw2" class="control-label">비밀번호 확인 <span
						class="required">*</span></label> <input class="form-control "
						id="mem_pw2" name="mem_pw2" type="password" placeholder="Confirm Password"/>
					<div class="eheck_font" id="pw2_check"></div>
				</div>
				
				<div class="form-group col-lg-12">
					<label for="mem_name" class="control-label">이름<span
						class="required">*</span></label> <input class=" form-control"
						id="mem_name" name="mem_name" type="text" placeholder="NAME"/>
					<div class="eheck_font" id="name_check"></div>
				</div>
				
				<div class="form-group col-lg-12">
					<label for="mem_birth" class="control-label">생년월일<span
						class="required">*</span></label> <input class=" form-control"
						id="mem_birth" name="mem_birth" type="text" placeholder="ex) 20211125" />
					<div class="eheck_font" id="birth_check"></div>
				</div>
				<div class="form-group col-lg-12">
					<label for="mem_email" class="control-label">이메일 주소<span
						class="required">*</span></label> <!-- <input class="form-control "
						id="mem_email" name="mem_email" type="email" placeholder="E-MAIL"/> -->
						<input class="form-control" id="mem_email" name="mem_email" type="email" value='<c:out value="${mem_email}"/>' readonly="readonly"/>
					<div class="eheck_font" id="email_check"></div>
				</div>
				<div class="form-group col-lg-12">
					<label for="mem_phone" class="control-label ">휴대폰 번호('-'없이
						번호만 입력해주세요)<span class="required">*</span>
					</label> <input class="form-control " id="mem_phone" name="mem_phone"
						type="text" placeholder="Phone Number"/>
					<div class="eheck_font" id="phone_check"></div>
				</div>
				<div class="form-group col-lg-12">
					<label for="mem_gender" class="control-label">성별<span
						class="required">*</span>
						<div class="radio">
							<label><input type="radio" name="mem_gender"
								id="mem_gender" value="male" checked>남</label>
						</div>
						<div class="radio">
							<label><input type="radio" name="mem_gender"
								id="mem_gender" value="female">여</label>
						</div>
					</label>
				</div>
				<div class="form-group col-lg-12">
					<label for="mem_oaddress" class="control-label">우편번호<span
						class="required">*</span></label> 
						<input class="form-control"	placeholder="ZIPCODE" name="mem_oaddress" id="mem_oaddress"
						type="text" readonly="readonly">
					<button type="button" class="btn btn-default"
						onclick="execPostCode();">
						<i class="fa fa-search"></i> 우편번호 찾기
					</button>
				</div>
				<div class="form-group col-lg-12">
					<label for="mem_address" class="control-label">도로명 주소<span
						class="required">*</span></label> <input class="form-control"
						name="mem_address" id="mem_address"
						type="text" readonly="readonly" placeholder="ADDRESS"/>
				</div>
				<div class="form-group col-lg-12">
					<label for="mem_detailaddress" class="control-label">상세 주소<span
						class="required">*</span></label> <input class="form-control"
						name="mem_detailaddress" id="mem_detailaddress"
						type="text" placeholder="Detail Address"/>
				</div>
				<div class="form-group">
					<label for="agree" class="control-label col-lg-6">Agree to
						Our Policy <span class="required">*</span>
					</label>
					<input type="checkbox" style="width: 20px" class="checkbox form-control" id="agree" name="agree" />

					<button class="btn btn-primary btn-lg btn-block" type="submit">회원가입</button>
					<button class="btn btn-info btn-lg btn-block" id="memberJoincancelBtn" type="button">취소</button>
				</div>
				<input type="hidden" name="${_csrf.parameterName}" value="${_csrf.token}" />
		</form>
	</div>

	<!-- javascripts -->
	
	<script src="/resources/js/jquery.js"></script>
	<script src="/resources/js/bootstrap.min.js"></script>
	<!-- nice scroll -->
	<script src="/resources/js/jquery.scrollTo.min.js"></script>
	<script src="/resources/js/jquery.nicescroll.js" type="text/javascript"></script>

	<!-- 주소 js  -->
	<script src="/resources/js/daumAddress-api.js"></script>
	
	<!-- daum 도로명주소 찾기 api -->
	<!-- <script src="http://dmaps.daum.net/map_js_init/postcode.v2.js"></script> -->

	<!-- 회원 항목 유효성 검사 -->
	<script src="/resources/js/form-validation-script-member.js"></script>

	<!-- jquery validate js -->
	<!-- <script type="text/javascript" src="/resources/js/jquery.validate.min.js"></script> -->

	<!-- custom form validation script for this page-->
	<!-- <script src="/resources/js/form-validation-script.js"></script> -->

	<!--custome script for all page-->
	<script src="/resources/js/scripts.js"></script>
 	<script src="http://dmaps.daum.net/map_js_init/postcode.v2.js"></script>	
	
	<script type="text/javascript">
  	$(document).ready(function () {
  		$("#memberJoincancelBtn").on("click", function() {
			self.location = "/login";
		});
	});
  </script>
</body>

</html>
