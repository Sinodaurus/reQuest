<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ page session="false"%>
<html>
<head>
<script type="text/javascript"
	src="http://code.jquery.com/jquery-1.10.1.min.js"></script>
<script src="/reQuest/scripts/entities.js"></script>
<script src="/reQuest/scripts/game.js"></script>
<script type="text/javascript">
	$(document).ready(function(e) {
		var player = new Player(1);
// 		alert(player);
// 		alert(newGun);
		player.addGun(new Gun(GUNS.TYPE1));
// 		alert(player.getGuns());
		var game = new Game();
		game.init();
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