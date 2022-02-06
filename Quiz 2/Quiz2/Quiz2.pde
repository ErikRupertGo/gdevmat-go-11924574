void setup() {
  size(1280, 720, P3D);
  camera(0, 0, -(height/2.0) / tan(PI * 30.0f / 180.0f), 0, 0, 0, 0, -1, 0);
  gl_walker = new Walker();
  gl_biased = new Biased();
}

Walker gl_walker;
Walker gl_biased;

void draw() {
    gl_walker.draw();
    gl_biased.draw();
}