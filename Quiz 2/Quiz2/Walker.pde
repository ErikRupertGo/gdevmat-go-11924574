public class Walker {
    protected float x;
    protected float y;
    protected int increment = 10;

    public void walk() {
      int numy = int(random(3));
      int numx = int(random(3));

        switch (numy) {
            case 0:
                y += increment;
                break;
            case 1:
                y -= increment;
                break;
            default :

                break;	
        }

        switch (numx) {
            case 0:
                x += increment;
                break;
            case 1:
                x -= increment;
                break;
            default :
                break;
        }
        
    }

    public void draw() {
        walk();
        fill(
            random(256),
            random(256),
            random(256),
            random(50, 100)
        );
        noStroke();
        circle(x, y, 20);
    }
}
