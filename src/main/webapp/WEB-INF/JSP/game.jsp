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
						var keys = [];
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
						var keysInArray = 0;
						var key;

// 						$(document).keydown(function(event) {
// 							var keyPressed = false;
// 							keys[keysInArray] = event.which;
// // 							if()
// 							if(keysInArray > 1 && keys[0] !== 37) {
// 								var previousKey = keys[0];
// 								keys[0] = keys[1];
// 								keys[1] = previousKey;
// 								keys.length = 2;
// 								}
// 							if(keyPressed === false) {
// 								keysInArray++;
// 							}
// 						}).keyup(function(event) {
// 							keys[keysInArray] = 0;
// 							keysInArray--;
// 							if(keysInArray === 0) {
// 								keys = [];
// 								}
// 						})

var Key = {
  _pressed: {},

  LEFT: 37,
  UP: 38,
  RIGHT: 39,
  DOWN: 40,
  
  isDown: function(keyCode) {
    return this._pressed[keyCode];
  },
  
  onKeydown: function(event) {
    this._pressed[event.keyCode] = true;
  },
  
  onKeyup: function(event) {
    delete this._pressed[event.keyCode];
  }
};
var keypressed = false;
// window.addEventListener('keyup', function(event) { Key.onKeyup(event); }, false);
// window.addEventListener('keydown', function(event) { Key.onKeydown(event); }, false);
						
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

							window.addEventListener('keydown', function(event) {key = event.which; keypressed = true;});
							window.addEventListener('keyup', function(event) {key = event.which; keypressed = false;});

						function play() {
							move();
						}

						//Walking animation ---------------------
						
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

						//Move the player -----------------------
						
						function move() {
							oldPlayerX = playerX;
							oldPlayerY = playerY;
							if(keypressed === true) {
								switch(key) {
								// Left arrow.
								case 37:
									charDirection = 32;
									doTheWalk();
									playerX = playerX - speed;
									if (playerX < 0) {
										playerX = 0;
									}
									break;
	
								// Right arrow.
								case 39:
									charDirection = 64;
									doTheWalk();
									playerX = playerX + speed;
									if (playerX > 420) {
										playerX = 420;
									}
									break;
	
								// Down arrow
								case 40:
									charDirection = 0;
									doTheWalk();
									playerY = playerY + speed;
									if (playerY > 418) {
										playerY = 418;
									}
									break;
	
								// Up arrow 
								case 38:
									charDirection = 96;
									doTheWalk();
									playerY = playerY - speed;
									if (playerY < 0) {
										playerY = 0;
									}
									break;
								default:
										animation = 0;
										break;
								}
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
							$('#footer').html(keeys + " ------------ " + keysInArray);
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
