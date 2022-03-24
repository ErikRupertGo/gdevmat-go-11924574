public class Matter {
    private float mew = 0.1f;
    private float normalForce = 1.0f;

    private PVector position;
    private PVector velocity = new PVector();
    private PVector acceleration = new PVector();

    private PVector mColor;

    public float scale;
    private int mass;
    
    private float gravConstant = 1.0f;

    public Matter(PVector position, int mass) {
        this.position = position;
        this.mass = mass;
        scale = mass * 15;

        mColor = new PVector(random(0, 255), random(0, 255), random(0, 255));

        //normalForce = mass * 0.30;
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

    private void applyFrictionalForce() {
        PVector f = velocity.copy()
                            .mult(-1)
                            .normalize()
                            .mult(mew * normalForce);

        applyForce(f);

    }

    public void draw() {
        velocity.add(acceleration).limit(10);

        position.add(velocity);
        acceleration.mult(0);

        //applyFrictionalForce();

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

    public int getMass() { return mass; }

    public void resetPos() { 
        position.x = Window.left;
        velocity.mult(0);
    }
    
    public PVector calcAttraction(Matter m) {
        var f = PVector.sub(position, m.position);
        var dist = f.mag();
        f.normalize();
        
        dist = constrain(dist, 5, 25);
        
        var strength = (gravConstant * mass * m.getMass()) / (dist * dist);
        f.mult(strength);
        return f;
    }
}
