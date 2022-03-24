import java.util.List;
import java.util.ArrayList;

List<Matter> matters;

private static final PVector wind = new PVector(0.15, 0);
private static final PVector gravity = new PVector(0, -0.4);

void setup() {
    size(1280, 720, P3D);
    camera(0, 0, -(720/2.0) / tan(PI*30.0 / 180.0), 0, 0, 0, 0, -1, 0);

    matters = new ArrayList<Matter>(10);
    for (int i = 0; i < 10; i++)
        matters.add(new Matter(i + 1));
    
}

void draw() {
    clear();

    matters.forEach(m -> {
        m.applyForce(gravity);
        m.applyForce(wind);
        m.draw();
    });

}
