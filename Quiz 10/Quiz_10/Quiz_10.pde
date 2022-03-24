import java.util.List;
import java.util.ArrayList;

Liquid sea = new Liquid(0, -100, Window.right, Window.bottom, 0.1f);
Matter m = new Matter(0, 400, 5);

List<Matter> matters = new ArrayList();

void setup() {
    size(1280, 720, P3D);
    camera(0, 0, -(720/2.0) / tan(PI*30.0 / 180.0), 0, 0, 0, 0, -1, 0);
    
    for (int i = 0; i < 10; i++)
           matters.add(
               new Matter(
                   2 * (Window.windowWidth / 10) * (i - (10 / 2)),
                   400,
                   10 - i)
           );
}

void draw() {
    background(0);
    
    sea.draw();
    
    matters.forEach(m -> {
        m.applyForce(new PVector(0, -0.15f * m.getMass()));
        m.applyForce(new PVector(0.1, 0));
        if (!sea.isCollidingWith(m)) return;
        m.applyForce(sea.calcDrag(m));
    });
    
    //separate so i can separate computations from draw
    matters.forEach(m -> m.draw());
    
}
