<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>

<c:set var="cpt">${pageContext.request.contextPath}</c:set>

<html>
	<head>
		<title>Login</title>
		
		<!-- CSS only -->
		<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-rbsA2VBKQhggwzxH7pPCaAqO46MgnOM80zW1RWuH61DGLwZJEdK2Kadq2F9CUG65" crossorigin="anonymous">
		<!-- JavaScript Bundle with Popper -->
		<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/js/bootstrap.bundle.min.js" integrity="sha384-kenU1KFdBIe4zVF0s0G1M5b4hcpxyD9F7jL+jjXkk+Q2h455rYXK/7HAuoJl+0I4" crossorigin="anonymous"></script>
		<!-- jquery -->
		<script src="https://code.jquery.com/jquery-3.4.1.min.js"></script>
		
		<style>
			.col {
				text-align: center;
			}
		</style>
	</head>

	<body>
		<div class="container position-absolute top-50 start-50 translate-middle"
			style="max-width:700px;">
			<div class="card">
			  <div class="card-header">
			    <h1>Login</h1>
			  </div>
			  <div class="card-body">
				<form id="loginFrm">
				  <div class="mb-3">
				    <label class="form-label">ID</label>
				    <input id="userID" type="text" class="form-control">
				  </div>
				  <div class="mb-3">
				    <label class="form-label">Password</label>
				    <input id="userPW" type="password" class="form-control">
				  </div>
				  <div class="row">
				  	  <div class="col">
					  	<button type="submit" class="btn btn-primary">Login</button>
					  </div>
					  <div class="col">
					  	<button type="reset" class="btn btn-primary">Cancel</button>
					  </div>
				  </div>
				</form>    
			  </div>
			</div>
		</div>
		
		<script>
			const loginFrm = document.getElementById('loginFrm');
	
			loginFrm.addEventListener('submit', event => {
				event.preventDefault();
				const user_ID = document.getElementById('userID');
				const user_PW = document.getElementById('userPW');
				
				$.ajax({
					type:"POST",
					url:"${cpt}/TryLogin",
					data: {
						user_ID: user_ID.value,
						user_PW: user_PW.value
					},
					
					success: function(data) {
						if(data != "") {
							console.log(data);
							alert(data + ' 님 로그인 성공!');
							location.href='${cpt}/Main';	
						}
						else {
							alert('아이디 또는 비밀번호를 확인해주세요.');
						}
					},
					error: function(data) {
						alert('로그인 시도 실패');
					}
				})
			});
			
			loginFrm.addEventListener('reset', event => {
				location.href='${cpt}/Main';
			});
		</script>
	</body>
</html>
