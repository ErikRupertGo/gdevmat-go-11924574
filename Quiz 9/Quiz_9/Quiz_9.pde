import java.util.List;
import java.util.ArrayList;

List<Matter> matters;

private static final PVector pushForce = new PVector(0.2, 0);

void setup() {
    size(1280, 720, P3D);
    camera(0, 0, -(720/2.0) / tan(PI*30.0 / 180.0), 0, 0, 0, 0, -1, 0);

    matters = new ArrayList<Matter>(10);
    for (int i = 0; i < 8; i++)
        matters.add(new Matter(
            Window.left + 70,
            2 * (Window.windowHeight / 8) * (i - (8 / 2)),
            i + 1
        ));
    
}

void draw() {
    clear();

    matters.forEach(m -> {
        m.applyForce(pushForce);
        m.draw();
    });

}

void mouseClicked() {
    matters.forEach(m -> m.resetPos());
}
