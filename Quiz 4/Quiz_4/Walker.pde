    public class Walker {
    protected float x;
    protected float y;
    protected int increment = 10;
    protected float tX = 0;
    protected float tY = 1000;
    private float scaleT = 0;
    private float colorTR = 500;
    private float colorTG = 2000;
    private float colorTB = 5000;

    private float getNoise(float val, float minV, float maxV) {
        return map(noise(val), 0, 1, minV, maxV);
    }

    public void walk() {
        x = getNoise(tX, -640, 640);
        y = getNoise(tY, -360, 360);
    }

    public void draw() {
        walk();
        fill(
            getNoise(colorTR, 0, 255),
            getNoise(colorTG, 0, 255),
            getNoise(colorTB, 0, 255),
            255
        );
        noStroke();
        circle(x, y, getNoise(scaleT, 5, 150));

        tX += 0.01f;
        tY += 0.01f;
        scaleT += 0.02f;
        colorTR += 0.05f;
        colorTG += 0.07;
        colorTB += 0.1f;
        
    }
}
