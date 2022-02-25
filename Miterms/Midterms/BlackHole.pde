public class BlackHole {
    private PVector position;
    
    public BlackHole (float x, float y) {
        position = new PVector(x, y);
    }

    public BlackHole () {
        this(random(-(1280 / 2), 1280 / 2), random(-(720 / 2), 720 / 2));
    }

    public PVector getPosition() { return position; }

    public void updatePosition(PVector newPosition) {
        position = newPosition;
    }

    public void draw() {
        position = new PVector(mouseX - Window.windowWidth, -(mouseY - Window.windowHeight));

        fill(255);
        noStroke();

        circle(position.x, position.y, 50);
    }
}