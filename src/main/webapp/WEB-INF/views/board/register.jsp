<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<%@ taglib uri="http://www.springframework.org/security/tags"
	prefix="sec"%>
<%@ include file="../includes/mheader.jsp"%>

<div class="row">
	<div class="col-lg-12">
		<h1 class="page-header">등록페이지</h1>
	</div>
</div>

<div class="row">
	<div class="col-lg-12">
		<div class="panel-heading">게시물 등록</div>

		<div class="panel-body" style="background:white;">
			<form role="form" action="/board/register" method="post">
				<input type="hidden" name="${_csrf.parameterName}"
					value="${_csrf.token}" />
				<div class="form-group">
					<label>제목</label> <input class="form-control" name="title">
				</div>
				<div class="form-group">
					<label>내용</label>
					<textarea class="form-control" rows="3" name="content"></textarea>
				</div>
				<div class="form-group">
					<label>작성자</label> <input class="form-control" name="writer"
						value='<sec:authentication property="principal.username"/>'
						readonly="readonly">
				</div>
				<button type="submit" class="btn btn-default">등록</button>
				<button type="reset" class="btn btn-default">리셋</button>
			</form>
		</div>
	</div>
</div>
<!-- /.row -->

<!-- /.row -->
<div class="row">
	<div class="col-lg-12">
		<div class="panel panel-default">
			<div class="panel-heading">파일 첨부</div>
			<div class="panel-body">
				<div class="form-group uploadDiv">
					<input type="file" name="uploadFile" multiple>
				</div>
<style>
.uploadResult {
	width: 100%;
	background-color: gray;
}

.uploadResult ul {
	display: flex;
	flex-flow: row;
	justify-content: center;
	align-items: center;
}

.uploadResult ul li {
	list-style: none;
	padding: 10px;
	align-content: center;
	text-align: center;
}

.uploadResult ul li img {
	width: 20px;
}

.uploadResult ul li span {
	color: white;
}

.bigPictureWrapper {
	position: absolute;
	display: none;
	justify-content: center;
	align-items: center;
	top: 0%;
	width: 100%;
	height: 100%;
	background-color: gray;
	z-index: 100;
	background: rgba(255, 255, 255, 0.5);
}

.bigPicture {
	position: relative;
	display: flex;
	justify-content: center;
	align-items: center;
}

.bigPicture img {
	width: 600px;
}
</style>
				<div class="uploadResult">
					<ul>
					</ul>
				</div>
			</div>
			<!-- /.panel-body -->
		</div>
		<!-- /.panel -->
	</div>
	<!-- /.col-lg-12 -->
</div>
<!-- /.row -->

<script src="https://code.jquery.com/jquery-3.3.1.min.js"
	integrity="sha256-FgpCb/KJQlLNfOu91ta32o/NMZxltwRo8QtmkMRdAu8="
	crossorigin="anonymous"></script>

