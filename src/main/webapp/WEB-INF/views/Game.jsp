<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ page session="false"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>

<c:set var="cpt">${pageContext.request.contextPath}</c:set>

<!DOCTYPE html>
<html>
	<head>
		<meta charset="EUC-KR">
		<title>Game</title>
		
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
		
		<style type="text/css">
			.btn {
				width: 70%;
				height: 100%;
			}
			.row {
				display: flex;
				justify-content: center;
				margin-bottom: 5%;
			}
			.col {
				max-width: 150px;
				padding: 0;
			}
		</style>
	</head>
<body>
	<div class="row text-center" style="background-color: whitesmoke">
		<div class="col">Player : ${logID}</div>
		<div class="col">Answer : <span id="ansNum"></span></div>
		<div class="col">
			<label for="timer">Total Time</label>
			<input id="timer" class="form-control text-center" style="margin-bottom:5%;" type="text" value="3:00" readonly/>
		</div>
	</div>

	<div class="row">
		<div class="col" style="max-width:600px;">
			<div class="card">
				<div class="card-header" style="text-align: center">
					<h2>SCORE : <span id="score">1000</span></h2>
				</div>
				<div class="card-body">
					<form id="gameFrm">
						<ul class="list-group">
						</ul>
					</form>
				</div>
			</div>
		</div>
	
		<div class="col" style="max-width:600px;">
			<div class="card">
				<div class="card-header" style="text-align: center">
					<h2>TRY ATTACK</h2>
				</div>
				<div class="card-body">
					<div class="container text-center">
						<div class="mb-3" 
							style="border-radius:0.5rem; display:flex; justify-content:center; align-items:center; background-color:whitesmoke; width:80%; min-height: 70px; margin:auto;">
							<input id="inputAns" class="form-control text-center" value="" style="margin:3%;"/>
						</div>
						
						<div class="row">
							<div class="col">
								<button type="button" class="numBtn btn btn-primary btn-lg" value="1">1</button>
							</div>
							<div class="col">
								<button type="button" class="numBtn btn btn-primary btn-lg" value="2">2</button>
							</div>
							<div class="col">
								<button type="button" class="numBtn btn btn-primary btn-lg" value="3">3</button>
							</div>
						</div>
						<div class="row">
							<div class="col">
								<button type="button" class="numBtn btn btn-primary btn-lg" value="4">4</button>
							</div>
							<div class="col">
								<button type="button" class="numBtn btn btn-primary btn-lg" value="5">5</button>
							</div>
							<div class="col">
								<button type="button" class="numBtn btn btn-primary btn-lg" value="6">6</button>
							</div>
						</div>
						<div class="row">
							<div class="col">
								<button type="button" class="numBtn btn btn-primary btn-lg" value="7">7</button>
							</div>
							<div class="col">
								<button type="button" class="numBtn btn btn-primary btn-lg" value="8">8</button>
							</div>
							<div class="col">
								<button type="button" class="numBtn btn btn-primary btn-lg" value="9">9</button>
							</div>
						</div>
						<div class="row">
							<div class="col">
								<button type="button" id="okBtn" class="btn btn-primary btn-lg" value="ok" disabled>OK</button>
							</div>
							<div class="col">
								<button type="button" class="numBtn btn btn-primary btn-lg" value="0">0</button>
							</div>
							<div class="col">
								<button type="button" id="eraseBtn" class="btn btn-primary btn-lg" value="erase">⇦</button>
							</div>
						</div>
					</div>
				</div>
			</div>
		</div>
	</div>
	
	<div class="row">
		<div class="col">
			<button id="startBtn" class="btn btn-primary" type="button" onClick="startGame()">Game Start</button>
		</div>
		<div class="col">	
			<button id="endBtn" class="btn btn-danger" type="button" onClick="endGame()" disabled>Game Over</button>
		</div>
		<div class="col">	
			<button class="btn btn-success" type="button" onClick="Main()">Main</button>
		</div>
	</div>
	
	<script>
		const clickBtn = document.getElementsByClassName('numBtn');
		const okBtn = document.getElementById('okBtn');
		const eraseBtn = document.getElementById('eraseBtn');
		const endBtn = document.getElementById('endBtn');
		const startBtn = document.getElementById('startBtn');
		const ansNum = document.getElementById('ansNum');	// 웹에 임의로 보여줄 정답
		const inputAns = document.getElementById('inputAns');
		const score = document.getElementById('score');
		const timer = document.getElementById('timer');
		const subList = document.getElementsByClassName('list-group')[0];
		let scoreNum = Number(score.innerHTML);
		let ansNum2;	// 입력값과 비교할 정답
		let listCnt;	// 정답 입력 횟수
		//let inputVal;
		var ws;
		
		// 메인으로
		function Main() {
			if(confirm("메인으로 돌아가시겠습니까?")) {
				location.href="${cpt}/Main";	
			}
		}
		
		// 게임 시작
		function startGame() {
			listCnt = 1;
			
			$.ajax({	// 문제 생성
				type : "POST",
				url : "${cpt}/AnsGen",
				success : function(data) {
					ansNum.innerHTML = data;
					ansNum2 = data;
				},
				error : function(data) {
					alert("문제 생성 실패");
				} 
			})
			
			okBtn.disabled = false;
			startBtn.disabled = true;
			endBtn.disabled = false;
			
			score.innerText = 1000;
			
			listItem = document.createElement("li");
			listItem.setAttribute('class', 'list-group-item')
			listItem.innerHTML = '게임을 시작합니다!';
			subList.appendChild(listItem);
			
			// 소켓 연결 후 타이머스레드 실행
			openSocket();
		}
		
		// 게임 종료
		function endGame() {
			if(confirm("게임을 포기하시겠습니까?")) {
				listItem = document.createElement("li");
				listItem.setAttribute('class', 'list-group-item')
				listItem.innerHTML = '게임을 종료합니다.';
				subList.appendChild(listItem);
				
				okBtn.disabled = true;
				startBtn.disabled = false;
				endBtn.disabled = true;
				
				closeSocket();	// 소켓 연결 종료
			}
		}
		
		// 숫자 버튼 클릭 시 인풋 창에 출력
		for(var i=0; i< clickBtn.length; i++) {
			clickBtn[i].addEventListener('click', (e) => {
				if(inputAns.value.length<3){
					inputAns.value += e.target.value;	
				}
			});
		}
		
		// 숫자 지우기
		eraseBtn.addEventListener('click', () => {
			//inputVal = inputAns.value;
			if(inputAns.value.length > 0){
				inputAns.value = inputAns.value.substr(0, inputAns.value.length-1);	
			}
		});
		
		// 제출한 답 내역에 출력
		okBtn.addEventListener('click', () => {
			//inputVal = inputAns.value;
			if(inputAns.value.length!=3) {
				alert("3자리 수를 입력해주세요.")
			}
			else if (inputAns.value[0]==inputAns.value[1] || inputAns.value[0]==inputAns.value[2] || inputAns.value[1]==inputAns.value[2]) {
				alert("중복되는 숫자 없이 입력해주세요.")
				inputAns.value = "";
			}
			else {
				// 9회까지
				if(listCnt<10) {
					if(ansNum2.length==2) {
						ansNum2 = '0' + ansNum2;
					}
					let strike = 0;
					let ball = 0;
					let out = 0;
					let listItem = document.createElement("li");
					listItem.setAttribute('class', 'list-group-item')

					// 정답과 입력값 비교
					for(var i = 0; i<inputAns.value.length; i++) {
						if(ansNum2.indexOf(inputAns.value[i]) == -1) {
							++out;
						}
						else if(ansNum2.indexOf(inputAns.value[i]) == i) {
							++strike;
						}
						else {
							++ball;
						}
					}
					
					listItem.innerHTML = listCnt + '회 : ' + inputAns.value + '	'
										 + strike + 'S ' + ball + 'B ' + out + 'O';
					++listCnt;
					subList.appendChild(listItem);
					inputAns.value="";
					
					// 정답 or 횟수 소진
					if(strike==3 || listCnt == 10){		
						scoreNum = Number(score.innerHTML);
						listItem = document.createElement("li");
						listItem.setAttribute('class', 'list-group-item')
						
						if(listCnt == 10) {	// 횟수 소진
							listItem.innerHTML = '횟수를 모두 소진하였습니다. 게임을 종료합니다.' + '</br>' + '${logID}' + ' 님의 최종 점수 : ' + score.innerHTML;
						}
						else {	// 정답
							score.innerHTML = scoreNum+500;
							listItem.innerHTML = '정답입니다! 게임을 종료합니다.' + '</br>' + '${logID}' + ' 님의 최종 점수 : ' + score.innerHTML;
						}
						subList.appendChild(listItem);
						
						okBtn.disabled = true;
						startBtn.disabled = false;
						endBtn.disabled = true;
						
						// 랭킹 등록 후 게임 종료
						$.ajax({
							type: "POST",
							url: "${cpt}/InsertRank",
							data: {
								user_ID: "${logID}",
								score: Number(score.innerHTML),
								tryNum: listCnt-1,
								remainTime: timer.value
							},
							success: function(data) {
								alert("랭킹 등록 완료! 게임을 종료합니다.");
								closeSocket();
							},
							error: function(data) {
								alert("랭킹 등록 실패");
							}
						})					
					}
					// 오답
					else {	
						scoreNum = Number(score.innerHTML);
						score.innerHTML = scoreNum-100;
					}
				}
			}
		});
		
		// 소켓
		function openSocket() {
			if(ws !== undefined && ws.readyState !== WebSocket.CLOSED) {
				console.log("웹 소켓 이미 열려있음" + ws.readyState);
				return;
			}
			else {
				ws = new WebSocket("ws://localhost:8080/baseballgame/echo.do");
			}
			
			ws.onopen = function(e) {
				if(e.data === undefined) {
					console.log("웹 소켓 연결 시작1");
					console.log(ws.readyState);
					return;
				}
				console.log("웹 소켓 연결 시작2");
			};
			
			ws.onmessage = function(e) {
				console.log("웹 소켓 수신 메시지 : " + e.data);
				timer.value = e.data;
			};
			
			ws.onclose = function(e) {
				console.log("웹 소켓 연결 종료1");
			};
		}

		function closeSocket() {
			ws.close();	
			console.log("웹 소켓 연결 종료2");
		}
	 </script>
</body>
</html>

