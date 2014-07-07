<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ page session="false"%>
<html>
<head>
<script type="text/javascript"
	src="http://code.jquery.com/jquery-1.10.1.min.js"></script>
<script type="text/javascript">
	var ctx;
	var x;
	var y;
	var global = 0;

	function init() {
		var canvas = document.getElementById('board');
		if (canvas.getContext) {
			ctx = canvas.getContext('2d');
			random();
		}
	}

	function random() {
		setInterval(ajax, 1);
	}

	function ajax() {
		$.ajax({
			url : 'colorAjax.html',
			success : function(data) {
				$('#header').html("X= " + data.x + " Y= " + data.y);
				x = data.x;
				y = data.y;
				draw();
			}
		});

	}

	function draw() {
		// 		ctx.clearRect(0, 0, 150, 150);

		var red = Math.ceil((x / 168) * 100);
		var green = Math.ceil((y / 168) * 100);
		var blue = Math.ceil((y / 168) * 100);
		ctx.fillStyle = "rgb(" + eval(red) + ", " + eval(green) + ", " + eval(blue) + ")";
		ctx.fillRect(x - 25, y - 25, 25, 25);
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
</body>
</html>
