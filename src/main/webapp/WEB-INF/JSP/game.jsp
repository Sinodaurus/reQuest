<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ page session="false"%>
<html>
<head>
<script type="text/javascript"
	src="http://code.jquery.com/jquery-1.10.1.min.js"></script>
<script type="text/javascript">
	$(document)
			.ready(
					function(e) {
						var keys = {};
						var ctxLevel;
						var ctxPlayer;
						var animation = 0;
						var animationSpeed = 5;
						var steps = 0;
						var charDirection = 0;
						var speed = 2;
						var playerX = 50;
						var playerY = 50;
						var oldPlayerX = 50;
						var oldPlayerY = 50;
						var global = 0;
						var ZeroToThree = true;

						$(document).keydown(function(event) {
							keys[event.which] = true;
							if(Object.keys(keys).length > 1 && Object.keys(keys)[0] !== "37") {
								var previousKey = Object.keys(keys)[0];
								delete keys[0];
								keys[previousKey] = true;
								}
							
						}).keyup(function(event) {
							delete keys[event.which];
						})

						
							var level = document.getElementById('level');
							var player = document.getElementById('player');
							if (level.getContext) {
								ctxLevel = level.getContext('2d');
								drawBackground();
							}
							if (player.getContext) {
								var playerImg = new Image();
								ctxPlayer = player.getContext('2d');
								playerImg.src = "${pageContext.request.contextPath}/img/hero.png";
								play();
							}
						

						function play() {
							move();
						}

						function doTheWalk() {
							steps++;
							if (ZeroToThree === true) {
								if(steps == animationSpeed) {
									animation++;
									steps = 0;
								}
								if (animation == 2) {
									ZeroToThree = false;
								}
							} else {
								if(steps == animationSpeed) {
									animation--;
									steps = 0;
								}
								if (animation == 0) {
									ZeroToThree = true;
								}
							}
						}

						function move() {
							oldPlayerX = playerX;
							oldPlayerY = playerY;

							// Left arrow.
							if (keys[37]) {
								charDirection = 32;
								doTheWalk();
								playerX = playerX - speed;
								if (playerX < 0) {
									playerX = 0;
								}
							} else

							// Right arrow.
							if (keys[39]) {
								charDirection = 64;
								doTheWalk();
								playerX = playerX + speed;
								if (playerX > 420) {
									playerX = 420;
								}
							} else

							// Down arrow
							if (keys[40]) {
								charDirection = 0;
								doTheWalk();
								playerY = playerY + speed;
								if (playerY > 418) {
									playerY = 418;
								}
							} else

							// Up arrow 
							if (keys[38]) {
								charDirection = 96;
								doTheWalk();
								playerY = playerY - speed;
								if (playerY < 0) {
									playerY = 0;
								}
							} else {
								animation = 1;
							}

							drawPlayer();

							setTimeout(move, 20);
						}

						function drawBackground() {
							var levelImg = new Image();
							levelImg.src = "${pageContext.request.contextPath}/img/levelForest.png";
							$(document).ready(function() {
								ctxLevel.drawImage(levelImg, 0, 0);
							});
						}

						function drawPlayer() {
							var keeys = "";
							$.each(keys, function(key, value) {
								keeys += key + ":" + value + " ... ";
								});
							$('#footer').html(keeys);
							ctxPlayer.clearRect(oldPlayerX, oldPlayerY, 30, 32);
							
							ctxPlayer.drawImage(playerImg, animation * 30, charDirection,
									30, 32, playerX, playerY, 30, 32);
						}
					});
</script>

<style type="text/css">
canvas {
	border: 1px solid black;
	position: absolute;
	left: 0px;
	top: 30px;
}
#footer {
	position: absolute;
	top: 500px;
}
</style>
</head>
<body>
	<h2 id="footer"></h2>
	<a href="/reQuest">Color scheme</a>
	<a href="/reQuest/snake">Snake</a>
	<a href="/reQuest/game">Game</a>
	<h2 id="header"></h2>
	<canvas id="level" width="450" height="450"></canvas>
	<canvas id="player" width="450" height="450"></canvas>
	<h2 id="footer"></h2>
</body>
</html>
