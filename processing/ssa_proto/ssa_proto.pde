float angle = 0.;
float azim  = 0.;

PVector cam;

Ray test;

void setup() {
  size(500, 500, P3D);
  smooth(6);
  sphereDetail(5, 5);  
  test = new Ray(90, 0);
  cam = new PVector(0, 0, 500);
  mouseDragged();
}

void draw() {
  background(0);
  camera( cam.x, cam.y, cam.z, 0, 0, 0, 0, -1, 0 );
  strokeWeight(0.5);
  stroke(255, 0, 0);
  line(0, 0, 0, 500, 0, 0); //x
  stroke(0, 255, 0);
  line(0, 0, 0, 0, 500, 0); //y
  stroke(0, 0, 255);
  line(0, 0, 0, 0, 0, 500); //z
  test.draw();
  lights();
  fill(111, 111, 122, 111);
  stroke(111, 255, 122); strokeWeight(0.5);
  sphere(100);
  
  test.moveBy(1, 0);
}

void mouseDragged() {
  float diff = pmouseX - mouseX;
  angle += diff * 0.6;
  diff = pmouseY - mouseY;
  azim  -= diff * 0.6;
  cam.x = 300 * cos(radians(angle)) * cos(radians(azim));
  cam.y = 300 * cos(radians(angle)) * sin(radians(azim));
  cam.z = 300 * sin(radians(angle));
}

void mouseWheel(MouseEvent event) {
}
