public class Matter {
    private PVector target;
    private PVector position;
    private PVector mColor;
    private int thickness;

    public Matter(float x, float y) {
        position = new PVector(x, y);

        mColor = new PVector(
            random(0, 255),
            random(0, 255),
            random(0, 255)
        );

        thickness = (int)random(10, 50);
    }

    public void updateTarget(PVector newtarget) {
        target = newtarget;
    }

    private void updatePosition(PVector newposition) {
        position = newposition;
    }

    public void draw() {
        moveToTarget();

        fill(
            mColor.x,
            mColor.y,
            mColor.z,
            255
        );
        noStroke();

        circle(position.x, position.y, thickness);
    }

    private void moveToTarget() {
        position.add(getVectorToTarget(10));
    }

    private PVector getVectorToTarget(int magnitude) {
        PVector returnVal = PVector.sub(target, position);

        return returnVal.normalize().mult(magnitude);
    }
}
