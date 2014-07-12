var GUNS = {
		TYPE1 : {name: "Pidgeon Blaster", dmg: 5},
		TYPE2 : {name: "Cat Decapitator", dmg: 10}
};

var SHIELDS = {
		ABSORB : {name: "Windshield", amount: 20},
		REFLECT : {name: "Ricochet", amount: 20}
};

Function.prototype.inheritsFrom = function( parentClassOrObject ){ 
	if ( parentClassOrObject.constructor == Function ) 
	{ 
		//Normal Inheritance 
		this.prototype = new parentClassOrObject;
		this.prototype.constructor = this;
		this.prototype.parent = parentClassOrObject.prototype;
	} 
	else 
	{ 
		//Pure Virtual Inheritance 
		this.prototype = parentClassOrObject;
		this.prototype.constructor = this;
		this.prototype.parent = parentClassOrObject;
	} 
	return this;
}

//					------------------------  BODY -------------------------------

function Body(number) {
	this.alive = true;
	this.number = number;
	this.guns = new Array();
}
Body.prototype.dimensions = function(height, width) {
	this.height = height;
	this.width = width;
}
Body.prototype.location = function(x, y) {
	this.x = x;
	this.y = y;
}
Body.prototype.health = function(health) {
	this.health = health;
}
Body.prototype.texture = function(texture) {
	this.texture = texture;
}
Body.prototype.shields = function(shield) {
	this.shield = shield;
}
Body.prototype.addGun = function(gun) {
	this.guns.push(gun);
}
Body.prototype.getGuns = function() {
	return this.guns;
}
Body.prototype.toString = function() {
	return "id: " + this.number + " ... height: " + this.height + " ... width: " + this.width + " ... Alive: " + this.alive;
}

//					------------------------  PLAYER -------------------------------

function Player(number) {
	this.number = "Player " + number;
}
Player.inheritsFrom(Body);

//					------------------------  CONSUMABLE -------------------------------

function Consumable() {
	this.duration = 10;
}
Consumable.prototype.toString = function() {
	return this.type.name + " ... dmg: " + this.type.dmg;
}

//					------------------------  GUN -------------------------------

function Gun(type) {
	this.type = type;
}
Gun.inheritsFrom(Consumable);

//					------------------------  SHIELD -------------------------------

function Shield(type) {
	this.type = type;
}
Shield.inheritsFrom(Consumable);

