public class Matter {

    private PVector position;
    private PVector velocity = new PVector();
    private PVector acceleration = new PVector();

    private PVector mColor;

    public float scale;
    private int mass;

    public Matter(PVector position, int mass) {
        this.position = position;
        this.mass = mass;
        scale = mass * 15;

        mColor = new PVector(random(0, 255), random(0, 255), random(0, 255));
    }

    public Matter(float x, float y, int mass) {
        this(new PVector(x, y), mass);
    }

    public Matter(int mass) {
        this(-500, 200, mass);
    }

    public void applyForce(PVector force) {
        PVector f = PVector.div(force, mass);
        acceleration.add(f);
    }

    public void draw() {
        velocity.add(acceleration).limit(10);

        position.add(velocity);
        acceleration.mult(0);

        edging();
        noStroke();
        fill(mColor.x, mColor.y, mColor.z);
        circle(position.x, position.y, scale);
    }

    private void edging() {
        if (position.x <= Window.left) {
            position.x = Window.left;
            this.velocity.x *= -1;
        }

        if (position.x >= Window.right) {
            position.x = Window.right;
            this.velocity.x *= -1;
        }

        if (position.y <= Window.bottom) {
            this.position.y = Window.bottom;
            this.velocity.y *= -1;
        }

        if (position.y >= Window.top) {
            this.position.y = Window.top;
            this.velocity.y *= -1;
        }
    }
}
