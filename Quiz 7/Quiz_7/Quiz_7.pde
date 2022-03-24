import java.util.List;
import java.util.ArrayList;

List<Walker> matters;

void setup() {
    size(1280, 720, P3D);
    camera(0, 0, -(720/2.0) / tan(PI*30.0 / 180.0), 0, 0, 0, 0, -1, 0);

    matters = new ArrayList<Walker>(100);
    for (int i = 0; i < 100; i++)
        matters.add(new Walker());
    
}

void draw() {
    clear();

    matters.forEach(m -> m.draw());

}
