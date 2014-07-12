function Game() {
	var level;
	var player;
	var levelImg;
	var playerImg;
	var ctxLevel;
	var ctxPlayer;
}
Game.prototype.init = function() {
	level = document.getElementById('level');
	player = document.getElementById('player');
	if (level.getContext) {
		levelImg = new Image();
		ctxLevel = level.getContext('2d');
		levelImg.src =  "/reQuest/img/levelForest.png";
		levelImg.onload = function() {
			ctxLevel.drawImage(levelImg, 0, 0);
		}
		
	}
	if (player.getContext) {
		playerImg = new Image();
		ctxPlayer = player.getContext('2d');
		playerImg.src = "/reQuest/img/hero.png";
		playerImg.onload = function() {
			ctxPlayer.drawImage(playerImg, 0, 0);
		}
	}
}
Game.prototype.drawBackground = function() {
	this.ctxLevel.drawImage(levelImg, 0, 0);
}
Game.prototype.drawPlayer = function() {
	this.ctxPlayer.drawImage(playerImg, 0, 0);
}