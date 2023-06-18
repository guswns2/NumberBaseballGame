<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>

<c:set var="cpt">${pageContext.request.contextPath}</c:set>

<!DOCTYPE html>
<html>
<head>
<meta charset="EUC-KR">
<title>Main</title>

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
	<div class="container position-absolute top-50 start-50 translate-middle"
			style="max-width:1000px;">
		<div class="card">
			<div class="card-header" style="text-align: center">
				<h1>MAIN MENU</h1>
			</div>
			<div class="card-body">
				<form id="mainFrm">
					<div class="mb-3">
						${logID} 님 환영합니다!
					</div>
					<div class="mb-3">
						<button onClick="GameStart()" type="button" class="btn btn-primary btn-lg"
							style="width: 100%">Game Start</button>
					</div>
					<div class="mb-3">
						<button onClick="SelectRank()" type="button" class="btn btn-primary btn-lg"
							style="width: 100%">Rank</button>
					</div>
					<div class="mb-3">
						<button onClick="Logout()" type="button" class="btn btn-danger btn-lg"
							style="width: 100%">Logout</button>
					</div>
				</form>
			</div>
		</div>
	</div>
	
	<script>
		function GameStart() {
			location.href="${cpt}/Game";
		}
		
		function SelectRank() {
			location.href="${cpt}/Rank";
		}
		
		function Logout() {
			location.href="${cpt}/";
		}
	</script>
</body>
</html>