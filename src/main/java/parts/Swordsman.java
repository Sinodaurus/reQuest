package parts;

public class Swordsman extends Monster {

	@Override
	public void usePotion() {
		health += level * 5;		
	}

	@Override
	public void gotAttacked(double damage) {
		health -= damage;
	}

}
