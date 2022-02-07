void setup() {
  size(1280, 720, P3D);
  camera(0, 0, -(height / 2.0) / tan(PI * 30.0 / 180.0), 0, 0, 0, 0, -1, 0);
}

float currentPhase = 0;

void draw() {
   background(0);
   circle(0, 0, 10);

  //  strokeWeight(2);
  //  color white = color(255, 255, 255);
  //  fill(white);
  //  stroke(white);
  //  line(-100, -75, 100, 100);
   
  drawCartesianPlane();
  //Number 1
  drawFunction( x -> (float)Math.pow(x, 2) - (15 * x) - 3, color(255, 255, 0));
  
  //Number 2
  drawFunction( x -> -(5.0f * x) + 30.0f, color(255, 0, 255));

  //Number 3
  drawFunction( x -> sin((x * 0.2) + (currentPhase += 0.5f)) * 30, color(255, 255, 0));

  // drawSineWave(currentPhase += 0.5f);
}

boolean drawCartesianPlane() {
  strokeWeight(1);
  color white = color(255, 255, 255);
  fill (white);
  stroke(white);
  line (300, 0, -300, 0);
  line (0, -300, 0, 300);
  
  for (var i = -300; i < 300; i += 10) {
    line (i, -2, i, 2);
    line (-2, i, 2, i);
  }
  return true;
}

void drawFunction(Function f, color col) {
  // color col = color (255, 0, 255);
  fill(col);
  stroke(col);
  noStroke();

  for (float x = -200; x <= 200; x += 0.1f) {
    float y = f.provide(x);
    circle(x, y, 5);
  }
}

void drawSineWave(float phase){
  color col = color (255, 255, 0);
  fill(col);
  stroke(col);
  noStroke();

  for (float x = -200; x <= 200; x += 0.1f) {
    float y = sin((x * 0.2) + phase) * 30;
    circle (x , y, 5);
  }
}
