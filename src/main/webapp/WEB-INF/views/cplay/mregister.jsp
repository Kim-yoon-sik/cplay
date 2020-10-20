<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<%@include file="../includes/mheader.jsp"%>

 <style>
        div.item:nth-child(1) { background-image: url(/resources/img/m0.png); }
 
    </style>
    <script src="https://code.jquery.com/jquery-3.5.1.js"></script>
    <script>
        $(document).ready(function () {
            // 변수를 선언합니다.
            var width = $('[data-role="slider"]').attr('data-width');
            var height = $('[data-role="slider"]').attr('data-height');
            var count = $('[data-role="slider"] div.item').length;
            
            // 스타일을 적용합니다.
            $('[data-role="slider"]').css({
                position: 'relative',
                overflow: 'hidden',
                width: width,
                height: height
            }).find('.container').css({
                position: 'absolute',
                width: count * width,
                overflow: 'hidden'
            }).find('.item').css({
                width: width,
                height: height,
                float: 'left'
            });
            // 변수를 선언합니다.
            var currentPage = 0;
            var changePage = function () {
                $('[data-role="slider"] > .container').animate({
                    left: -currentPage * width
                }, 500);
            };
  
        });
    </script>
    
       
	</script>
<div data-role="slider" data-width="2120" data-height="500">
        <div class="container">
            <div class="item">
            </div>
            </div>
            </div>
       