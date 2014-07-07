<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ page session="false"%>
<html>
<head>
<script type="text/javascript"
	src="http://code.jquery.com/jquery-1.10.1.min.js"></script>
<script type="text/javascript">
	var ctx;
	var posX = 25;
	var posY = 25;
	var movingSpeed = 25;
	var milSeconds = 20;
	var directionX;
	var directionY;
	var coords = [];
	var coordsToClear = [];
	var red = 0;
	var green = 0;
	var blue = 255;
	var roadblockCounter = 0;
	var index = 0;
	var memoryOfPath = 20;
	var firstPart = /\d*(?=,)/;
	var secondPart = /\d*(?= )/;

	function init() {
		var canvas = document.getElementById('board');
		if (canvas.getContext) {
			ctx = canvas.getContext('2d');
			random();
		}
	}

	function random() {
		setInterval(ajax, milSeconds);
	}

	function ajax() {
		$.ajax({
			url : 'snakeAjax.html',
			success : function(data) {
				directionX = data.x;
				directionY = data.y;
				$('#header').html("X= " + eval(directionX) + " Y= " + eval(directionY) + "x= " + posX + " y= " + posY);
				
				moveSnake();
			}
		});
	}

	function isMoved() {
		return (coords.indexOf(posX + "," + posY + " ") < 0);
	}
	
	function wasLastPosition() {
		return (coords.indexOf(posX + "," + posY + " ") === coords.length);
	}
	
	function rememberPathTaken() {
		coordsToClear.push(posX + "," + posY + " ");
		coords[index] = (posX + "," + posY + " ");
		index++;
		if(index > memoryOfPath) {
			index = 0;
		}
	}
	
	function forceMove() {
		var findAWay = Math.floor(Math.random() * 4);
		red = changeColor();
		green = changeColor();
		blue = changeColor();
		switch(findAWay) {
		case 0:
			if(posX > 0) {
				posX = posX - movingSpeed;
				if(wasLastPosition() === true) {
					posX = posX + movingSpeed;
				}
				draw();
			}
			break;
		case 1:
			if(posX < 475) {
				posX = posX + movingSpeed;
				if(wasLastPosition() === true) {
					posX = posX - movingSpeed;
				}
				draw();
			}
			break;
		case 2:
			if(posY > 0) {
				posY = posY - movingSpeed;
				if(wasLastPosition() === true) {
					posY = posY + movingSpeed;
				}
				draw();
			}
			break;
		case 3:
			if(posY < 475) {
				posY = posY + movingSpeed;
				if(wasLastPosition() === true) {
					posY = posY - movingSpeed;
				}
				draw();
			}
			break;
		}
	}
	
	function moveXLeft() {
		if (directionY === 0 && posX > 0) {
			posX = posX - movingSpeed;
			if(isMoved() !== true) {
				posX = posX + movingSpeed;
				return false;
			} else {
				draw();
				return true;
			}
		}
		return false;
	}
	
	function moveXRight() {
		if (directionY === 0 && posX < 425){
			posX = posX + movingSpeed;
			if(isMoved() !== true) {
				posX = posX - movingSpeed;
				return false;
			} else {
				draw();
				return true;
			}
		}
		return false;
	}
	
	function moveYUp() {
		if (directionX === 0 && posY > 0){
			posY = posY - movingSpeed;
			if(isMoved() !== true) {
				posY = posY + movingSpeed;
				return false;
			} else {
				draw();
				return true;
			}
		}
		return false;
	}
	
	function moveYDown() {
		if (directionX === 0 && posY < 425) {
			posY = posY + movingSpeed;
			if(isMoved() !== true) {
				posY = posY - movingSpeed;
				return false;
			} else {
				draw();
				return true;
			}
		}
		return false;
	}

	function moveSnake() {
		var moveAllowed = false;
		switch (directionX) {
		case -1:
			moveAllowed = moveXLeft();
			break;
		case 1:
			moveAllowed = moveXRight();
			break;
		default:
			break;
		}
		switch (directionY) {
		case -1:
			moveAllowed = moveYUp();
			break;
		case 1:
			moveAllowed = moveYDown();
			break;
		default:
			break;
		}
		
		if(moveAllowed === false) {
			roadblockCounter++;
		} else {
			roadblockCounter = 0;
		}
		if(roadblockCounter > 50 && moveAllowed === false) {
			roadblockCounter = 0;
			forceMove();
		}
	}

	function changeColor() {
		return Math.floor(Math.random() * 255);
	}

	function clear() {
		if(coordsToClear.length > 19) {
			var x = firstPart.exec(coordsToClear[coordsToClear.length - 20]);
			var y = secondPart.exec(coordsToClear[coordsToClear.length - 20]);
			ctx.fillStyle = "rgb(255,255,255)";
			ctx.fillRect(x, y, 25, 25);
		}
	}

	function draw() {
		rememberPathTaken();
		clear();
		
		ctx.fillStyle = "rgb(" + red + ", " + green + ", " + blue + ")";
		ctx.fillRect(posX, posY, 25, 25);
	}
</script>

<style type="text/css">
canvas {
	border: 1px solid black;
}
</style>
</head>
<body onload="init();">
<a href="/reQuest">Color scheme</a>
<a href="/reQuest/snake">Snake</a>
<a href="/reQuest/game">Game</a>
	<h2 id="header"></h2>
	<canvas id="board" width="450" height="450"></canvas>
	<h2 id="footer"></h2>
</body>
</html>