<script>
$(document).ready(function(e) {
	var formObj = $("form[role='form']");
	
	//submit의 기본동작을 막는 작업
	$("button[type='submit']").on("click", function(e) {
		e.preventDefault();
		console.log('submit clicked');
		var str = "";
		
		$(".uploadResult ul li").each(function(i, obj) {
			var jobj = $(obj);
			console.dir(jobj);
			
			str += "<input type='hidden' name='attachList["+i+"].fileName' value='"+jobj.data("filename")+"'>";
			str += "<input type='hidden' name='attachList["+i+"].uuid' value='"+jobj.data("uuid")+"'>";
			str += "<input type='hidden' name='attachList["+i+"].uploadPath' value='"+jobj.data("path")+"'>";
			str += "<input type='hidden' name='attachList["+i+"].fileType' value='"+jobj.data("type")+"'>";
		});
		
		formObj.append(str).submit(); 
	});

	var regex = new RegExp("(.*?)\.(exe|sh|zip|alz)$");
	var maxSize = 5242880;

	//첨부파일 유효성 검사 함수
	function checkExtension(fileName, fileSize) {
		if (fileSize >= maxSize) {
			alert("파일 사이즈 초과");
			return false;
		}

		if (regex.test(fileName)) {
			alert("해당 종류의 파일은 업로드 할 수 없습니다.");
			return false;
		}
		return true;
	}

	//섬네일 등을 만들어서 처리하는 부분
	 function showUploadResult (uploadResultArr) {
	 	if(!uploadResultArr || uploadResultArr.length == 0){return;}

	 	var uploadUL = $(".uploadResult ul");

	 	var str = "";

	 	$(uploadResultArr).each(function (i, obj) {
	 		if(obj.image){
				var fileCallPath =  encodeURIComponent( obj.uploadPath+ "/s_"+obj.uuid +"_"+obj.fileName);
				str += "<li data-path='"+obj.uploadPath+"'";
				str +=" data-uuid='"+obj.uuid+"' data-filename='"+obj.fileName+"' data-type='"+obj.image+"'"
				str +" ><div>";
				str += "<span> "+ obj.fileName+"</span>";
				str += "<button type='button' data-file=\'"+fileCallPath+"\' "
				str += "data-type='image' class='btn btn-warning btn-circle'><i class='fa fa-times'></i></button><br>";
				str += "<img src='/display?fileName="+fileCallPath+"'>";
				str += "</div>";
				str +"</li>";
			}else{
				var fileCallPath =  encodeURIComponent( obj.uploadPath+"/"+ obj.uuid +"_"+obj.fileName);			      
			    var fileLink = fileCallPath.replace(new RegExp(/\\/g),"/");
			      
				str += "<li "
				str += "data-path='"+obj.uploadPath+"' data-uuid='"+obj.uuid+"' data-filename='"+obj.fileName+"' data-type='"+obj.image+"' ><div>";
				str += "<span> "+ obj.fileName+"</span>";
				str += "<button type='button' data-file=\'"+fileCallPath+"\' data-type='file' " 
				str += "class='btn btn-warning btn-circle'><i class='fa fa-times'></i></button><br>";
				str += "<img src='/resources/img/attach.png'></a>";
				str += "</div>";
				str +"</li>";
			}
	 		
/* 	 		if(obj.image){
	 			var fileCallPath = encodeURIComponent(obj.uploadPath + "/s_" + obj.uuid + "_" + obj.fileName);
	 			str += "<li><div>";
	 			str += "<span>" + obj.fileName + "</span>";
	 			//str += "<button type='button' class='btn btn-warning btn-circle'><i class='fa fa-times'></i></button><br>";
	 			str += "<button type='button' data-file=\'"+fileCallPath+"\' data-type='image' class='btn btn-warning btn-circle'><i class='fa fa-times'></i></button><br>";
	 			str += "<img src= '/display?fileName=" + fileCallPath + "'>";
	 			str += "</div>"
	 			str += "</li>"
	 		}else{
	 			var fileCallPath = encodeURIComponent(obj.uploadPath + "/" + obj.uuid + "_" + obj.fileName);
	 			var fileLink = fileCallPath.replace(new RegExp(/\\/g), "/");

	 			str += "<li><div>";
	 			str += "<span>" + obj.fileName + "</span>";
	 			//str += "<button type='button' class='btn btn-warning btn-circle'><i class='fa fa-times'></i></button><br>";
	 			str += "<button type='button' data-file=\'"+fileCallPath+"\' data-type='file' class='btn btn-warning btn-circle'><i class='fa fa-times'></i></button><br>";
	 			str += "<img src= '/resources/img/attach.png'>"; //여기서 </a>가 왜나옴??
	 			str += "</div>"
	 			str += "</li>"
	 		} */
	 	});
	 	uploadUL.append(str);
	 }

	//file 타입의 input 태그가 작동할 때, 파일 업로드 처리가 이루어짐
	$("input[type='file']").change(function(e) {
		var formData = new FormData();

		var inputFile = $("input[name='uploadFile']");

		var files = inputFile[0].files;

		for (var i = 0; i < files.length; i++) {

			if (!checkExtension(files[i].name, files[i].size)) {
				return false;
			}

			formData.append("uploadFile", files[i]); //여기서 uploadFile은 컨틀롤러 함수에 넘겨주는 파일 배열
			/* console.log(files); */
		}

		$.ajax({
			url : '/uploadAjaxAction',
			processData : false,
			contentType : false,
			data : formData,
			type : 'POST',
			beforeSend: function(xhr) {
				xhr.setRequestHeader("${_csrf.headerName}", "${_csrf.token}"); 
			},
			dataType : 'json',
			success : function(result) {
				console.log(result);
				showUploadResult(result); //업로드 결과 처리 함수
			}
		});//$.ajax
	});
	
	$(".uploadResult").on("click", "button", function(e) {
		console.log("delete file");
		
		var targetFile = $(this).data("file");
	    var type = $(this).data("type");
	    
	    var targetLi = $(this).closest("li");
	    
	    $.ajax({
	      url: '/deleteFile',
	      data: {fileName: targetFile, type:type},
	      dataType:'text',
	      type: 'POST',
	      beforeSend: function(xhr) {
				xhr.setRequestHeader("${_csrf.headerName}", "${_csrf.token}"); 
			},
	      success: function(result){
	         alert(result);
	           
	         targetLi.remove();
	         }
	    }); //$.ajax 
	});
});
</script>


<%@include file="../includes/footer.jsp"%>