public class Liquid {
    public float x, y;
    public float horizon, depth;
    public float drag;
    
    public Liquid(float x, float y, float h, float depth, float drag) {
        this.x = x;
        this.y = y;
        this.horizon = h;
        this.depth = depth;
        this.drag = drag;
    }
    
    public void draw() {
        fill(28, 120, 186);
        noStroke();
        
        beginShape();
        vertex(x - horizon, y, 0);
        vertex(x + horizon, y, 0);
        vertex(x + horizon, y + depth, 0);
        vertex(x - horizon, y + depth, 0);
        endShape();
    }
    
    public boolean isCollidingWith(Matter m) {
        var p = m.position;
        return p.x > x - horizon &&
                p.x < x + horizon &&
                p.y < y;
    }
    
    public PVector calcDrag(Matter m) {
        float speed = m.velocity.mag();
        float dragMag = drag * speed * speed;
        
        var dForce = m.velocity.copy().mult(-1);
        
        return dForce.normalize().mult(dragMag);
    }
}
