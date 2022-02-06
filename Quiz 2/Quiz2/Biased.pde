public class Biased extends Walker {
    public void walk() {
        move();
    }

    private void move() {
        if (determine(40)) {
            x += increment;
            return;
        }

        if (determine(20)) {
            x -= increment;
            return;
        }

        if (determine(20)) {
            y += increment;
            return;
        }

        if (determine(20)) {
            y -= increment;
        }
    }

    private boolean determine(int chance) {
        if (chance > 100 || chance < 0) throw new IllegalArgumentException();

        return int(random(100) + 1) <= chance;
    }
}
