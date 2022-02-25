void setup() {
    size(1080, 720, P3D);
    camera(0, 0, -(720/2.0) / tan(PI*30.0 / 180.0), 0, 0, 0, 0, -1, 0);
}

PVector mousePosition() {
    float x = mouseX - Window.windowWidth;
    float y = -(mouseY - Window.windowHeight);
    return new PVector(x, y);
}

void draw() {
    background(125);

    //To mouse
        //OuterGlow
    strokeWeight(15);
    stroke(255, 0, 0, 255);
    var mousePos = mousePosition().normalize().mult(500);

    println(mousePos.mag());

    line(0, 0, mousePos.x, mousePos.y);

        //Inner Glow
    strokeWeight(7);
    stroke(255, 255, 255, 255);

    line(0, 0, mousePos.x, mousePos.y);

    //away from mouse
        //OuterGlow
    var outerVec = mousePos.mult(-1);
    strokeWeight(15);
    stroke(255, 0, 0, 255);

    line(0, 0, mousePos.x, mousePos.y);

    strokeWeight(7);
    stroke(255, 255, 255, 255);

    line(0, 0, mousePos.x, mousePos.y);

    //Handle
        //to Mouse
    var posForHandle = mousePosition().normalize().mult(100);

    strokeWeight(20);
    stroke(0, 0, 0, 255);

    line(0, 0, posForHandle.x, posForHandle.y);

        //Away from Mouse
    posForHandle = posForHandle.mult(-1);

    strokeWeight(20);
    stroke(0, 0, 0, 255);

    line(0, 0, posForHandle.x, posForHandle.y);
}
