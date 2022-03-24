public class Walker {
    private PVector position;
    private PVector velocity = new PVector();
    private PVector targetPosition = new PVector();
    private PVector acceleration = new PVector();

    public float scale;

    public Walker(PVector position) {
        this.position = position;
        scale = random(1, 20);
    }

    public Walker(float x, float y) {
        this(new PVector(x, y));
    }

    public Walker() {
        // this(0,0);
        this(random(Window.left, Window.right), random(Window.bottom, Window.top));
    }

    public void draw() {
        targetPosition = new PVector(mouseX - Window.windowWidth, -(mouseY - Window.windowHeight));

        PVector direction = getDirectionToTarget().mult(0.2);
        velocity.add(direction).limit(10);

        position.add(velocity);

        noStroke();
        circle(position.x, position.y, scale);
        edging();
    }

    private PVector getDirectionToTarget() {
        PVector returnVal = PVector.sub(targetPosition, position);

        return returnVal.normalize();
    }

    private void edging() {
        if (position.x < Window.left)
            position.x = Window.right;

        if (position.x > Window.right)
            position.x = Window.left;

        if (position.y < Window.bottom)
            position.y = Window.top;

        if (position.y > Window.top)
            position.y = Window.bottom;
    }
}
