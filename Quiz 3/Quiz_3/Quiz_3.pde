void setup() {
    size(1280, 720, P3D);
    camera(0, 0, -(height/2.0) / tan(PI * 30.0f / 180.0f), 0, 0, 0, 0, -1, 0);
    background(0);
}

void draw() {

    noStroke();
    fill(
        random(0, 255),
        random(0, 255),
        random(0, 255),
        random(10, 100)
    );

    circle(giveGaussNum(150, 0), random(-(720/2), 720/2), giveGaussNum(30, 5));

    if (frameCount >= 300) {
        clear();
        frameCount = 0;
    }

}

float giveGaussNum(float sDeviation, float mean){
    return randomGaussian() * sDeviation + mean;
}
