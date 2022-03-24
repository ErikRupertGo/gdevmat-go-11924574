import java.util.List;
import java.util.ArrayList;

private List<Matter> matters = new ArrayList();

void setup() {
    size(1280, 720, P3D);
    camera(0, 0, -(720/2.0) / tan(PI*30.0 / 180.0), 0, 0, 0, 0, -1, 0);
    
    for (int i = 0; i < 10; i++) {
        matters.add(new Matter(
                            random(Window.left, Window.right),
                            random(Window.bottom, Window.top),
                            (int)random(5, 10)
                        )
            );
    }
}

void draw() {
    clear();
    for (var fm : matters) {
        for (var sm : matters) {
            if (sm.equals(fm)) continue;
            
            fm.applyForce(sm.calcAttraction(fm));
            sm.applyForce(fm.calcAttraction(sm));
        }
    }
    
    matters.forEach(m -> m.draw());
}
