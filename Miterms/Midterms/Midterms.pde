import java.util.LinkedList;
import java.util.List;

List<Matter> allMaMatter = new LinkedList<>();

BlackHole holemo = new BlackHole();

void setup() {
    size(1080, 720, P3D);
    camera(0, 0, -(720/2.0) / tan(PI*30.0 / 180.0), 0, 0, 0, 0, -1, 0);

    for (int i = 0; i < 100; i++)
        allMaMatter.add(new Matter(randomGaussian() * Window.windowWidth, randomGaussian() * Window.windowHeight));

}

void draw() {
    background(0);

    allMaMatter.forEach(m -> {
            m.updateTarget(holemo.getPosition());
            m.draw();
        });

    holemo.draw();

    if (frameCount % 225 == 0) {
        allMaMatter.forEach(m -> m.updatePosition(new PVector(randomGaussian() * Window.windowWidth, randomGaussian() * Window.windowHeight)));
    }
}
