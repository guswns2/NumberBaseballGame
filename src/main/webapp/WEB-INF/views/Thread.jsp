<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ page session="false" %>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>

<!DOCTYPE html>
<html>
<head>
	<meta charset="EUC-KR">
	<title>Insert title here</title>
	
	<!-- CSS only -->
	<link
		href="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/css/bootstrap.min.css"
		rel="stylesheet"
		integrity="sha384-rbsA2VBKQhggwzxH7pPCaAqO46MgnOM80zW1RWuH61DGLwZJEdK2Kadq2F9CUG65"
		crossorigin="anonymous">
	<!-- JavaScript Bundle with Popper -->
	<script
		src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/js/bootstrap.bundle.min.js"
		integrity="sha384-kenU1KFdBIe4zVF0s0G1M5b4hcpxyD9F7jL+jjXkk+Q2h455rYXK/7HAuoJl+0I4"
		crossorigin="anonymous"></script>
	<!-- jquery -->
	<script src="https://code.jquery.com/jquery-3.4.1.min.js"></script>
	
	
</head>

<body>
	<h1>
		Timer Thread1 
	</h1>
	
	<form name="form1" id="form1" method="post" onsubmit="return false;">
		<input type="text" name="txt1" id="txt1"/>
	</form>
	
	<c:choose>
		<c:when test="${ableToRunThread == false}">
			<input id="testingBtn" type="button" onclick="testing()" value="testing" disabled="disabled"/>
		</c:when>
		<c:otherwise>
			<input id="testingBtn" type="button" onclick="testing()" value="test Ready"/>
		</c:otherwise>
	</c:choose>
	
	<input id="timerTh" type="button" onclick="TimerThread()" value="start timer"/>
	
	<script type="text/javascript">
		function testing(){
			$.ajax({
				url:"timerThread",
				type:"POST",
				cache:false,
				data:$("#form1").serialize(),
				async:false,
				success:function(data){
			
				},
				error:function(e){
					console.log("err : " + e);
				}
			});
		}
		
		function TimerThread(){
			$.ajax({
				url:"timerThread",
				type:"POST",
				cache:false,
				data:$("#form1").serialize(),
				async:false,
				success:function(data){
					$('#timerTh').attr("disabled","disabled");
					$('#timerTh').val('Timing');
				},
				error:function(e){
					console.log("err : " + e);
				}
			});
		}
	</script>
</body>
</html>