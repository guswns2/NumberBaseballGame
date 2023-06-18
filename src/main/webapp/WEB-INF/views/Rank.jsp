<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ page session="false" %>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>

<c:set var="cpt">${pageContext.request.contextPath}</c:set>

<!DOCTYPE html>
<html>
<head>
	<meta charset="EUC-KR">
	<title>Rank</title>
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
				<h2>RANK</h2>
			</div>
			<div class="card-body text-center">
				<form id="rankFrm">
					<table class="table">
						<thead>
							<tr>
								<th>순위</th>
								<th>아이디</th>
								<th>점수</th>
								<th>시도 횟수</th>
								<th>남은 시간</th>
							</tr>
						</thead>
						<tbody>
							<c:forEach items="${rankList}" var="rkList" varStatus="status">
								<tr>
									<td><c:out value="${status.count}" /></td>
									<td>${rkList.user_ID}</td>
									<td>${rkList.score}</td>
									<td>${rkList.tryNum}</td>
									<td>${rkList.remainTime}</td>
								</tr>
							</c:forEach>
						</tbody>
						<tfoot>
							<td colspan=5><button onClick="Main()" class="btn btn-primary" type="button">Main</button></td>
						</tfoot>
					</table>
				</form>
			</div>
		</div>
	
	</div>
	
	<script>
		function Main() {
			location.href="${cpt}/Main";
		}
	</script>
</body>
</html>