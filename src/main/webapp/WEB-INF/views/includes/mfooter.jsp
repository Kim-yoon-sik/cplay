<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

 <script>
  function setElementNodeNext(node){
	while(node.nodeType !== 1){
		node = node.nextSibling;
	}
	return node;
}
// 현재 노드 앞의 Element Node를 탐색하는 함수
function setElementNodePre(node){
	while(node.nodeType !== 1){
		node = node.previousSibling;
	}
	return node;
}
 
function nodeRotate() {
	
	var list = document.getElementById("list");
	var firstChild = list.firstChild, 
		lastChild = list.lastChild;
 
	function swapNodes(){
 
		// Element 노드 선택
		firstChild = setElementNodeNext(list.firstChild);
		lastChild = setElementNodePre(list.lastChild);
 
		// 마지막 목록을 처음으로 이동하여 목록을 순환시킴
		list.insertBefore(firstChild, lastChild); 
 
		// 첫째 elment node 선택
		firstChild = setElementNodeNext(list.firstChild);
 
		// css 슬라이더 위치 초기화(CSS transition 중단)
		list.className = ""; 
 
		// transitionend 이벤트 리스너 초기화
		list.removeEventListener("transitionend", swapNodes);
 
	}
 
	// 슬라이더 이동 효과(css trasition)를 위란 클래스 지정
	list.className = "animate"; 
 
	// list 목록의  트랜지션이 끝난 후, 다음 보여줄 목록들의 배치 수행
	list.addEventListener("transitionend", swapNodes);
 
}
 
var btn = document.getElementById("btn_r");
btn.addEventListener("click", nodeRotate, false);
 </script>
 
 <script>
  function setElementNodeNext(node){
	while(node.nodeType !== 1){
		node = node.nextSibling;
	}
	return node;
}
// 현재 노드 앞의 Element Node를 탐색하는 함수
function setElementNodePre(node){
	while(node.nodeType !== 1){
		node = node.previousSibling;
	}
	return node;
}
 
function nodeRotate() {
	
	var list = document.getElementById("list");
	var firstChild = list.firstChild, 
		lastChild = list.lastChild;
 
	function swapNodes(){
 
		// Element 노드 선택
		firstChild = setElementNodeNext(list.firstChild);
		lastChild = setElementNodePre(list.lastChild);
 
		// 마지막 목록을 처음으로 이동하여 목록을 순환시킴
		list.insertBefore(lastChild, firstChild); 
 
		// 첫째 elment node 선택
		firstChild = setElementNodeNext(list.firstChild);
 
		// css 슬라이더 위치 초기화(CSS transition 중단)
		list.className = ""; 
 
		// transitionend 이벤트 리스너 초기화
		list.removeEventListener("transitionend", swapNodes);
 
	}
 
	// 슬라이더 이동 효과(css trasition)를 위란 클래스 지정
	list.className = "animate"; 
 
	// list 목록의  트랜지션이 끝난 후, 다음 보여줄 목록들의 배치 수행
	list.addEventListener("transitionend", swapNodes);
 
}
 
var btn = document.getElementById("btn_r2");
btn.addEventListener("click", nodeRotate, false);
 </script>
 
  <script>
  function setElementNodeNext(node){
	while(node.nodeType !== 1){
		node = node.nextSibling;
	}
	return node;
}
// 현재 노드 앞의 Element Node를 탐색하는 함수
function setElementNodePre(node){
	while(node.nodeType !== 1){
		node = node.previousSibling;
	}
	return node;
}
 
function nodeRotate() {
	
	var list = document.getElementById("list1");
	var firstChild = list.firstChild, 
		lastChild = list.lastChild;
 
	function swapNodes(){
 
		// Element 노드 선택
		firstChild = setElementNodeNext(list.firstChild);
		lastChild = setElementNodePre(list.lastChild);
 
		// 마지막 목록을 처음으로 이동하여 목록을 순환시킴
		list.insertBefore(lastChild, firstChild); 
 
		// 첫째 elment node 선택
		firstChild = setElementNodeNext(list.firstChild);
 
		// css 슬라이더 위치 초기화(CSS transition 중단)
		list.className = ""; 
 
		// transitionend 이벤트 리스너 초기화
		list.removeEventListener("transitionend", swapNodes);
 
	}
 
	// 슬라이더 이동 효과(css trasition)를 위란 클래스 지정
	list.className = "animate"; 
 
	// list 목록의  트랜지션이 끝난 후, 다음 보여줄 목록들의 배치 수행
	list.addEventListener("transitionend", swapNodes);
 
}
 
var btn = document.getElementById("btn_r1");
btn.addEventListener("click", nodeRotate, false);
 </script>
 
  <script>
  function setElementNodeNext(node){
	while(node.nodeType !== 1){
		node = node.nextSibling;
	}
	return node;
}
// 현재 노드 앞의 Element Node를 탐색하는 함수
function setElementNodePre(node){
	while(node.nodeType !== 1){
		node = node.previousSibling;
	}
	return node;
}
 
function nodeRotate() {
	
	var list = document.getElementById("list1");
	var firstChild = list.firstChild, 
		lastChild = list.lastChild;
 
	function swapNodes(){
 
		// Element 노드 선택
		firstChild = setElementNodeNext(list.firstChild);
		lastChild = setElementNodePre(list.lastChild);
 
		// 마지막 목록을 처음으로 이동하여 목록을 순환시킴
		list.insertBefore(firstChild, lastChild); 
 
		// 첫째 elment node 선택
		firstChild = setElementNodeNext(list.firstChild);
 
		// css 슬라이더 위치 초기화(CSS transition 중단)
		list.className = ""; 
 
		// transitionend 이벤트 리스너 초기화
		list.removeEventListener("transitionend", swapNodes);
 
	}
 
	// 슬라이더 이동 효과(css trasition)를 위란 클래스 지정
	list.className = "animate"; 
 
	// list 목록의  트랜지션이 끝난 후, 다음 보여줄 목록들의 배치 수행
	list.addEventListener("transitionend", swapNodes);
 
}
 
var btn = document.getElementById("btn_r3");
btn.addEventListener("click", nodeRotate, false);
 </script>
 </body>
 </html>