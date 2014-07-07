package parts;

public abstract class Monster{
    String name;
    double health;
    MonsterType type;
    int level;

    public String getName() {
        return name;
    }

    public double getHealth() {
        return health;
    }

    public MonsterType getType() {
        return type;
    }

    public int getLevel() {
        return level;
    }

    public void setName(String name) {
        this.name = name;
    }

    public void setHealth(double health) {
        this.health = health;
    }

    public void setType(MonsterType type) {
        this.type = type;
    }

    public void setLevel(int level) {
        this.level = level;
    }

    public abstract void usePotion();

    public abstract void gotAttacked(double damage);
}
