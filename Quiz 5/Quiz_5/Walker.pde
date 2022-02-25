public class Walker {
    protected PVector position;
    protected PVector speed;
    protected int increment = 10;

    public Walker(PVector pos) {
        position = pos;
        speed = new PVector(5, 8);
    }

    public Walker(float x, float y) {
        this(new PVector(x, y));
    }

    public Walker() {
        this(0, 0);
    }

    private void moveAndBounce() {
        position.add(speed);

        if ((position.x > 1280/2) || (position.x < Window.left)) 
            speed.x *= -1;

        if ((position.y > Window.top) || (position.y < Window.bottom)) 
            speed.y *= -1;
            
    }

    public void walk() {
        moveAndBounce();
    }

    public void draw() {
        walk();
        fill(
            255
        );
        noStroke();
        circle(position.x, position.y, 20);
    }
}
